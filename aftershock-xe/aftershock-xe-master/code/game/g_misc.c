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
// g_misc.c

#include "g_local.h"


/*QUAKED func_group (0 0 0) ?
Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
*/


/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
*/
void SP_info_camp( gentity_t *self ) {
	G_SetOrigin( self, self->s.origin );
}


/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
*/
void SP_info_null( gentity_t *self ) {
	G_FreeEntity( self );
}


/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for in-game calculation, like jumppad targets.
target_position does the same thing
*/
void SP_info_notnull( gentity_t *self ){
	G_SetOrigin( self, self->s.origin );
}


/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
Non-displayed light.
"light" overrides the default 300 intensity.
Linear checbox gives linear falloff instead of inverse square
Lights pointed at a target will be spotlights.
"radius" overrides the default 64 unit radius of a spotlight at the target point.
*/
void SP_light( gentity_t *self ) {
	G_FreeEntity( self );
}



/*
=================================================================================

TELEPORTERS

=================================================================================
*/

void TeleportEntity(gentity_t *self, gentity_t *other, trace_t *trace, gentity_t *dest) {
	vec3_t angles_teleporter;
	vec3_t angles_destination;
	vec3_t angles_origin;
	vec3_t angles_normal_plane;
	vec3_t origin_normalized;
	vec3_t destination;
	vec_t  speed;

	G_TempEntity(dest->s.origin, EV_PROJECTILE_TELEPORT_OUT);
	G_TempEntity(self->pos2, EV_PROJECTILE_TELEPORT_IN);

	if(g_projectileTeleportKeepAngle.integer == 1) {
		VectorNormalize2(other->s.pos.trDelta, origin_normalized);

		// Get angles of origin, teleporter exit and normal plane of teleporter
		vectoangles(origin_normalized,   angles_origin);
		VectorCopy(dest->s.angles,       angles_teleporter);
		vectoangles(trace->plane.normal, angles_normal_plane);

		// First add the origin and normal plane
		VectorAdd(angles_origin, angles_normal_plane, angles_destination);

		// Then remove 180° from y coordinate (to get straight line instead of normal)
		// and add the angles of the exit teleporter
		angles_destination[1] = angles_destination[1] -180 + angles_teleporter[1];

		// Normalize angles
		if(angles_destination[1] > 360) {
			angles_destination[1] -= 360;
		} else if(angles_destination[1] < -360) {
			angles_destination[1] += 360;
		}

		// Now we don't really now if we calculated the angle to be the correct side
		// of the teleporter. We figure this out by making sure that we are not more then
		// 90 degree off the angle of the teleporter
		if(abs(angles_destination[1] - angles_teleporter[1]) > 90) {
			angles_destination[1] += 180;
		}

		// Calculate destination vector from angles
		AngleVectors(angles_destination, destination, NULL, NULL );
	} else {
		// If angle should not be kept, use pre-defined angle 
		// of teleporter exit as destination.
		AngleVectors(dest->s.angles, destination, NULL, NULL );
	}

	// Set new origin vectors
	VectorCopy(dest->s.origin, other->s.origin);
	VectorCopy(dest->s.origin, other->r.currentOrigin);
	VectorCopy(dest->s.origin, other->s.pos.trBase);

	// Save speed of projectile
	speed = VectorLength(other->s.pos.trDelta);

	// and apply it to the destination
	VectorScale(destination, speed, other->s.pos.trDelta);
	other->s.pos.trTime = level.time;
}

qboolean TestTeleportIncrements(gentity_t *player, vec3_t torigin, vec3_t delta_normalized) {
	int i, j, num;
	gentity_t *hit;
	vec3_t mins, maxs, end;
	int touch[MAX_GENTITIES];
	trace_t trace;

	// Try to push forward in 10 step increments until it fits 
	for(i = 0; i < 100; i++) {
		VectorAdd(torigin, player->r.mins, mins);
		VectorAdd(torigin, player->r.maxs, maxs);
		num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);

		hit = NULL;
		for(j = 0; j < num; j++) {
			hit = &g_entities[touch[j]];
			if(hit && hit->client && (hit->client->sess.sessionTeam == player->client->sess.sessionTeam)) {
				break;
			}

			hit = NULL;
		}

		// We don't hit a player anymore, use the current origin
		if(!hit) {
			return qtrue;
		}

		VectorAdd(torigin, delta_normalized, end);

		// If we hit a wall with the next increment we give up.
		// Better to spawn in a team member than in a wall.
		trap_Trace(&trace, torigin, player->r.mins, player->r.maxs, end, player->s.number, player->clipmask & (~CONTENTS_BODY));
		if(trace.allsolid) {
			return qfalse;
		}

		VectorAdd(torigin, delta_normalized, torigin);
	}

	return qfalse;
}

void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
	gentity_t *tent;
	int i, num;
	int touch[MAX_GENTITIES];
	gentity_t *hit;
	vec3_t mins, maxs;
	vec3_t delta, delta_normalized;
	vec3_t torigin;

	VectorCopy(origin, torigin);
	torigin[2] += 9;

	// mmp - teleport height test (you guys figure it out, i'm able to do the aerowalk teleport jump without any changes (other than cpma ruleset)...  wtf)
	if ( g_newTeleportHeight.integer > 0 ) {
		if ( g_newTeleportHeight.integer > 64 )
			torigin[2] += 64;
		else
			torigin[2] += g_newTeleportHeight.integer;
	}

	// For team games we check if the teleporter would transport us inside a team member
	if((g_gametype.integer == GT_ELIMINATION) || (g_gametype.integer == GT_CTF_ELIMINATION) || (g_gametype.integer == GT_CTF)) {
		// With g_telefragTeamBehavior = 1 we push the player forward if there is a team member in the way
		// on the exit of the teleporter.
		if(g_telefragTeamBehavior.integer == 1) {
			AngleVectors(angles, delta, NULL, NULL);
			VectorScale(delta, 10, delta_normalized);

			// Try to spawn forward
			if(!TestTeleportIncrements(player, torigin, delta_normalized)) {
				VectorCopy(origin, torigin);
				torigin[2] += 9;
				VectorScale(delta, -10, delta_normalized);
				// If that does not work try to spawn backward
				if(!TestTeleportIncrements(player, torigin, delta_normalized)) {
					VectorCopy(origin, torigin);
					torigin[2] += 100;
					VectorScale(delta, 10, delta_normalized);
					// If that does not work try to spawn on top forward
					if(!TestTeleportIncrements(player, torigin, delta_normalized)) {
						VectorCopy(origin, torigin);
						torigin[2] += 100;
						VectorScale(delta, -10, delta_normalized);
						// If that does not work try to spawn on top backward
						if(!TestTeleportIncrements(player, torigin, delta_normalized)) {
							// If that does not work we spawn the player in the original position
							VectorCopy(origin, torigin);
							torigin[2] += 9;
						}
					}
				}
			}

		// With g_telefragTeamBehavior = 2 we dont allow the player to go through teleporter if a team member
		// is in the way on the other side.
		} else if(g_telefragTeamBehavior.integer == 2) {
			VectorAdd(torigin, player->r.mins, mins);
			VectorAdd(torigin, player->r.maxs, maxs);
			num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);

			hit = NULL;
			for(i = 0; i < num; i++) {
				hit = &g_entities[touch[i]];
				if(!hit || !hit->client || (hit->client->sess.sessionTeam != player->client->sess.sessionTeam)) {
					continue;
				}

				return;
			}
		}
	}

	// use temp events at source and destination to prevent the effect
	// from getting dropped by a second player event
	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR) {
		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
		tent->s.clientNum = player->s.clientNum;

		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
		tent->s.clientNum = player->s.clientNum;
	}

	// unlink to make sure it can't possibly interfere with G_KillBox
	trap_UnlinkEntity (player);

	VectorCopy ( torigin, player->client->ps.origin );

	// spit the player out
	AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
	VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
	player->client->ps.pm_time = 160;		// hold time
	player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;

	// toggle the teleport bit so the client knows to not lerp
	player->client->ps.eFlags ^= EF_TELEPORT_BIT;

//unlagged - backward reconciliation #3
	// we don't want players being backward-reconciled back through teleporters
	G_ResetHistory( player );
//unlagged - backward reconciliation #3

	// set angles
	SetClientViewAngle( player, angles );

	// kill anything at the destination
	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR ) {
		G_KillBox (player);
	}

	// save results of pmove
	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );

	// use the precise origin for linking
	VectorCopy( player->client->ps.origin, player->r.currentOrigin );

	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR ) {
		trap_LinkEntity (player);
	}
}


/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
Point teleporters at these.
Now that we don't have teleport destination pads, this is just
an info_notnull
*/
void SP_misc_teleporter_dest( gentity_t *ent ) {
}


//===========================================================

/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
"model"		arbitrary .md3 file to display
*/
void SP_misc_model( gentity_t *ent ) {

#if 0
	ent->s.modelindex = G_ModelIndex( ent->model );
	VectorSet (ent->mins, -16, -16, -16);
	VectorSet (ent->maxs, 16, 16, 16);
	trap_LinkEntity (ent);

	G_SetOrigin( ent, ent->s.origin );
	VectorCopy( ent->s.angles, ent->s.apos.trBase );
#else
	G_FreeEntity( ent );
#endif
}

//===========================================================

void locateCamera( gentity_t *ent ) {
	vec3_t		dir;
	gentity_t	*target;
	gentity_t	*owner;

	owner = G_PickTarget( ent->target );
	if ( !owner ) {
                G_Printf( "Couldn't find target for misc_partal_surface\n" );
		G_FreeEntity( ent );
		return;
	}
	ent->r.ownerNum = owner->s.number;

	// frame holds the rotate speed
	if ( owner->spawnflags & 1 ) {
		ent->s.frame = 25;
	} else if ( owner->spawnflags & 2 ) {
		ent->s.frame = 75;
	}

	// swing camera ?
	if ( owner->spawnflags & 4 ) {
		// set to 0 for no rotation at all
		ent->s.powerups = 0;
	}
	else {
		ent->s.powerups = 1;
	}

	// clientNum holds the rotate offset
	ent->s.clientNum = owner->s.clientNum;

	VectorCopy( owner->s.origin, ent->s.origin2 );

	// see if the portal_camera has a target
	target = G_PickTarget( owner->target );
	if ( target ) {
		VectorSubtract( target->s.origin, owner->s.origin, dir );
		VectorNormalize( dir );
	} else {
		G_SetMovedir( owner->s.angles, dir );
	}

	ent->s.eventParm = DirToByte( dir );
}

/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
This must be within 64 world units of the surface!
*/
void SP_misc_portal_surface(gentity_t *ent) {
	VectorClear( ent->r.mins );
	VectorClear( ent->r.maxs );
	trap_LinkEntity (ent);

	ent->r.svFlags = SVF_PORTAL;
	ent->s.eType = ET_PORTAL;

	if ( !ent->target ) {
		VectorCopy( ent->s.origin, ent->s.origin2 );
	} else {
		ent->think = locateCamera;
		ent->nextthink = level.time + 100;
	}
}

/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
"roll" an angle modifier to orient the camera around the target vector;
*/
void SP_misc_portal_camera(gentity_t *ent) {
	float	roll;

	VectorClear( ent->r.mins );
	VectorClear( ent->r.maxs );
	trap_LinkEntity (ent);

	G_SpawnFloat( "roll", "0", &roll );

	ent->s.clientNum = roll/360.0 * 256;
}

/*
======================================================================

  SHOOTERS

======================================================================
*/

void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
	vec3_t		dir;
	float		deg;
	vec3_t		up, right;

	// see if we have a target
	if ( ent->enemy ) {
		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
		VectorNormalize( dir );
	} else {
		VectorCopy( ent->movedir, dir );
	}

	// randomize a bit
	PerpendicularVector( up, dir );
	CrossProduct( up, dir, right );

	deg = crandom() * ent->random;
	VectorMA( dir, deg, up, dir );

	deg = crandom() * ent->random;
	VectorMA( dir, deg, right, dir );

	VectorNormalize( dir );

	switch ( ent->s.weapon ) {
	case WP_GRENADE_LAUNCHER:
		fire_grenade( ent, ent->s.origin, dir );
		break;
	case WP_ROCKET_LAUNCHER:
		fire_rocket( ent, ent->s.origin, dir );
		break;
	case WP_PLASMAGUN:
		fire_plasma( ent, ent->s.origin, dir );
		break;
	}

	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
}


static void InitShooter_Finish( gentity_t *ent ) {
	ent->enemy = G_PickTarget( ent->target );
	ent->think = 0;
	ent->nextthink = 0;
}

void InitShooter( gentity_t *ent, int weapon ) {
	ent->use = Use_Shooter;
	ent->s.weapon = weapon;

	RegisterItem( BG_FindItemForWeapon( weapon ) );

	G_SetMovedir( ent->s.angles, ent->movedir );

	if ( !ent->random ) {
		ent->random = 1.0;
	}
	ent->random = sin( M_PI * ent->random / 180 );
	// target might be a moving object, so we can't set movedir for it
	if ( ent->target ) {
		ent->think = InitShooter_Finish;
		ent->nextthink = level.time + 500;
	}
	trap_LinkEntity( ent );
}

/*QUAKED shooter_rocket (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_rocket( gentity_t *ent ) {
	InitShooter( ent, WP_ROCKET_LAUNCHER );
}

/*QUAKED shooter_plasma (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_plasma( gentity_t *ent ) {
	InitShooter( ent, WP_PLASMAGUN);
}

/*QUAKED shooter_grenade (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_grenade( gentity_t *ent ) {
	InitShooter( ent, WP_GRENADE_LAUNCHER);
}

static void PortalDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod) {
	G_FreeEntity( self );
	//FIXME do something more interesting
}


void DropPortalDestination( gentity_t *player ) {
	gentity_t	*ent;
	vec3_t		snapped;

	// create the portal destination
	ent = G_Spawn();
	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_exit.md3" );

	VectorCopy( player->s.pos.trBase, snapped );
	SnapVector( snapped );
	G_SetOrigin( ent, snapped );
	VectorCopy( player->r.mins, ent->r.mins );
	VectorCopy( player->r.maxs, ent->r.maxs );

	ent->classname = "hi_portal destination";
	ent->s.pos.trType = TR_STATIONARY;

	ent->r.contents = CONTENTS_CORPSE;
	ent->takedamage = qtrue;
	ent->health = 200;
	ent->die = PortalDie;

	VectorCopy( player->s.apos.trBase, ent->s.angles );

	ent->think = G_FreeEntity;
	ent->nextthink = level.time + 2 * 60 * 1000;

	trap_LinkEntity( ent );

	player->client->portalID = ++level.portalSequence;
	ent->count = player->client->portalID;

	// give the item back so they can drop the source now
	player->client->ps.stats[STAT_HOLDABLE_ITEM] = BG_FindItem( "Portal" ) - bg_itemlist;
}


static void PortalTouch( gentity_t *self, gentity_t *other, trace_t *trace) {
	gentity_t	*destination;

	// see if we will even let other try to use it
	if( other->health <= 0 ) {
		return;
	}
	if( !other->client ) {
		return;
	}
//	if( other->client->ps.persistant[PERS_TEAM] != self->spawnflags ) {
//		return;
//	}

	if ( other->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_NEUTRALFLAG ), 0 );
		other->client->ps.powerups[PW_NEUTRALFLAG] = 0;
	}
	else if ( other->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_REDFLAG ), 0 );
		other->client->ps.powerups[PW_REDFLAG] = 0;
	}
	else if ( other->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_BLUEFLAG ), 0 );
		other->client->ps.powerups[PW_BLUEFLAG] = 0;
	}

	// find the destination
	destination = NULL;
	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
		if( destination->count == self->count ) {
			break;
		}
	}

	// if there is not one, die!
	if( !destination ) {
		if( self->pos1[0] || self->pos1[1] || self->pos1[2] ) {
			TeleportPlayer( other, self->pos1, self->s.angles );
		}
		G_Damage( other, other, other, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG );
		return;
	}

	TeleportPlayer( other, destination->s.pos.trBase, destination->s.angles );
}


static void PortalEnable( gentity_t *self ) {
	self->touch = PortalTouch;
	self->think = G_FreeEntity;
	self->nextthink = level.time + 2 * 60 * 1000;
}


void DropPortalSource( gentity_t *player ) {
	gentity_t	*ent;
	gentity_t	*destination;
	vec3_t		snapped;

	// create the portal source
	ent = G_Spawn();
	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_enter.md3" );

	VectorCopy( player->s.pos.trBase, snapped );
	SnapVector( snapped );
	G_SetOrigin( ent, snapped );
	VectorCopy( player->r.mins, ent->r.mins );
	VectorCopy( player->r.maxs, ent->r.maxs );

	ent->classname = "hi_portal source";
	ent->s.pos.trType = TR_STATIONARY;

	ent->r.contents = CONTENTS_CORPSE | CONTENTS_TRIGGER;
	ent->takedamage = qtrue;
	ent->health = 200;
	ent->die = PortalDie;

	trap_LinkEntity( ent );

	ent->count = player->client->portalID;
	player->client->portalID = 0;

//	ent->spawnflags = player->client->ps.persistant[PERS_TEAM];

	ent->nextthink = level.time + 1000;
	ent->think = PortalEnable;

	// find the destination
	destination = NULL;
	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
		if( destination->count == ent->count ) {
			VectorCopy( destination->s.pos.trBase, ent->pos1 );
			break;
		}
	}

}