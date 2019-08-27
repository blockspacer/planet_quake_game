// Copyright (C) 1999-2000 Id Software, Inc.
//

#include "g_local.h"

#define HOOK_RELOAD     400
/*
===============
G_DamageFeedback

Called just before a snapshot is sent to the given player.
Totals up all damage and generates both the player_state_t
damage values to that client for pain blends and kicks, and
global pain sound events for all clients.
===============
*/
void P_DamageFeedback( gentity_t *player )
{
	gclient_t	*client;
	float	    count;
	vec3_t	    angles;

	client = player->client;
	if ( client->ps.pm_type == PM_DEAD )
        return;

	// total points of damage shot at the player this frame
	count = client->damage_blood + client->damage_armor;
	if ( count == 0 )
        return;		// didn't take any damage

	if ( count > 255 )
        count = 255;

	// send the information to the client

	// world damage (falling, slime, etc) uses a special code
	// to make the blend blob centered instead of positional
	if ( client->damage_fromWorld )
    {
		client->ps.damagePitch = 255;
		client->ps.damageYaw = 255;
		client->damage_fromWorld = qfalse;
	} else {
		vectoangles( client->damage_from, angles );
		client->ps.damagePitch = angles[PITCH] / 360.0 * 256;
		client->ps.damageYaw = angles[YAW] / 360.0 * 256;
	}

	// play an apropriate pain sound
	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) )
    {
		player->pain_debounce_time = level.time + 700;
		G_AddEvent( player, EV_PAIN, player->health );
		client->ps.damageEvent++;
	}

	client->ps.damageCount = count;

	// clear totals
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
void P_WorldEffects( gentity_t *ent )
{
	qbool	envirosuit;
	int		waterlevel;

	if ( ent->client->noclip )
    {
		ent->client->airOutTime = level.time + 12000;	// don't need air
		return;
	}

	waterlevel = ent->waterlevel;
	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;

	// check for drowning
	//
	if ( waterlevel == 3 )
    {
		// envirosuit give air
		if ( envirosuit ) ent->client->airOutTime = level.time + 10000;

		// if out of air, start drowning
		if ( ent->client->airOutTime < level.time)
        {
			// drown!
			ent->client->airOutTime += 1000;
			if ( ent->health > 0 ) {
				// take more damage the longer underwater
				ent->damage += 2;
				if (ent->damage > 15) ent->damage = 15;

				// don't play a normal pain sound
				ent->pain_debounce_time = level.time + 200;
				G_Damage (ent, NULL, NULL, NULL, NULL, ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
			}
		}

	}
	else
    {
		ent->client->airOutTime = level.time + 12000;
		ent->damage = 2;
	}

	//
	// check for sizzle damage (move to pmove?)
	//
	if (waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) )
    {
		if (ent->health > 0	&& ent->pain_debounce_time <= level.time)
        {

			if ( envirosuit )
            {
				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
			}
			else
            {
				if (ent->watertype & CONTENTS_LAVA)
				{
				    G_Damage (ent, NULL, NULL, NULL, NULL, 30*waterlevel, 0, MOD_LAVA);
				}
				else if (ent->watertype & CONTENTS_SLIME)
                {
                    G_Damage (ent, NULL, NULL, NULL, NULL,	10*waterlevel, 0, MOD_SLIME);
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
void G_SetClientSound( gentity_t *ent )
{
	// SLK: here could add different contents sounds
	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) )
		ent->client->ps.loopSound = level.snd_fry;
	 else
		ent->client->ps.loopSound = 0;
}



//==============================================================

/*
==============
ClientImpacts
==============
*/
void ClientImpacts( gentity_t *ent, pmove_t *pm )
{
	int		    i, j;
	trace_t	    trace;
	gentity_t	*other;

	memset( &trace, 0, sizeof( trace ) );
	for (i = 0 ; i<pm->numtouch ; i++) {
		for (j = 0 ; j < i ; j++)
        {
			if (pm->touchents[j] == pm->touchents[i] )
                break;
		}

		if (j != i)
            continue;	// duplicated

		other = &g_entities[ pm->touchents[i] ];

		if ( !other->touch )
            continue;

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
void G_TouchTriggers( gentity_t *ent )
{
	int			i, num;
	int			touch[MAX_GENTITIES];
	gentity_t	*hit;
	trace_t		trace;
	vec3_t		mins, maxs;
	static      vec3_t	range = { 40, 40, 52 };

	if ( !ent->client )
        return;

	// dead clients don't activate triggers! SLK: tho would be super funny =D
	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 )
        return;

	VectorSubtract( ent->client->ps.origin, range, mins );
	VectorAdd( ent->client->ps.origin, range, maxs );

	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );

	// can't use ent->absmin, because that has a one unit pad
	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );

	for ( i=0 ; i<num ; i++ )
    {
		hit = &g_entities[touch[i]];

		if ( !hit->touch && !ent->touch )
            continue;

		if ( !( hit->r.contents & CONTENTS_TRIGGER ) )
            continue;

		// ignore most entities if a spectator
		if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR )
        {
			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&	hit->touch != Touch_DoorTrigger)
				continue;
		}

		// use seperate code for determining if an item is picked up
		// so you don't have to actually contact its bounding box
		if ( hit->s.eType == ET_ITEM )
        {
			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) )
                continue;
		}
		else
        {
			if ( !trap_EntityContact( mins, maxs, hit ) )
                continue;
		}

		memset( &trace, 0, sizeof(trace) );

		if ( hit->touch ) hit->touch (hit, ent, &trace);

	}

	// if we didn't touch a jump pad this pmove frame
	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount )
    {
		ent->client->ps.jumppad_frame = 0;
		ent->client->ps.jumppad_ent = 0;
	}
}

/*
=================
SpectatorThink
=================
*/
void SpectatorThink( gentity_t *ent, usercmd_t *ucmd )
{
	pmove_t 	pm;
	gclient_t	*client;

	client = ent->client;

	if ( client->sess.spectatorState != SPECTATOR_FOLLOW )
    {
		client->ps.pm_type = PM_SPECTATOR;
		client->ps.speed = g_speed.value * 1.25f; // faster than normal

		// set up for pmove
		memset( &pm, 0, sizeof( pm ) );
		pm.ps = &client->ps;
		pm.cmd = *ucmd;

		if ( client->noclip )
			pm.tracemask = 0;
		else
			pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies

		pm.trace = trap_Trace;
		pm.pointcontents = trap_PointContents;

		// perform a pmove
		Pmove( &pm );
		// save results of pmove
		VectorCopy( client->ps.origin, ent->s.origin );

		G_TouchTriggers( ent );
		trap_UnlinkEntity( ent );
	}

	client->oldbuttons = client->buttons;
	client->buttons = ucmd->buttons;

	// attack button cycles through spectators
	if (( client->buttons & BUTTON_ATTACK) && !(client->oldbuttons & BUTTON_ATTACK))
        Cmd_FollowCycle_f( ent, 1 );
}


/*
=================
ClientInactivityTimer

Returns qfalse if the client is dropped
=================
*/
qbool ClientInactivityTimer( gclient_t *client )
{
	if (! g_inactivity.integer)
    {
		// give everyone some time, so if the operator sets g_inactivity during
		// gameplay, everyone isn't kicked
		client->inactivityTime = level.time + 60 * 1000;
		client->inactivityWarning = qfalse;
	}
	else if ( client->pers.cmd.forwardmove || client->pers.cmd.rightmove ||	client->pers.cmd.upmove || (client->pers.cmd.buttons & BUTTON_ATTACK))
    {
		client->inactivityTime = level.time + g_inactivity.integer * 1000;
		client->inactivityWarning = qfalse;
	}
	else if ( !client->pers.localClient )
    {
		if ( level.time > client->inactivityTime )
		{
			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
			return qfalse;
		}

		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning )
		{
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
void ClientTimerActions( gentity_t *ent, int msec )
{
	gclient_t	*client;

	client = ent->client;
	client->timeResidual += msec;

	while ( client->timeResidual >= 1000 )
    {
		client->timeResidual -= 1000;

		// regenerate
		if ( client->ps.powerups[PW_REGEN] )
        {
			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH])
            {
				ent->health += 15;
				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 )
                {
					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
				}
				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
			}
			else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2)
            {
				ent->health += 5;
				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 )
                {
					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
				}
				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
			}

		}

        {
			// count down health when over max
			if (ent->health > client->ps.stats[STAT_MAX_HEALTH]) ent->health--;
		}

		// count down armor when over max
		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] )
        {
			client->ps.stats[STAT_ARMOR]--;
		}
	}
}

/*
====================
ClientIntermissionThink
====================
*/
void ClientIntermissionThink( gclient_t *client )
{
	client->ps.eFlags &= ~EF_TALK;
	client->ps.eFlags &= ~EF_FIRING;

	// the level will exit when everyone wants to or after timeouts

	// swap and latch button actions
	client->oldbuttons = client->buttons;
	client->buttons = client->pers.cmd.buttons;
	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) )
		// this used to be an ^1 but once a player says ready, it should stick
		client->readyToExit = 1;
}


/*
================
ClientEvents

Events will be passed on to the clients for presentation,
but any server game effects are handled here
================
*/
void ClientEvents( gentity_t *ent, int oldEventSequence )
{
	int		    i, j;
	int		    event;
	gclient_t   *client;
	int		    damage;
	vec3_t	    origin, angles;
	gitem_t     *item;
	gentity_t   *drop;

	client = ent->client;

	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS )
		 oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;


	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ )
    {
		event = client->ps.events[ i & (MAX_PS_EVENTS - 1) ];

		switch ( event ) {
		case EV_FALL_MEDIUM:
		case EV_FALL_FAR:
			if ( ent->s.eType != ET_PLAYER )
                break;		// not in the player model

			if ( g_dmflags.integer & DF_NO_FALLING )
                break;

            if ( event == EV_FALL_FAR )
                damage = 10;
            else
                damage = 5;

            ent->pain_debounce_time = level.time + 200;	// no normal pain sound
            G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
			break;

		case EV_FIRE_WEAPON:
			FireWeapon( ent );
			break;

		case EV_USE_ITEM1:	// was teleporter holdable

			break;

		case EV_USE_ITEM2:		// medkit
			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
			break;

		default:
			break;
		}
	}
}

/*
==============
SendPendingPredictableEvents
==============
*/
void SendPendingPredictableEvents( playerState_t *ps )
{
	gentity_t   *t;
	int         event, seq;
	int         extEvent, number;

	// if there are still events pending
	if ( ps->entityEventSequence < ps->eventSequence )
    {
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

/*
==============
ClientThink

This will be called once for each client frame, which will
usually be a couple times for each server frame on fast clients.

If "g_synchronousClients 1" is set, this will be called exactly
once for each server frame, which makes for smooth demo recording.
==============
*/
void ClientThink_real( gentity_t *ent )
{
	gclient_t	*client;
	pmove_t		pm;
	int			oldEventSequence;
	int			msec;
	usercmd_t	*ucmd;

	client = ent->client;

	// don't think if the client is not yet connected (and thus not yet spawned in)
	if (client->pers.connected != CON_CONNECTED)
        return;

	// mark the time, so the connection sprite can be removed
	ucmd = &ent->client->pers.cmd;

	// sanity check the command time to prevent speedup cheating
	if ( ucmd->serverTime > level.time + 200 ) {
		ucmd->serverTime = level.time + 200;
	} else if ( ucmd->serverTime < level.time - 1000 ) {
		ucmd->serverTime = level.time - 1000;
	}

	// unlagged
	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
	client->lastCmdTime = ucmd->serverTime;
	client->lastUpdateFrame = level.framenum;

	if ( pmove_msec.integer < 8 )
    {
		trap_Cvar_Set( "pmove_msec", "8" );
		trap_Cvar_Update( &pmove_msec );
	} else if ( pmove_msec.integer > 33 ) {
		trap_Cvar_Set( "pmove_msec", "33" );
		trap_Cvar_Update( &pmove_msec );
	}

	if ( pmove_fixed.integer )
		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;

	// Josh - moving this down here because pmove_fixed was making health decay very slowly
	msec = ucmd->serverTime - client->ps.commandTime;
	// following others may result in bad times, but we still want
	// to check for follow toggles
	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW )
		return;

	if ( msec > 200 )
		msec = 200;


	// check for exiting intermission
	//
	if ( level.intermissiontime ) {
		ClientIntermissionThink( client );
		return;
	}

	// spectators don't do much: SLK except stealing routes and fap
	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD )
            return;

		SpectatorThink( ent, ucmd );
		return;
	}

	// check for inactivity timer, but never drop the local client of a non-dedicated server
	if ( !ClientInactivityTimer( client ) )
        return;

	// clear the rewards if time
	if ( level.time > client->rewardTime ) client->ps.eFlags &= ~EF_AWARDS;

	if ( client->noclip ) {
		client->ps.pm_type = PM_NOCLIP;
	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
		client->ps.pm_type = PM_DEAD;
	} else {
		client->ps.pm_type = PM_NORMAL;
	}

	client->ps.gravity = g_gravity.value;

	// set speed
	client->ps.speed = g_speed.value;
	if ( client->ps.powerups[PW_HASTE] )
        client->ps.speed *= 1.3;

	// Let go off the hook if we aren't firing
	if ( client->ps.weapon == WP_GRAPPLING_HOOK ) {
		if ( client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
			Weapon_HookFree(client->hook);
		}
	} else if ( dfx_gametype.integer != GT_ADVENTURE)  { // offhand hook
		if ( (ucmd->buttons & 32) && client->ps.weapon == WP_GRAPPLING_HOOK ) {
			if ( level.time >= client->hookTime && !client->hook ) {
				int oldweap = ent->s.weapon;

				client->hookTime = level.time + HOOK_RELOAD;

				ent->s.weapon = WP_GRAPPLING_HOOK;
				FireWeapon(ent);
				ent->s.weapon = oldweap;
			}
		} else if ( client->hook ) {
			Weapon_HookFree(client->hook);
		}
	}

	// Set df timer if active
	if ( dfx_gametype.integer != GT_FREESTYLE ) {
		int timer;

		if ( client->dfTimerOn ) {
			timer = level.time - client->dfTimer;
		} else {
			timer = client->dfTimer;
		}

		client->ps.stats[STAT_DFTIMERHI] = timer >> 16;
		client->ps.stats[STAT_DFTIMERLO] = timer & 0xffff;
	}

	// set up for pmove
	oldEventSequence = client->ps.eventSequence;

	memset (&pm, 0, sizeof(pm));

	// check for the hit-scan gauntlet, don't let the action
	// go through as an attack unless it actually hits something
	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) && ( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 )
		pm.gauntletHit = CheckGauntletAttack( ent );

	if ( ent->flags & FL_FORCE_GESTURE ) {
		ent->flags &= ~FL_FORCE_GESTURE;
		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
	}

	pm.ps = &client->ps;
	pm.cmd = *ucmd;
	if ( pm.ps->pm_type == PM_DEAD ) {
		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
	} else {
		pm.tracemask = MASK_PLAYERSOLID;
	}

	pm.trace = trap_Trace;
	pm.pointcontents = trap_PointContents;
	pm.debugLevel = g_debugMove.integer;

	pm.pmove_fixed = pmove_fixed.integer;
	pm.pmove_msec = pmove_msec.integer;

	VectorCopy( client->ps.origin, client->oldOrigin );

    Pmove (&pm);

	// save results of pmove
	if ( ent->client->ps.eventSequence != oldEventSequence )
		ent->eventTime = level.time;

	BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );

	SendPendingPredictableEvents( &ent->client->ps );

	if ( !( ent->client->ps.eFlags & EF_FIRING ) )
		client->fireHeld = qfalse;		// for grapple

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
	if ( !ent->client->noclip )
		G_TouchTriggers( ent );

	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );

	// touch other objects
	ClientImpacts( ent, &pm );

	// save results of triggers and client events
	if (ent->client->ps.eventSequence != oldEventSequence)
		ent->eventTime = level.time;

	// swap and latch button actions
	client->oldbuttons = client->buttons;
	client->buttons = ucmd->buttons;
	client->latched_buttons |= client->buttons & ~client->oldbuttons;

	// check for respawning
	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
		// wait for the attack button to be pressed
		if ( level.time > client->respawnTime ) {
			// forcerespawn is to prevent users from waiting out powerups
			if (g_forcerespawn.integer > 0 && (level.time - client->respawnTime) > g_forcerespawn.integer * 1000) {
				respawn( ent );
				return;
			}

			// pressing attack or use is the normal respawn method
			if (ucmd->buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE))
                respawn( ent );
		}

		return;
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
void ClientThink( int clientNum )
{
	gentity_t *ent;

	ent = g_entities + clientNum;
	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );

	// mark the time we got info, so we can display the
	// phone jack if they don't get any for a while
#if 0 // unlagged
	ent->client->lastCmdTime = level.time;
#endif

	if ( !g_synchronousClients.integer )
        ClientThink_real( ent );
}

void G_RunClient( gentity_t *ent )
{
	if ( !g_synchronousClients.integer )
        return;

	ent->client->pers.cmd.serverTime = level.time;
	ClientThink_real( ent );
}


/*
==================
SpectatorClientEndFrame

==================
*/
void SpectatorClientEndFrame( gentity_t *ent )
{
	gclient_t	*cl;

	// if we are doing a chase cam or a remote view, grab the latest info
	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
		int	clientNum, flags;

		clientNum = ent->client->sess.spectatorClient;

		// team follow1 and team follow2 go to whatever clients are playing
		if ( clientNum == -1 ) {
			clientNum = level.follow1;
		} else if ( clientNum == -2 ) {
			clientNum = level.follow2;
		}

		if ( (unsigned)clientNum < MAX_CLIENTS ) {
			cl = &level.clients[ clientNum ];
			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
				flags = (cl->ps.eFlags & ~(EF_VOTED )) | (ent->client->ps.eFlags & (EF_VOTED));
				ent->client->ps = cl->ps;
				ent->client->ps.pm_flags |= PMF_FOLLOW;
				ent->client->ps.eFlags = flags;
				return;
			} else {
				// drop them to free spectators unless they are dedicated camera followers
				if ( ent->client->sess.spectatorClient >= 0 ) {
					ent->client->sess.spectatorState = SPECTATOR_FREE;
					ClientBegin( ent->client - level.clients );
				}
			}
		}
	}

	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD )
		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
	else
		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
}


/*
==============
ClientEndFrame

Called at the end of each server frame for each connected client
A fast client will have multiple ClientThink for each ClientEdFrame,
while a slow client may have multiple ClientEndFrame between ClientThink.
==============
*/
void ClientEndFrame( gentity_t *ent )
{
	static gentity_t    sent;
	int			        i;
	clientPersistant_t	*pers;
	gclient_t	        *client;
	int			        frames; // unlagged

	if ( !ent->client )
        return;

	ent->r.svFlags &= ~svf_self_portal2;

	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
		SpectatorClientEndFrame( ent );
		return;
	}

	client = ent->client;
	pers = &client->pers;

	// turn off any expired powerups
	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
		if (client->ps.powerups[i] < client->pers.cmd.serverTime)
            client->ps.powerups[i] = 0;
	}

	// If the end of unit layout is displayed, don't give
	// the player any normal movement attributes
	//
	if (level.intermissiontime) {
		client->ps.commandTime = client->pers.cmd.serverTime;
		return;
	}

	// burn from lava, etc
	P_WorldEffects (ent);

	// apply all the damage taken this frame
	P_DamageFeedback (ent);

	client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...

	G_SetClientSound( ent );

	// set the latest info
	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );

	SendPendingPredictableEvents( &client->ps );

	client->ps.eFlags &= ~EF_CONNECTION;
	ent->s.eFlags &= ~EF_CONNECTION;

	frames = level.framenum - client->lastUpdateFrame - 1;

	// PVS prediction
	if ( g_predictPVS.integer && svf_self_portal2 ) {
		int lag;
		sent.s = ent->s;
		sent.r = ent->r;
		sent.clipmask = ent->clipmask;
		lag = level.time - client->ps.commandTime + 50;
		if ( lag > 500 ) lag = 500;
		G_PredictPlayerMove( &sent, (float)lag * 0.001f );
		VectorCopy( sent.s.pos.trBase, ent->r.unused.origin2 );
		ent->r.unused.origin2[2] += client->ps.viewheight;
		ent->r.svFlags |= svf_self_portal2;
	}

	if (frames > 2) {
		// limit lagged player prediction to 2 server frames
		frames = 2;
		// and add the EF_CONNECTION flag if we haven't gotten commands recently
		client->ps.eFlags |= EF_CONNECTION;
		ent->s.eFlags |= EF_CONNECTION;
	}

	if (frames > 0 && g_smoothClients.integer)
    {
		G_PredictPlayerMove( ent, (float)frames / sv_fps.value );
		SnapVector( ent->s.pos.trBase );
	}

	// unlagged
	G_StoreHistory( ent );

	// hitsounds
	if ( client->damage.enemy && client->damage.amount ) {
		client->ps.persistant[PERS_HITS] += client->damage.enemy;
		client->damage.enemy = 0;

		// scale damage by max.health
		i = client->damage.amount * 100 / client->ps.stats[STAT_MAX_HEALTH];

		// avoid high-byte setup
		if ( i > 255 )
            i = 255;

		client->ps.persistant[PERS_ATTACKEE_ARMOR] = i;
		client->damage.amount = 0;
	} else if ( client->damage.team ) {
		client->ps.persistant[PERS_HITS] -= client->damage.team;
		client->damage.team = 0;
	}
}