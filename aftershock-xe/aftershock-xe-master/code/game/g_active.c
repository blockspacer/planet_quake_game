/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
//

#include "g_local.h"


/*
===============
G_DamageFeedback

Called just before a snapshot is sent to the given player.
Totals up all damage and generates both the player_state_t
damage values to that client for pain blends and kicks, and
global pain sound events for all clients.
===============
*/
void P_DamageFeedback( gentity_t *player ) {
	gclient_t	*client;
	float	count;
	vec3_t	angles;

	client = player->client;
	if ( client->ps.pm_type == PM_DEAD ) {
		return;
	}

	// total points of damage shot at the player this frame
	count = client->damage_blood + client->damage_armor;
	if ( count == 0 ) {
		return;		// didn't take any damage
	}

	if ( count > 255 ) {
		count = 255;
	}

	// send the information to the client

	// world damage (falling, slime, etc) uses a special code
	// to make the blend blob centered instead of positional
	if ( client->damage_fromWorld ) {
		client->ps.damagePitch = 255;
		client->ps.damageYaw = 255;

		client->damage_fromWorld = qfalse;
	} else {
		vectoangles( client->damage_from, angles );
		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
		client->ps.damageYaw = angles[YAW]/360.0 * 256;
	}

	// play an apropriate pain sound ( debounce_time -> min 700 msec no new painsound )
	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
		player->pain_debounce_time = level.time + 700;
		G_AddEvent( player, EV_PAIN, player->health );
		client->ps.damageEvent++;
	}


	client->ps.damageCount = count;

	//
	// clear totals
	//
	client->damage_blood = 0;
	client->damage_armor = 0;
	client->damage_knockback = 0;
}

/*
=============
P_WorldEffects

Check for lava / slime contents and drowning
=============
*/
void P_WorldEffects( gentity_t *ent ) {
	qboolean	envirosuit;
	int			waterlevel;

	if ( ent->client->noclip ) {
		ent->client->airOutTime = level.time + 12000;	// don't need air
		return;
	}

	waterlevel = ent->waterlevel;

	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;

	//
	// check for drowning
	//
	if ( waterlevel == 3 ) {
		// envirosuit give air
		if ( envirosuit ) {
			ent->client->airOutTime = level.time + 10000;
		}

		// if out of air, start drowning
		if ( ent->client->airOutTime < level.time) {
			// drown!
			ent->client->airOutTime += 1000;
			if ( ent->health > 0 ) {
				// take more damage the longer underwater
				ent->damage += 2;
				if (ent->damage > 15)
					ent->damage = 15;

				// play a gurp sound instead of a normal pain sound
				if (ent->health <= ent->damage) {
					G_Sound(ent, CHAN_VOICE, G_SoundIndex("*drown.wav"));
				} else if (rand()&1) {
					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp1.wav"));
				} else {
					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp2.wav"));
				}

				// don't play a normal pain sound
				ent->pain_debounce_time = level.time + 200;

				G_Damage (ent, NULL, NULL, NULL, NULL, 
					ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
			}
		}
	} else {
		ent->client->airOutTime = level.time + 12000;
		ent->damage = 2;
	}

	//
	// check for sizzle damage (move to pmove?)
	//
	if (waterlevel && 
		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
		if (ent->health > 0
			&& ent->pain_debounce_time <= level.time	) {
			//damage every 500msec, this removes the old buggy lava
			ent->pain_debounce_time = level.time + 500;
			if ( envirosuit ) {
				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
			} else {
				if (ent->watertype & CONTENTS_LAVA) {
					G_Damage (ent, NULL, NULL, NULL, NULL, 
						//30*waterlevel, 0, MOD_LAVA);
						  15*waterlevel, 0, MOD_LAVA);
				}

				if (ent->watertype & CONTENTS_SLIME) {
					G_Damage (ent, NULL, NULL, NULL, NULL, 
						//10*waterlevel, 0, MOD_SLIME);
						  5*waterlevel, 0, MOD_SLIME);
				}
			}
		}
	}
}



/*
===============
G_SetClientSound
===============
*/
void G_SetClientSound( gentity_t *ent ) {
	if( ent->s.eFlags & EF_TICKING ) {
		ent->client->ps.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav");
	} else if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
		ent->client->ps.loopSound = level.snd_fry;
	} else {
		ent->client->ps.loopSound = 0;
	}
}



//==============================================================

/*
==============
ClientImpacts
Calls the touch-function if an entity touches another
==============
*/
void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
	int		i, j;
	trace_t	trace;
	gentity_t	*other;

	memset( &trace, 0, sizeof( trace ) );
	for (i=0 ; i<pm->numtouch ; i++) {
		for (j=0 ; j<i ; j++) {
			if (pm->touchents[j] == pm->touchents[i] ) {
				break;
			}
		}
		if (j != i) {
			continue;	// duplicated
		}
		other = &g_entities[ pm->touchents[i] ];

		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
			ent->touch( ent, other, &trace );
		}

		if ( !other->touch ) {
			continue;
		}

		other->touch( other, ent, &trace );
	}

}

/*
============
G_TouchTriggers

Find all trigger entities that ent's current position touches.
Spectators will only interact with teleporters.
============
*/
void	G_TouchTriggers( gentity_t *ent ) {
	int			i, num;
	int			touch[MAX_GENTITIES];
	gentity_t	*hit;
	trace_t		trace;
	vec3_t		mins, maxs;
	static vec3_t	range = { 40, 40, 52 };

	if ( !ent->client ) {
		return;
	}

	//ELIMINATION LMS
	// dead clients don't activate triggers! The reason our pm_spectators can't do anything
	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 && ent->client->ps.pm_type != PM_SPECTATOR) {
		return;
	}

	VectorSubtract( ent->client->ps.origin, range, mins );
	VectorAdd( ent->client->ps.origin, range, maxs );
	//How many entities touch the entity? Save in touch
	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );

	// can't use ent->absmin, because that has a one unit pad
	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );

	for ( i=0 ; i<num ; i++ ) {
		hit = &g_entities[touch[i]];

		if ( !hit->touch && !ent->touch ) {
			continue;
		}
		if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) {
			continue;
		}

		// ignore most entities if a spectator
		if ( (ent->client->sess.sessionTeam == TEAM_SPECTATOR) || ent->client->ps.pm_type == PM_SPECTATOR ) {
			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
				// this is ugly but adding a new ET_? type will
				// most likely cause network incompatibilities
				//We need to stop eliminated players from opening doors somewhere else /Sago007 20070814
				hit->touch != Touch_DoorTrigger ) {
				continue;
			}
		}

		// use seperate code for determining if an item is picked up
		// so you don't have to actually contact its bounding box
		if ( hit->s.eType == ET_ITEM ) {
			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time, g_newItemHeight.integer ) ) {
				continue;
			}
		} else {
			if ( !trap_EntityContact( mins, maxs, hit ) ) {
				continue;
			}
		}

		memset( &trace, 0, sizeof(trace) );

		if ( hit->touch ) {
			hit->touch (hit, ent, &trace);
		}

		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
			ent->touch( ent, hit, &trace );
		}
	}

	// if we didn't touch a jump pad this pmove frame
	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
		ent->client->ps.jumppad_frame = 0;
		ent->client->ps.jumppad_ent = 0;
	}
}

/*
=================
SpectatorThink
=================
*/
void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
	pmove_t	pm;
	gclient_t	*client;

	client = ent->client;
	
	//If playing and in freespec, follow the next player(if lockspectator is enabled)
        if ( ( g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION) &&
                client->sess.spectatorState != SPECTATOR_FOLLOW &&
                g_elimination_lockspectator.integer>1 &&
                ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
            Cmd_FollowCycle_f(ent);
        }

	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
		client->ps.pm_type = PM_SPECTATOR;
		//TODO: client cvar to change specspeed
		client->ps.speed = 2.5*g_speed.integer;	// faster than normal

		// set up for pmove
		memset (&pm, 0, sizeof(pm));
		pm.ps = &client->ps;
		pm.cmd = *ucmd;
		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
		pm.trace = trap_Trace;
		pm.pointcontents = trap_PointContents;

		// perform a pmove
		Pmove (&pm);
		// save results of pmove
		VectorCopy( client->ps.origin, ent->s.origin );

		G_TouchTriggers( ent );
		trap_UnlinkEntity( ent );
	}

	/* Stopped players from going into follow mode in B5, should be fixed in B9
	if(ent->client->sess.sessionTeam != TEAM_SPECTATOR && g_gametype.integer>=GT_ELIMINATION && g_gametype.integer<=GT_LMS)
		return;
	*/
	
	client->oldbuttons = client->buttons;
	client->buttons = ucmd->buttons;
	
    //KK-OAX Changed to keep followcycle functional
	// attack button cycles through spectators
	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
		Cmd_FollowCycle_f( ent );
	}
	
	//TODO: Add button to reverse cycle through spectators

	if ( ( client->buttons & BUTTON_USE_HOLDABLE ) && ! ( client->oldbuttons & BUTTON_USE_HOLDABLE ) ) {
		if ( ( g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION) &&
			g_elimination_lockspectator.integer>1 &&
			ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
				return;
                }
		StopFollowing(ent);
	}
}



/*
=================
ClientInactivityTimer

Returns qfalse if the client is moved to spec
=================
*/
qboolean ClientInactivityTimer( gentity_t *ent ) {
	gclient_t *client = ent->client;
	
	//dont drop specs to speconly anymore
	if( client->sess.sessionTeam == TEAM_SPECTATOR || client->isEliminated )
		return qtrue;
	
	//Last movement for lightning accuracy reward
	if ( client->pers.cmd.forwardmove || 
		client->pers.cmd.rightmove || 
		client->pers.cmd.upmove ||
		(client->pers.cmd.buttons & BUTTON_ATTACK) ) {
		client->lastActive = level.time;
	}
  
  
	if ( !g_inactivity.integer || level.warmupTime == -1 ) {
		// give everyone some time, so if the operator sets g_inactivity during
		// gameplay, everyone isn't kicked
		client->inactivityTime = level.time + 60 * 1000;
		client->inactivityWarning = qfalse;
	} else if ( client->pers.cmd.forwardmove || 
		client->pers.cmd.rightmove || 
		client->pers.cmd.upmove ||
		(client->pers.cmd.buttons & BUTTON_ATTACK) ) {
		client->inactivityTime = level.time + g_inactivity.integer * 1000;
		client->inactivityWarning = qfalse;
	} else if ( !client->pers.localClient ) {
		if ( level.time > client->inactivityTime ) {
			//trap_DropClient( client - level.clients, "Dropped due to inactivity" );
			SetTeam( ent, "speconly" );
			//TODO: msg to clients why they are moved
			return qfalse;
		}
		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
			client->inactivityWarning = qtrue;
			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
		}
	}
	return qtrue;
}

/*
==================
ClientTimerActions

Actions that happen once a second
==================
*/
void ClientTimerActions( gentity_t *ent, int msec ) {
	gclient_t	*client;
	int			maxHealth;

	client = ent->client;
	client->timeResidual += msec;

	while ( client->timeResidual >= 1000 ) {
		client->timeResidual -= 1000;		//So this works once a second

		//Stop in elimination!!!
		if (client->ps.pm_flags & PMF_ELIMWARMUP)
			continue;

		// regenerate
		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
		}
		else if ( client->ps.powerups[PW_REGEN] ) {
			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
		}
		else {
			maxHealth = 0;
		}
		//Only called if client has regen or guard
		if( maxHealth ) {
			if ( ent->health < maxHealth ) {
				ent->health += 15;
				if ( ent->health > maxHealth * 1.1 ) {
					ent->health = maxHealth * 1.1;
				}
				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
			} else if ( ent->health < maxHealth * 2) {
				ent->health += 5;
				if ( ent->health > maxHealth * 2 ) {
					ent->health = maxHealth * 2;
				}
				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
			}
		} else {
			// count down health when over max, dont count down if gametype is CA or CS
			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] && !( g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION ) ) {
				ent->health--;
			}
			//Start killing players in LMS, if we are in overtime
			if(g_gametype.integer==GT_LMS && TeamHealthCount( -1, TEAM_FREE ) != ent->health &&(level.roundNumber==level.roundNumberStarted)&&(level.time>=level.roundStartTime+1000*g_elimination_roundtime.integer)) {
				ent->damage=5;
				G_Damage (ent, NULL, NULL, NULL, NULL, 
					ent->damage, DAMAGE_NO_ARMOR, MOD_UNKNOWN);
			}
			else
			//if lower as MAX_HEALTH regen by g_regen.integer every second
			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] ) {
				ent->health+=g_regen.integer;
				if(ent->health>client->ps.stats[STAT_MAX_HEALTH])
					ent->health= client->ps.stats[STAT_MAX_HEALTH];
			}
		}

		// count down armor when over max
		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] && !( g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION ) ) {
			client->ps.stats[STAT_ARMOR]--;
		}
	}
	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
		int w, max, inc, t, i;
		int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG
#ifdef MISSIONPACK
			,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
#else
			};
#endif
		int weapCount = sizeof(weapList) / sizeof(int);
		//
		for (i = 0; i < weapCount; i++) {
			w = weapList[i];

			switch(w) {
				case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
				case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
				case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
				case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
				case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
				case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
				case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
				case WP_BFG: max = 10; inc = 1; t = 4000; break;
#ifdef MISSIONPACK
				case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
				case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
				case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
#endif
				default: max = 0; inc = 0; t = 1000; break;
			}
			client->ammoTimes[w] += msec;
			if ( client->ps.ammo[w] >= max ) {
				client->ammoTimes[w] = 0;
			}
			if ( client->ammoTimes[w] >= t ) {
				while ( client->ammoTimes[w] >= t )
					client->ammoTimes[w] -= t;
				client->ps.ammo[w] += inc;
				if ( client->ps.ammo[w] > max ) {
				  client->ps.ammo[w] = max;
				}
			}
		}
	}
}

/*
====================
ClientIntermissionThink
====================
*/
void ClientIntermissionThink( gclient_t *client ) {
	client->ps.eFlags &= ~EF_TALK;
	client->ps.eFlags &= ~EF_FIRING;

	// the level will exit when everyone wants to or after timeouts

        if( g_entities[client->ps.clientNum].r.svFlags & SVF_BOT )
		return; //Bots cannot mark themself as ready

	// swap and latch button actions
	client->oldbuttons = client->buttons;
	client->buttons = client->pers.cmd.buttons;
	if ( ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) || g_forceIntermissionExit.integer ) {
		// this used to be an ^1 but once a player says ready, it should stick
		client->readyToExit = 1;
	}
}


/*
================
ClientEvents

Events will be passed on to the clients for presentation,
but any server game effects are handled here
================
*/
void ClientEvents( gentity_t *ent, int oldEventSequence ) {
	int		i, j;
	int		event;
	gclient_t *client;
	int		damage;
	//vec3_t	dir;
	vec3_t	origin, angles;
//	qboolean	fired;
	gitem_t *item;
	gentity_t *drop;

	client = ent->client;

	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
	}
	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];

		switch ( event ) {
		case EV_FALL_MEDIUM:
		case EV_FALL_FAR:
			if ( ent->s.eType != ET_PLAYER ) {
				break;		// not in the player model
			}
			if ( g_dmflags.integer & DF_NO_FALLING ) {
				break;
			}
			if ( event == EV_FALL_FAR ) {
				damage = 10;
			} else {
				damage = 5;
			}
			//VectorSet (dir, 0, 0, 1);
			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
			break;

		case EV_FIRE_WEAPON:
			FireWeapon( ent );
			break;

		case EV_USE_ITEM1:		// teleporter
			// drop flags in CTF
			item = NULL;
			j = 0;

			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
				item = BG_FindItemForPowerup( PW_REDFLAG );
				j = PW_REDFLAG;
			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
				item = BG_FindItemForPowerup( PW_BLUEFLAG );
				j = PW_BLUEFLAG;
			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
				j = PW_NEUTRALFLAG;
			}

			if ( item ) {
				drop = Drop_Item( ent, item, 0 );
				// decide how many seconds it has left
				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
				if ( drop->count < 1 ) {
					drop->count = 1;
				}

				ent->client->ps.powerups[ j ] = 0;
			}

			if ( g_gametype.integer == GT_HARVESTER ) {
				if ( ent->client->ps.generic1 > 0 ) {
					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
						item = BG_FindItem( "Blue Cube" );
					} else {
						item = BG_FindItem( "Red Cube" );
					}
					if ( item ) {
						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
							drop = Drop_Item( ent, item, 0 );
							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
								drop->spawnflags = TEAM_BLUE;
							} else {
								drop->spawnflags = TEAM_RED;
							}
						}
					}
					ent->client->ps.generic1 = 0;
				}
			}
      if ( level.multiArenaMap ) {
        if ( g_lockArena.integer ) {
          level.curMultiArenaMap = g_lockArena.integer;
        } else {
          level.curMultiArenaMap = ent->client->curArena;
        }
      }
			SelectSpawnPoint( ent->client->ps.origin, origin, angles );
			TeleportPlayer( ent, origin, angles );
			break;

		case EV_USE_ITEM2:		// medkit
			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;

			break;

		case EV_USE_ITEM3:		// kamikaze
			// make sure the invulnerability is off
			ent->client->invulnerabilityTime = 0;
			// start the kamikze
			G_StartKamikaze( ent );
			break;

		case EV_USE_ITEM4:		// portal
			if( ent->client->portalID ) {
				DropPortalSource( ent );
			}
			else {
				DropPortalDestination( ent );
			}
			break;
		case EV_USE_ITEM5:		// invulnerability
			ent->client->invulnerabilityTime = level.time + 10000;
			break;

		default:
			break;
		}
	}

}

/*
==============
StuckInOtherClient
returns qtrue if the client is in the same place as another client
==============
*/
static int StuckInOtherClient(gentity_t *ent) {
	int i;
	gentity_t	*ent2;

	ent2 = &g_entities[0];
	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
		if ( ent2 == ent ) {
			continue;
		}
		if ( !ent2->inuse ) {
			continue;
		}
		if ( !ent2->client ) {
			continue;
		}
		if ( ent2->health <= 0 ) {
			continue;
		}
		//
		if (ent2->r.absmin[0] > ent->r.absmax[0])
			continue;
		if (ent2->r.absmin[1] > ent->r.absmax[1])
			continue;
		if (ent2->r.absmin[2] > ent->r.absmax[2])
			continue;
		if (ent2->r.absmax[0] < ent->r.absmin[0])
			continue;
		if (ent2->r.absmax[1] < ent->r.absmin[1])
			continue;
		if (ent2->r.absmax[2] < ent->r.absmin[2])
			continue;
		return qtrue;
	}
	return qfalse;
}

void BotTestSolid(vec3_t origin);

/*
==============
SendPendingPredictableEvents
==============
*/
void SendPendingPredictableEvents( playerState_t *ps ) {
	gentity_t *t;
	int event, seq;
	int extEvent, number;

	// if there are still events pending
	if ( ps->entityEventSequence < ps->eventSequence ) {
		// create a temporary entity for this event which is sent to everyone
		// except the client who generated the event
		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
		// set external event to zero before calling BG_PlayerStateToEntityState
		extEvent = ps->externalEvent;
		ps->externalEvent = 0;
		// create temporary entity for event
		t = G_TempEntity( ps->origin, event );
		number = t->s.number;
		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
		t->s.number = number;
		t->s.eType = ET_EVENTS + event;
		t->s.eFlags |= EF_PLAYER_EVENT;
		t->s.otherEntityNum = ps->clientNum;
		// send to everyone except the client who generated the event
		t->r.svFlags |= SVF_NOTSINGLECLIENT;
		t->r.singleClient = ps->clientNum;
		// set back external event
		ps->externalEvent = extEvent;
	}
}
//Only for development use!
void WriteCoordinates( gentity_t *ent ) {
	char buffer[64];
	int lastFrame;
	fileHandle_t file;
	char gameString[128];
	char playerName[128];
	int count,j;
	char *string;
	
	if( !g_writePlayerCoords.integer )
		return;
	
	if( level.warmupTime != 0 )
		return;
	
	trap_Cvar_VariableStringBuffer(va("lastCoordFrame%i", ent->client->ps.clientNum), buffer, sizeof(buffer));
	lastFrame = atoi(buffer);
	
	if( level.framenum < lastFrame + sv_fps.integer )
		return;
	trap_Cvar_VariableStringBuffer("gamestring", gameString, sizeof(gameString));
	Com_sprintf ( playerName, sizeof ( playerName ),"%s", ent->client->pers.netname );
		count = 0;
		
		for ( j = 0; j < 128 ; j++ ) {
			if ( playerName[j] == '^' && ( ( playerName[j+1] >= '0' && playerName[j+1] <= '9' ) || ( playerName[j+1] >= 'a' && playerName[j+1] <= 'z' ) || ( playerName[j+1] >= 'A' && playerName[j+1] <= 'Z' ) ) ) {
				j++;
				continue;
			} else if ( ( ! ( playerName[j] >= '0' && playerName[j] <= '9' ) && ! ( playerName[j] >= 'a' && playerName[j] <= 'z' ) && ! ( playerName[j] >= 'A' && playerName[j] <= 'Z' ) ) ) {
				continue;
			}

			else {
				playerName[count] = playerName[j];
				count++;
			}
		}
		playerName[count] = '\0';
	
	trap_FS_FOpenFile ( va ( "%s/%s/%s.dat", "playerCoords",gameString, playerName ), &file, FS_APPEND );
	
	string = va("%i %i %i %i\n", level.time, (int) ent->client->ps.origin[0], (int) ent->client->ps.origin[1], (int) ent->client->ps.origin[2] );
	trap_FS_Write ( string, strlen ( string ), file );
	trap_FS_FCloseFile( file );
	trap_Cvar_Set(va("lastCoordFrame%i", ent->client->ps.clientNum), va("%i",level.framenum ) );
}

/*
==============
ClientThink

This will be called once for each client frame, which will
usually be a couple times for each server frame on fast clients.

If "g_synchronousClients 1" is set, this will be called exactly
once for each server frame, which makes for smooth demo recording.
==============
*/
void ClientThink_real( gentity_t *ent ) {
	gclient_t	*client;
	pmove_t		pm;
	int			oldEventSequence;
	int			msec;
	usercmd_t	*ucmd;
	//int i;
	
	//TODO:Understand if this works well, what to do with projectiles?
	if( level.timeout )
		return;

	client = ent->client;
	
	WriteCoordinates(ent);

	// don't think if the client is not yet connected (and thus not yet spawned in)
	if (client->pers.connected != CON_CONNECTED) {
		return;
	}
	// mark the time, so the connection sprite can be removed
	ucmd = &ent->client->pers.cmd;
	
	if( g_maxWarp.integer > 0 && client->warping )
	{
	    int frames = ( level.framenum - client->lastUpdateFrame );
	    int maxtime = 0;

	    if( frames > g_maxWarp.integer )
		frames = g_maxWarp.integer;

	    maxtime = ( frames  * ( level.time - level.previousTime ) );
	    //ucmd->serverTime = client->ps.commandTime + maxtime;
	    ucmd->serverTime = level.previousTime;
	    client->ps.commandTime = level.previousTime - maxtime;
	    client->warped = qtrue;
	}
	client->warping = qfalse;
	client->lastUpdateFrame = level.framenum;

	// sanity check the command time to prevent speedup cheating
	if ( ucmd->serverTime > level.time + 200 ) {
		ucmd->serverTime = level.time + 200;
//		G_Printf("serverTime <<<<<\n" );
	}
	if ( ucmd->serverTime < level.time - 1000 ) {
		ucmd->serverTime = level.time - 1000;
//		G_Printf("serverTime >>>>>\n" );
	} 

//Here comes the unlagged bit!
//unlagged - backward reconciliation #4
	// frameOffset should be about the number of milliseconds into a frame 
	// this command packet was received, depending on how fast the server
	// does a G_RunFrame()
	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
//unlagged - backward reconciliation #4


//unlagged - lag simulation #3
	// if the client wants to simulate outgoing packet loss
/*	if ( client->pers.plOut ) {
		// see if a random value is below the threshhold
		float thresh = (float)client->pers.plOut / 100.0f;
		if ( random() < thresh ) {
			// do nothing at all if it is - this is a lost command
			return;
		}
	}*/
//unlagged - lag simulation #3


//unlagged - true ping
	// save the estimated ping in a queue for averaging later

	// we use level.previousTime to account for 50ms lag correction
	// besides, this will turn out numbers more like what players are used to
	client->pers.pingsamples[client->pers.samplehead] = level.previousTime + client->frameOffset - ucmd->serverTime;
	client->pers.samplehead++;
	if ( client->pers.samplehead >= NUM_PING_SAMPLES ) {
		client->pers.samplehead -= NUM_PING_SAMPLES;
	}

	// initialize the real ping
	if ( g_truePing.integer ) {
		int i, sum = 0;

		// get an average of the samples we saved up
		for ( i = 0; i < NUM_PING_SAMPLES; i++ ) {
			sum += client->pers.pingsamples[i];
		}

		client->pers.realPing = sum / NUM_PING_SAMPLES;
	}
	else {
		// if g_truePing is off, use the normal ping
		client->pers.realPing = client->ps.ping;
	}
//unlagged - true ping


//unlagged - lag simulation #2
	// keep a queue of past commands
/*	client->pers.cmdqueue[client->pers.cmdhead] = client->pers.cmd;
	client->pers.cmdhead++;
	if ( client->pers.cmdhead >= MAX_LATENT_CMDS ) {
		client->pers.cmdhead -= MAX_LATENT_CMDS;
	}

	// if the client wants latency in commands (client-to-server latency)
	if ( client->pers.latentCmds ) {
		// save the actual command time
		int time = ucmd->serverTime;

		// find out which index in the queue we want
		int cmdindex = client->pers.cmdhead - client->pers.latentCmds - 1;
		while ( cmdindex < 0 ) {
			cmdindex += MAX_LATENT_CMDS;
		}

		// read in the old command
		client->pers.cmd = client->pers.cmdqueue[cmdindex];

		// adjust the real ping to reflect the new latency
		client->pers.realPing += time - ucmd->serverTime;
	}*/
//unlagged - lag simulation #2


//unlagged - backward reconciliation #4
	// save the command time *before* pmove_fixed messes with the serverTime,
	// and *after* lag simulation messes with it :)
	// attackTime will be used for backward reconciliation later (time shift)
	client->attackTime = ucmd->serverTime;
//unlagged - backward reconciliation #4


//unlagged - smooth clients #1
	// keep track of this for later - we'll use this to decide whether or not
	// to send extrapolated positions for this client
	client->lastUpdateFrame = level.framenum;
//unlagged - smooth clients #1


//unlagged - lag simulation #1
	// if the client is adding latency to received snapshots (server-to-client latency)
	/*if ( client->pers.latentSnaps ) {
		// adjust the real ping
		client->pers.realPing += client->pers.latentSnaps * (1000 / sv_fps.integer);
		// adjust the attack time so backward reconciliation will work
		client->attackTime -= client->pers.latentSnaps * (1000 / sv_fps.integer);
	}*/
//unlagged - lag simulation #1


//unlagged - true ping
	// make sure the true ping is over 0 - with cl_timenudge it can be less
	if ( client->pers.realPing < 0 ) {
		client->pers.realPing = 0;
	}
//unlagged - true ping

	msec = ucmd->serverTime - client->ps.commandTime;
	// following others may result in bad times, but we still want
	// to check for follow toggles
	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
		return;
	}
	if ( msec > 200 ) {
		msec = 200;
	}

	if ( pmove_msec.integer < 8 ) {
		trap_Cvar_Set("pmove_msec", "8");
		trap_Cvar_Update(&pmove_msec);
	}
	else if (pmove_msec.integer > 33) {
		trap_Cvar_Set("pmove_msec", "33");
		trap_Cvar_Update(&pmove_msec);
	}

	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer; //FIXME:redundant? (x/b)*b?
		//if (ucmd->serverTime - client->ps.commandTime <= 0)
		//	return;
	}

	//
	// check for exiting intermission
	//
	if ( level.intermissiontime ) {
		ClientIntermissionThink( client );
		return;
	}

	// spectators don't do much
	if ( (client->sess.sessionTeam == TEAM_SPECTATOR) || client->isEliminated ) {
		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
			return;
		}
		SpectatorThink( ent, ucmd );
		return;
	}

	// check for inactivity timer, but never drop the local client of a non-dedicated server
	if ( !ClientInactivityTimer( ent ) ) {
		return;
	}

	// clear the rewards if time
	if ( level.time > client->rewardTime ) {
		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP | EF_AWARD_AIRROCKET | EF_AWARD_AIRGRENADE );
	}

	if ( client->noclip ) {
		client->ps.pm_type = PM_NOCLIP;
	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
		client->ps.pm_type = PM_DEAD;
	} else {
		client->ps.pm_type = PM_NORMAL;
	}

	client->ps.gravity = g_gravity.value*g_gravityModifier.value;

	// set speed
	client->ps.speed = g_speed.value;

	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
		client->ps.speed *= 1.5;
	}
	else
	if ( client->ps.powerups[PW_HASTE] ) {
		client->ps.speed *= 1.3;
	}

	// Let go of the hook if we aren't firing
	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
		Weapon_HookFree(client->hook);
	}

	// set up for pmove
	oldEventSequence = client->ps.eventSequence;

	memset (&pm, 0, sizeof(pm));

	// check for the hit-scan gauntlet, don't let the action
	// go through as an attack unless it actually hits something
	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
		( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
		pm.gauntletHit = CheckGauntletAttack( ent );
	}

	if ( ent->flags & FL_FORCE_GESTURE ) {
		ent->flags &= ~FL_FORCE_GESTURE;
		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
	}

	// check for invulnerability expansion before doing the Pmove
	if (client->ps.powerups[PW_INVULNERABILITY] ) {
		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
			vec3_t mins = { -42, -42, -42 };
			vec3_t maxs = { 42, 42, 42 };
			vec3_t oldmins, oldmaxs;

			VectorCopy (ent->r.mins, oldmins);
			VectorCopy (ent->r.maxs, oldmaxs);
			// expand
			VectorCopy (mins, ent->r.mins);
			VectorCopy (maxs, ent->r.maxs);
			trap_LinkEntity(ent);
			// check if this would get anyone stuck in this player
			if ( !StuckInOtherClient(ent) ) {
				// set flag so the expanded size will be set in PM_CheckDuck
				client->ps.pm_flags |= PMF_INVULEXPAND;
			}
			// set back
			VectorCopy (oldmins, ent->r.mins);
			VectorCopy (oldmaxs, ent->r.maxs);
			trap_LinkEntity(ent);
		}
	}

	pm.ps = &client->ps;
	pm.cmd = *ucmd;
	if ( pm.ps->pm_type == PM_DEAD ) {
		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
	}
	else if ( ent->r.svFlags & SVF_BOT ) {
		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
	}
	else {
		pm.tracemask = MASK_PLAYERSOLID;
	}
	pm.trace = trap_Trace;
	pm.pointcontents = trap_PointContents;
	pm.debugLevel = g_debugMove.integer;
	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;

	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
	pm.pmove_msec = pmove_msec.integer;
	pm.pmove_float = pmove_float.integer;

	if(Q_stricmp(g_ruleset.string, "vq3") == 0) {
		pm.ruleset = RULESET_VQ3;
	} else if(Q_stricmp(g_ruleset.string, "as") == 0) {
		pm.ruleset = RULESET_AS;
	} else if(Q_stricmp(g_ruleset.string, "asxe") == 0) {
		pm.ruleset = RULESET_ASXE;
	} else if(Q_stricmp(g_ruleset.string, "cpm") == 0) {
		pm.ruleset = RULESET_CPM;
	} else if(Q_stricmp(g_ruleset.string, "qw") == 0) {
		pm.ruleset = RULESET_QW;
	} else {
		pm.ruleset = RULESET_AS; // default is AS
	}

	VectorCopy( client->ps.origin, client->oldOrigin );

        #ifdef MISSIONPACK
		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
			if ( level.time - level.intermissionQueued >= 1000  ) {
				pm.cmd.buttons = 0;
				pm.cmd.forwardmove = 0;
				pm.cmd.rightmove = 0;
				pm.cmd.upmove = 0;
				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
				}
				ent->client->ps.pm_type = PM_SPINTERMISSION;
			}
		}
        #endif
	Pmove (&pm);

	// save results of pmove
	if ( ent->client->ps.eventSequence != oldEventSequence ) {
		ent->eventTime = level.time;
	}
//unlagged - smooth clients #2
	// clients no longer do extrapolation if cg_smoothClients is 1, because
	// skip correction is all handled server-side now
	// since that's the case, it makes no sense to store the extra info
	// in the client's snapshot entity, so let's save a little bandwidth

//TODO: Why no extrapolation at all anymore?
/*	if (g_smoothClients.integer) {
		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
	}
	else {*/

		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
//	}
//unlagged - smooth clients #2
	SendPendingPredictableEvents( &ent->client->ps );

	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
		client->fireHeld = qfalse;		// for grapple
	}

	// use the snapped origin for linking so it matches client predicted versions
	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );

	VectorCopy (pm.mins, ent->r.mins);
	VectorCopy (pm.maxs, ent->r.maxs);

	ent->waterlevel = pm.waterlevel;
	ent->watertype = pm.watertype;

	// execute client events
	ClientEvents( ent, oldEventSequence );

	// link entity now, after any personal teleporters have been used
	trap_LinkEntity (ent);
	if ( !ent->client->noclip ) {
		G_TouchTriggers( ent );
	}

	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );

	//test for solid areas in the AAS file
	BotTestAAS(ent->r.currentOrigin);

	// touch other objects
	ClientImpacts( ent, &pm );

	// save results of triggers and client events
	if (ent->client->ps.eventSequence != oldEventSequence) {
		ent->eventTime = level.time;
	}

	// swap and latch button actions
	client->oldbuttons = client->buttons;
	client->buttons = ucmd->buttons;
	client->latched_buttons |= client->buttons & ~client->oldbuttons;

	// check for respawning
	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
		//Dead clients can issue the respawncomand even before they can respawn
		if( ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) && ( ( ( level.time > client->respawnTime - 1500) && ( g_gametype.integer != GT_CTF ) ) || 
										     ( ( level.time > client->respawnTime - 1500 - g_overtime_ctf_respawnDelay.integer * 1000 * level.overtimeCount ) && ( g_gametype.integer == GT_CTF ) ) ) )
			client->respawnCommission = qtrue;
		
		// wait for the attack button to be pressed
		// forcerespawn is to prevent users from waiting out powerups
		// In Last man standing, we force a quick respawn, since
		// the player must be able to loose health
		// pressing attack or use is the normal respawn method
			
		//TODO: this is a mess! Redo this section
		if ( ( level.time > client->respawnTime ) && ( ( ( g_forcerespawn.integer > 0 ) && ( level.time - client->respawnTime  > g_forcerespawn.integer * 1000 ) ) ||
			( ( ( g_gametype.integer == GT_LMS ) || ( g_gametype.integer == GT_ELIMINATION ) || ( g_gametype.integer == GT_CTF_ELIMINATION ) ) &&
			( ( level.time - client->respawnTime > 0 ) ) ) || ( ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) || client->respawnCommission ) ) ) {
			respawn( ent );
		}
		return;
	}

        if ( pm.waterlevel <= 1 && pm.ps->groundEntityNum!=ENTITYNUM_NONE && client->lastSentFlyingTime+500>level.time) {
			if ( ! (pm.ps->pm_flags & PMF_TIME_KNOCKBACK) ) {
                            client->lastSentFlying = -1;
			}
	}

	if ( client->ps.groundEntityNum == ENTITYNUM_NONE && client->lastGroundTime == 0 ){
		client->lastGroundTime = level.time;
	}
	if( client->ps.groundEntityNum != ENTITYNUM_NONE ){
		client->lastGroundTime = 0;
		client->lastSentFlying = -1;
		client->lastSentFlyingSave = -1;
		client->lastAirrocket = -1;
	}
	
	// perform once-a-second actions
	ClientTimerActions( ent, msec );
}

/*
==================
ClientThink

A new command has arrived from the client
==================
*/
void ClientThink( int clientNum ) {
	gentity_t *ent;

	ent = g_entities + clientNum;
	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );

	//Unlagged: commented out
	// mark the time we got info, so we can display the
	// phone jack if they don't get any for a while
	//ent->client->lastCmdTime = level.time;

	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
		ClientThink_real( ent );
	}
}


void G_RunClient( gentity_t *ent ) {
	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
		return;
	}
	ent->client->pers.cmd.serverTime = level.time;
	ClientThink_real( ent );
}


void SpectatorClientUpdatePortals( gentity_t *ent );
/*
==================
SpectatorClientEndFrame

==================
*/
void SpectatorClientEndFrame( gentity_t *ent ) {
	gclient_t	*cl;
	int i, preservedScore[MAX_PERSISTANT]; //for keeping in elimination
	
	//TODO: check here why playing clients get all entityinfo during multiview if someone specs them
	if( ent->client->pers.multiview >= 2 && g_allowMultiview.integer && ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) ){
		for( i = 0 ; i < MAX_GENTITIES; i++ ){
			if( g_entities[i].inuse ){
        // this makes entities invisible to anybody but the spectator
				//g_entities[i].r.svFlags |= SVF_CLIENTMASKVISIBLE;
				//g_entities[i].r.singleClient |= (1 << ( ent->s.clientNum ) );
				//G_Printf("%s %i %i\n", ent->client->pers.netname, ent->s.clientNum, i );
			}
		}
	}
	//Referees can always spec a match 
	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD || 
	   ( ( ent->client->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) && g_disableSpecs.integer && !level.warmupTime && !ent->client->referee )) {
		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
		return;
	} else {
		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
	}

	// if we are doing a chase cam or a remote view, grab the latest info
	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
		int		clientNum, flags;

		clientNum = ent->client->sess.spectatorClient;

		// team follow1 and team follow2 go to whatever clients are playing
		if ( clientNum == -1 ) {
			clientNum = level.follow1;
		} else if ( clientNum == -2 ) {
			clientNum = level.follow2;
		}
		//TODO: dont follow eliminated players
		if ( clientNum >= 0 ) {
			cl = &level.clients[ clientNum ];
			if ( ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) /*|| cl->pers.demoClient*/ ) {
				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
				//this is here LMS/Elimination goes wrong with player follow
				if(ent->client->sess.sessionTeam!=TEAM_SPECTATOR){
				  
					for(i = 0; i < MAX_PERSISTANT; i++)
						preservedScore[i] = ent->client->ps.persistant[i];
					
					ent->client->ps = cl->ps;

					for(i = 0; i < MAX_PERSISTANT; i++)
						ent->client->ps.persistant[i] = preservedScore[i];
					
					ent->client->ps.persistant[PERS_HITS] = cl->ps.persistant[PERS_HITS];
					ent->client->ps.persistant[PERS_DAMAGE_DONE] = cl->ps.persistant[PERS_DAMAGE_DONE];
				}
				else {
					ent->client->ps = cl->ps;
				}
				ent->client->ps.pm_flags |= PMF_FOLLOW;
				ent->client->ps.eFlags = flags;
			//	return;
			} else {
				// drop them to free spectators unless they are dedicated camera followers
				if ( ent->client->sess.spectatorClient >= 0 ) {
					ent->client->sess.spectatorState = SPECTATOR_FREE;
					ClientBegin( ent->client - level.clients );
				}
			}
		}	
	}
	if( ent->client->pers.multiview >= 2 && g_allowMultiview.integer ){
      SpectatorClientUpdatePortals( ent );
  }
}

void SpectatorClientUpdatePortals( gentity_t *player ) {
	  gclient_t	*cl;
            gentity_t	*ent;
    int count = 0;
    int i;
    int clientNumSpec;
    cl = player->client;
    //clientNumSpec = ( player->client - level.clients );
    clientNumSpec = cl->ps.clientNum;
    for ( i = 0 ; i < level.maxclients ; i++ ) {
        if ( count >= MAX_SPECTATOR_PORTALS ) {
            continue;
        }
        if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
            continue;
        }
        if (( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR) || level.clients[i].isEliminated ) {
            continue;
        }
        if ( ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) /*|| cl->pers.demoClient*/ ) {
            if ( cl->sess.sessionTeam != level.clients[i].sess.sessionTeam) {
                continue;
            }
        } else {
            if ( cl->sess.spectatorClient == level.clients[i].ps.clientNum ) {
                continue;
            }
        }
        count++;
        if (count > cl->numSpectatorClientPortals) {
            // create the portal source
            cl->spectatorClientPortals[count-1] =  G_Spawn();
            ent = cl->spectatorClientPortals[count-1];
            ent->r.svFlags |= SVF_SINGLECLIENT;
            ent->r.svFlags |= SVF_PORTAL;
            ent->s.generic1 = qfalse;
        } else {
            // TODO: sanity check existing portals and spawn if error 
        }
        if( cl->pers.multiview >= 2 && g_allowMultiview.integer ){

            ent = cl->spectatorClientPortals[count-1];
            //ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_enter.md3" );

            G_SetOrigin( ent, cl->ps.origin );
            VectorCopy( player->r.mins, ent->r.mins );
            VectorCopy( player->r.maxs, ent->r.maxs );

            ent->r.singleClient = clientNumSpec;
            ent->classname = "spectator_portal source";

            trap_LinkEntity( ent );

            ent->count = i;
            VectorCopy(level.clients[i].ps.origin , ent->pos1 );
            VectorCopy(level.clients[i].ps.origin , ent->s.origin2 );

        }
    }
    for (i = count ; i<cl->numSpectatorClientPortals ; i++) {
        G_FreeEntity(cl->spectatorClientPortals[i]);
    }
    cl->numSpectatorClientPortals = count;
}
 /*
 ==============
 G_PredictPmove

 Make use of the 'Pmove' functions to figure out where a player
 would have moved on their present course in frametime seconds.
 Link them at this predicted location and send it out in the next
 snapshot, BUT don't alter their location so subsequent cmds from
 this client process as though nothing has happened.
==============
*/
static void G_PredictPmove( gentity_t *ent, float frametime )
{
  pmove_t pm;
  //pmoveExt_t pmext;
  playerState_t ps;
  vec3_t currentOrigin;

  if( !ent || !ent->inuse || !ent->r.linked || !ent->client ||
      ent->health < 1 || ent->client->ps.pm_type != PM_NORMAL ||
      ent->waterlevel > 1 )
  {
    return;
  }

  memset( &pm, 0, sizeof( pm ) );
  memcpy( &ps, &ent->client->ps, sizeof( ps ) );
  //memcpy( &pmext, &ent->client->pmext, sizeof( pmext ) );
  pm.ps = &ps;
  //pm.pmext = &pmext;
  pm.trace = trap_Trace;
  pm.pointcontents = trap_PointContents;
  pm.tracemask = MASK_PLAYERSOLID;
  VectorCopy( ent->r.mins, pm.mins );
  VectorCopy( ent->r.maxs, pm.maxs );

  PmovePredict( &pm, frametime );
  SnapVector( ps.origin );
  SnapVector( ps.velocity );

  // link the entity at this new location so they can be hit there but don't
  // really move them since it will interfere with movement
  VectorCopy( ent->r.currentOrigin , currentOrigin );
  VectorCopy( ps.origin, ent->r.currentOrigin );
  trap_LinkEntity( ent );
  VectorCopy( currentOrigin, ent->r.currentOrigin );

  // send this new origin/velocity in the next snapshot
  VectorCopy( ps.origin, ent->s.pos.trBase );
  VectorCopy( ps.velocity, ent->s.pos.trDelta );
}

/*
==============
ClientEndFrame

Called at the end of each server frame for each connected client
A fast client will have multiple ClientThink for each ClientEndFrame,
while a slow client may have multiple ClientEndFrame between ClientThink.
==============
*/
void ClientEndFrame( gentity_t *ent ) {
	int			i;
//	clientPersistant_t	*pers; //not used
	//int frames;

//unlagged - smooth clients #1
	int frames;
//unlagged - smooth clients #1

	if ( (ent->client->sess.sessionTeam == TEAM_SPECTATOR) || ent->client->isEliminated ) {
		SpectatorClientEndFrame( ent );
		return;
	}

//	pers = &ent->client->pers;

	// turn off any expired powerups
	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
		if ( ( ent->client->ps.powerups[ i ] != 0 ) && ( ent->client->ps.powerups[ i ] < level.time )) {
      Com_Printf("Powerup: %i ended for %s\n" , i , ent->client->pers.netname );
			ent->client->ps.powerups[ i ] = 0;
		}
	}

	// set powerup for player animation
	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
		ent->client->ps.powerups[PW_GUARD] = level.time;
	}
	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
		ent->client->ps.powerups[PW_SCOUT] = level.time;
	}
	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
		ent->client->ps.powerups[PW_DOUBLER] = level.time;
	}
	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
	}
	if ( ent->client->invulnerabilityTime > level.time ) {
		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
	}

	// save network bandwidth
#if 0
	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
		// FIXME: this must change eventually for non-sync demo recording
		VectorClear( ent->client->ps.viewangles );
	}
#endif

	//
	// If the end of unit layout is displayed, don't give
	// the player any normal movement attributes
	//
	if ( level.intermissiontime ) {
		return;
	}

	// burn from lava, etc
	P_WorldEffects (ent);

	// apply all the damage taken this frame
	P_DamageFeedback (ent);

	//Unlagged: Commented out
	// add the EF_CONNECTION flag if we haven't gotten commands recently
	/*if ( level.time - ent->client->lastCmdTime > 1000 ) {
		ent->s.eFlags |= EF_CONNECTION;
	} else {
		ent->s.eFlags &= ~EF_CONNECTION;
	}*/

	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...

	G_SetClientSound (ent);

//Unlagged: Always do the else clause
	// set the latest infor
/*	if (g_smoothClients.integer) {
		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
	}
	else {*/ 
		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
//	}
	SendPendingPredictableEvents( &ent->client->ps );
	
	// see how many frames the client has missed
	frames = level.framenum - ent->client->lastUpdateFrame - 1;

	if( g_maxWarp.integer > 0 )
	{
	      if( frames > g_maxWarp.integer )
	      {
		      ent->client->warping = qtrue;
		      frames = g_maxWarp.integer;
	      } 
	}
	else if( frames > 3 )
	      frames = 3;

	if( g_skipCorrection.integer && !ent->client->warped && frames > 0 )
	{
	      float pmtime = 0.001f * ( frames * ( level.time - level.previousTime ) );

	      G_PredictPmove( ent, pmtime );
	}
	ent->client->warped = qfalse;

//unlagged - smooth clients #1
	// mark as not missing updates initially
	ent->client->ps.eFlags &= ~EF_CONNECTION;

	// see how many frames the client has missed
	frames = level.framenum - ent->client->lastUpdateFrame - 1;

	// don't extrapolate more than two frames
	if ( frames > g_extrapolateFrames.integer ) {
		frames = g_extrapolateFrames.integer;

		// if they missed more than two in a row, show the phone jack
		ent->client->ps.eFlags |= EF_CONNECTION;
		ent->s.eFlags |= EF_CONNECTION;
	}

	// did the client miss any frames?
	if ( frames > 0 && g_smoothClients.integer ) {
		// yep, missed one or more, so extrapolate the player's movement
		G_PredictPlayerMove( ent, (float)frames / sv_fps.integer );
		// save network bandwidth
		SnapVector( ent->s.pos.trBase );
	}
//unlagged - smooth clients #1

//unlagged - backward reconciliation #1
	// store the client's position for backward reconciliation later
	G_StoreHistory( ent );
//unlagged - backward reconciliation #1

	// set the bit for the reachability area the client is currently in
//	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
//	ent->client->areabits[i >> 3] |= 1 << (i & 7);
}

