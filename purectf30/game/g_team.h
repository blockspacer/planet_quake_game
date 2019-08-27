// Copyright (C) 1999-2000 Id Software, Inc.
//

#ifdef MISSIONPACK

#define CTF_CAPTURE_BONUS		100		// what you get for capture
#define CTF_TEAM_BONUS			25		// what your team gets for capture
#define CTF_RECOVERY_BONUS		10		// what you get for recovery
#define CTF_FLAG_BONUS			10		// what you get for picking up enemy flag
#define CTF_FRAG_CARRIER_BONUS	20		// what you get for fragging enemy flag carrier
#define CTF_FLAG_RETURN_TIME	40000	// seconds until auto return

#define CTF_CARRIER_DANGER_PROTECT_BONUS	5	// bonus for fraggin someone who has recently hurt your flag carrier
#define CTF_CARRIER_PROTECT_BONUS			2	// bonus for fraggin someone while either you or your target are near your flag carrier
#define CTF_FLAG_DEFENSE_BONUS				10	// bonus for fraggin someone while either you or your target are near your flag
#define CTF_RETURN_FLAG_ASSIST_BONUS		10	// awarded for returning a flag that causes a capture to happen almost immediately
#define CTF_FRAG_CARRIER_ASSIST_BONUS		10	// award for fragging a flag carrier if a capture happens almost immediately

#else

#define CTF_CAPTURE_BONUS		5		// what you get for capture
#define CTF_TEAM_BONUS			0		// what your team gets for capture
#define CTF_RECOVERY_BONUS		1		// what you get for recovery
#define CTF_FLAG_BONUS			0		// what you get for picking up enemy flag
#define CTF_FRAG_CARRIER_BONUS	2		// what you get for fragging enemy flag carrier
#define CTF_FLAG_RETURN_TIME	40000	// seconds until auto return

#define CTF_CARRIER_DANGER_PROTECT_BONUS	2	// bonus for fraggin someone who has recently hurt your flag carrier
#define CTF_CARRIER_PROTECT_BONUS			1	// bonus for fraggin someone while either you or your target are near your flag carrier
#define CTF_FLAG_DEFENSE_BONUS				1	// bonus for fraggin someone while either you or your target are near your flag
#define CTF_RETURN_FLAG_ASSIST_BONUS		1	// awarded for returning a flag that causes a capture to happen almost immediately
#define CTF_FRAG_CARRIER_ASSIST_BONUS		2	// award for fragging a flag carrier if a capture happens almost immediately

// KILDEREAN
#define PURE_CTF_CAPTURE_BONUS					15		// what you get for capture
#define PURE_CTF_TEAM_BONUS                     2		// what your team gets for capture
#define PURE_CTF_RECOVERY_BONUS					1		// what you get for recovery
#define PURE_CTF_FLAG_BONUS                     2		// what you get for picking up enemy flag
#define PURE_CTF_FRAG_CARRIER_BONUS				5		// what you get for fragging enemy flag carrier
#define PURE_CTF_CARRIER_DANGER_PROTECT_BONUS   5		// bonus for fraggin someone who has recently hurt your flag carrier
#define PURE_CTF_CARRIER_PROTECT_BONUS			3		// bonus for fraggin someone while either you or your target are near your flag carrier
#define PURE_CTF_FLAG_DEFENSE_BONUS				3		// bonus for fraggin someone while either you or your target are near your flag
#define PURE_CTF_RETURN_FLAG_ASSIST_BONUS		1		// awarded for returning a flag that causes a capture to happen almost immediately
#define PURE_CTF_FRAG_CARRIER_ASSIST_BONUS		1		// award for fragging a flag carrier if a capture happens almost immediately
// END KILDEREAN

#endif

#define CTF_TARGET_PROTECT_RADIUS			1000	// the radius around an object being defended where a target will be worth extra frags
#define CTF_ATTACKER_PROTECT_RADIUS			1000	// the radius around an object being defended where an attacker will get extra frags when making kills

#define CTF_CARRIER_DANGER_PROTECT_TIMEOUT	8000
#define CTF_FRAG_CARRIER_ASSIST_TIMEOUT		10000
#define CTF_RETURN_FLAG_ASSIST_TIMEOUT		10000

// KILDEREAN : hook speed (missile)
//#define CTF_GRAPPLE_SPEED					750 // speed of grapple in flight
//#define CTF_GRAPPLE_PULL_SPEED				750	// speed player is pulled at
#define PURE_HOOKFAST					1200
#define PURE_HOOKNORMAL					800
// END KILDEREAN

#define OVERLOAD_ATTACK_BASE_SOUND_TIME		20000

// Prototypes

int OtherTeam(int team);
const char *TeamName(int team);
const char *OtherTeamName(int team);
const char *TeamColorString(int team);
void AddTeamScore(vec3_t origin, int team, int score);

void Team_DroppedFlagThink(gentity_t *ent);
void Team_FragBonuses(gentity_t *targ, gentity_t *inflictor, gentity_t *attacker);
void Team_CheckHurtCarrier(gentity_t *targ, gentity_t *attacker);
void Team_InitGame(void);
void Team_ReturnFlag(int team);
void Team_FreeEntity(gentity_t *ent);
gentity_t *SelectCTFSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles );
gentity_t *Team_GetLocation(gentity_t *ent);
qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen);
void TeamplayInfoMessage( gentity_t *ent );
void CheckTeamStatus(void);

int Pickup_Team( gentity_t *ent, gentity_t *other );
