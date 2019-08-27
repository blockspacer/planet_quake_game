// Copyright (C) 1999-2000 Id Software, Inc.
//
#include "g_local.h"

/*
=======================================================================
SESSION DATA

Session data is the only data that stays persistant across level loads
and tournament restarts.
=======================================================================
*/

/*
================
G_WriteClientSessionData
Called on game shutdown
================
*/
void G_WriteClientSessionData( gclient_t *client )
{
	const char	*s;
	const char	*var;

	s = va("%i %i %i %i %i %i %i %i",
		client->sess.sessionTeam,
		client->sess.spectatorTime,
		client->sess.spectatorState,
		client->sess.spectatorClient,
		client->sess.wins,
		client->sess.losses,
		client->sess.teamLeader,
		client->sess.secrets
    );

	var = va( "session%i", client - level.clients );

	trap_Cvar_Set( var, s );
}


/*
================
G_ReadSessionData
Called on a reconnect
================
*/
void G_ReadClientSessionData( gclient_t *client )
{
	char	s[MAX_STRING_CHARS];
	const char	*var;
	int teamLeader;
	int spectatorState;
	int sessionTeam;

	var = va( "session%i", client - level.clients );
	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );

	Q_sscanf( s, "%i %i %i %i %i %i %i %i",
		&sessionTeam,
		&client->sess.spectatorTime,
		&spectatorState,
		&client->sess.spectatorClient,
		&client->sess.wins,
		&client->sess.losses,
		&teamLeader,
        &client->sess.secrets
    );

	client->sess.sessionTeam = (team_t)sessionTeam;
	client->sess.spectatorState = (spectatorState_t)spectatorState;
	client->sess.teamLeader = (qbool)teamLeader;

	if ( (unsigned)client->sess.sessionTeam >= TEAM_NUM_TEAMS )
    {
		client->sess.sessionTeam = TEAM_SPECTATOR;
	}
}


/*
================
G_ClearClientSessionData
================
*/
void G_ClearClientSessionData( gclient_t *client )
{
	const char	*var;

	var = va( "session%i", client - level.clients );
	trap_Cvar_Set( var, "" );
}


void G_InitSessionData( gclient_t *client, const char *team ) {
	clientSession_t	*sess;
	
	sess = &client->sess;

	// initial team determination
	if ( dfx_gametype.integer == GT_TEAMRUN ) {
		if ( team[0] == 's' || team[0] == 'S' ) {
			// a willing spectator, not a waiting-in-line
			sess->sessionTeam = TEAM_SPECTATOR;
		} else {
			// always spawn as spectator in team games
			sess->sessionTeam = TEAM_SPECTATOR;	
			
				
		}
	} else {
		if ( team[0] == 's' || team[0] == 'S' ) {
			// a willing spectator, not a waiting-in-line
			sess->sessionTeam = TEAM_SPECTATOR;
		} else {
			switch ( dfx_gametype.integer ) {
			default:
			case GT_FASTCAP:
			case GT_DEFRAG:
			case GT_FREESTYLE:
				if ( g_maxGameClients.integer > 0 && level.numNonSpectatorClients >= g_maxGameClients.integer ) {
					sess->sessionTeam = TEAM_SPECTATOR;
				} else {
					sess->sessionTeam = TEAM_FREE;
				}
				break;
			case GT_ADVENTURE:
				// if the game is full, go into a waiting mode
				if ( level.numNonSpectatorClients >= 1 ) {
					sess->sessionTeam = TEAM_SPECTATOR;
				} else {
					sess->sessionTeam = TEAM_FREE;
				}
				break;
			}
		}
	}

	sess->spectatorState = SPECTATOR_FREE;
	sess->spectatorTime = 0;
}


/*
==================
G_InitWorldSession
==================
*/
void G_InitWorldSession( void )
{
	char	s[MAX_STRING_CHARS];
	int		gt;

	trap_Cvar_VariableStringBuffer( "session", s, sizeof(s) );
	gt = atoi( s );
	
	if ( !*s || dfx_gametype.integer != gt ) {
		level.newSession = qtrue;
		G_Printf( "Gametype changed, clearing session data.\n" );
		//trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
	}
	
	if ( dfx_gametype.integer == GT_ADVENTURE ) {
        trap_Cvar_Set ("g_speed", "280");
    } else {
        trap_Cvar_Set ("g_speed", "320");
    }

    if ( (dfx_gametype.integer == GT_FASTCAP || dfx_gametype.integer == GT_FREESTYLE) || (dfx_gametype.integer == GT_DEFRAG && dfx_mode.integer >= DF_STRAFE) )
        g_dmflags.integer = 8;
    else
        g_dmflags.integer = 0;

    trap_Cvar_Set( "fraglimit", "0" );
}


/*
==================
G_WriteSessionData
==================
*/
void G_WriteSessionData( void )
{
	int		i;

	trap_Cvar_Set( "session", va("%i", dfx_gametype.integer) );

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[i].pers.connected != CON_DISCONNECTED )
        {
			G_WriteClientSessionData( &level.clients[i] );
		}
	}
}
