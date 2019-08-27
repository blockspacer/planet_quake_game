export Team_InitGame
code
proc Team_InitGame 4 12
file "../g_team.c"
line 25
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:
;7:typedef struct teamgame_s {
;8:	float			last_flag_capture;
;9:	int				last_capture_team;
;10:	flagStatus_t	redStatus;	// CTF
;11:	flagStatus_t	blueStatus;	// CTF
;12:	flagStatus_t	flagStatus;	// One Flag CTF
;13:	int				redTakenTime;
;14:	int				blueTakenTime;
;15:	int				redObeliskAttackedTime;
;16:	int				blueObeliskAttackedTime;
;17:} teamgame_t;
;18:
;19:teamgame_t teamgame;
;20:
;21:gentity_t	*neutralObelisk;
;22:
;23:void Team_SetFlagStatus( int team, flagStatus_t status );
;24:
;25:void Team_InitGame( void ) {
line 26
;26:	memset(&teamgame, 0, sizeof teamgame);
ADDRGP4 teamgame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 36
ARGI4
ADDRGP4 memset
CALLP4
pop
line 28
;27:
;28:	switch( g_gametype.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $56
ADDRGP4 $54
JUMPV
LABELV $56
line 30
;29:	case GT_CTF:
;30:		teamgame.redStatus = teamgame.blueStatus = -1; // Invalid to force update
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRGP4 teamgame+12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 teamgame+8
ADDRLP4 0
INDIRI4
ASGNI4
line 31
;31:		Team_SetFlagStatus( TEAM_RED, FLAG_ATBASE );
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 32
;32:		Team_SetFlagStatus( TEAM_BLUE, FLAG_ATBASE );
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 33
;33:		break;
line 41
;34:#ifdef MISSIONPACK
;35:	case GT_1FCTF:
;36:		teamgame.flagStatus = -1; // Invalid to force update
;37:		Team_SetFlagStatus( TEAM_FREE, FLAG_ATBASE );
;38:		break;
;39:#endif
;40:	default:
;41:		break;
LABELV $54
line 43
;42:	}
;43:}
LABELV $52
endproc Team_InitGame 4 12
export OtherTeam
proc OtherTeam 0 0
line 45
;44:
;45:int OtherTeam(int team) {
line 46
;46:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $60
line 47
;47:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $59
JUMPV
LABELV $60
line 48
;48:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $62
line 49
;49:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $59
JUMPV
LABELV $62
line 50
;50:	return team;
ADDRFP4 0
INDIRI4
RETI4
LABELV $59
endproc OtherTeam 0 0
export TeamName
proc TeamName 0 0
line 53
;51:}
;52:
;53:const char *TeamName(int team)  {
line 54
;54:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $65
line 55
;55:		return "RED";
ADDRGP4 $67
RETP4
ADDRGP4 $64
JUMPV
LABELV $65
line 56
;56:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $68
line 57
;57:		return "BLUE";
ADDRGP4 $70
RETP4
ADDRGP4 $64
JUMPV
LABELV $68
line 58
;58:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $71
line 59
;59:		return "SPECTATOR";
ADDRGP4 $73
RETP4
ADDRGP4 $64
JUMPV
LABELV $71
line 60
;60:	return "FREE";
ADDRGP4 $74
RETP4
LABELV $64
endproc TeamName 0 0
export OtherTeamName
proc OtherTeamName 0 0
line 63
;61:}
;62:
;63:const char *OtherTeamName(int team) {
line 64
;64:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $76
line 65
;65:		return "BLUE";
ADDRGP4 $70
RETP4
ADDRGP4 $75
JUMPV
LABELV $76
line 66
;66:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $78
line 67
;67:		return "RED";
ADDRGP4 $67
RETP4
ADDRGP4 $75
JUMPV
LABELV $78
line 68
;68:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $80
line 69
;69:		return "SPECTATOR";
ADDRGP4 $73
RETP4
ADDRGP4 $75
JUMPV
LABELV $80
line 70
;70:	return "FREE";
ADDRGP4 $74
RETP4
LABELV $75
endproc OtherTeamName 0 0
export TeamColorString
proc TeamColorString 0 0
line 73
;71:}
;72:
;73:const char *TeamColorString(int team) {
line 74
;74:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $83
line 75
;75:		return S_COLOR_RED;
ADDRGP4 $85
RETP4
ADDRGP4 $82
JUMPV
LABELV $83
line 76
;76:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $86
line 77
;77:		return S_COLOR_BLUE;
ADDRGP4 $88
RETP4
ADDRGP4 $82
JUMPV
LABELV $86
line 78
;78:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $89
line 79
;79:		return S_COLOR_YELLOW;
ADDRGP4 $91
RETP4
ADDRGP4 $82
JUMPV
LABELV $89
line 80
;80:	return S_COLOR_WHITE;
ADDRGP4 $92
RETP4
LABELV $82
endproc TeamColorString 0 0
export PrintMsg
proc PrintMsg 1048 12
line 84
;81:}
;82:
;83:// NULL for everyone
;84:void QDECL PrintMsg( gentity_t *ent, const char *fmt, ... ) {
line 89
;85:	char		msg[1024];
;86:	va_list		argptr;
;87:	char		*p;
;88:	
;89:	va_start (argptr,fmt);
ADDRLP4 1028
ADDRFP4 4+4
ASGNP4
line 90
;90:	if (vsprintf (msg, fmt, argptr) > sizeof(msg)) {
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 vsprintf
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CVIU4 4
CNSTU4 1024
LEU4 $95
line 91
;91:		G_Error ( "PrintMsg overrun" );
ADDRGP4 $97
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 92
;92:	}
LABELV $95
line 93
;93:	va_end (argptr);
ADDRLP4 1028
CNSTP4 0
ASGNP4
ADDRGP4 $99
JUMPV
LABELV $98
line 97
;94:
;95:	// double quotes are bad
;96:	while ((p = strchr(msg, '"')) != NULL)
;97:		*p = '\'';
ADDRLP4 0
INDIRP4
CNSTI1 39
ASGNI1
LABELV $99
line 96
ADDRLP4 4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $98
line 99
;98:
;99:	trap_SendServerCommand ( ( (ent == NULL) ? -1 : ent-g_entities ), va("print \"%s\"", msg ));
ADDRGP4 $102
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
ADDRLP4 1040
CNSTI4 -1
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ASGNI4
LABELV $104
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 100
;100:}
LABELV $93
endproc PrintMsg 1048 12
export AddTeamScore
proc AddTeamScore 16 8
line 110
;101:
;102:/*
;103:==============
;104:AddTeamScore
;105:
;106: used for gametype > GT_TEAM
;107: for gametype GT_TEAM the level.teamScores is updated in AddScore in g_combat.c
;108:==============
;109:*/
;110:void AddTeamScore(vec3_t origin, int team, int score) {
line 113
;111:	gentity_t	*te;
;112:
;113:	te = G_TempEntity(origin, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 114
;114:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 116
;115:
;116:	if ( team == TEAM_RED ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $106
line 117
;117:		if ( level.teamScores[ TEAM_RED ] + score == level.teamScores[ TEAM_BLUE ] ) {
ADDRGP4 level+48+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+48+8
INDIRI4
NEI4 $108
line 119
;118:			//teams are tied sound
;119:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 12
ASGNI4
line 120
;120:		}
ADDRGP4 $107
JUMPV
LABELV $108
line 121
;121:		else if ( level.teamScores[ TEAM_RED ] <= level.teamScores[ TEAM_BLUE ] &&
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 level+48+8
INDIRI4
GTI4 $114
ADDRGP4 level+48+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+48+8
INDIRI4
LEI4 $114
line 122
;122:					level.teamScores[ TEAM_RED ] + score > level.teamScores[ TEAM_BLUE ]) {
line 124
;123:			// red took the lead sound
;124:			te->s.eventParm = GTS_REDTEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 10
ASGNI4
line 125
;125:		}
ADDRGP4 $107
JUMPV
LABELV $114
line 126
;126:		else {
line 128
;127:			// red scored sound
;128:			te->s.eventParm = GTS_REDTEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 8
ASGNI4
line 129
;129:		}
line 130
;130:	}
ADDRGP4 $107
JUMPV
LABELV $106
line 131
;131:	else {
line 132
;132:		if ( level.teamScores[ TEAM_BLUE ] + score == level.teamScores[ TEAM_RED ] ) {
ADDRGP4 level+48+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+48+4
INDIRI4
NEI4 $124
line 134
;133:			//teams are tied sound
;134:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 12
ASGNI4
line 135
;135:		}
ADDRGP4 $125
JUMPV
LABELV $124
line 136
;136:		else if ( level.teamScores[ TEAM_BLUE ] <= level.teamScores[ TEAM_RED ] &&
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 level+48+4
INDIRI4
GTI4 $130
ADDRGP4 level+48+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+48+4
INDIRI4
LEI4 $130
line 137
;137:					level.teamScores[ TEAM_BLUE ] + score > level.teamScores[ TEAM_RED ]) {
line 139
;138:			// blue took the lead sound
;139:			te->s.eventParm = GTS_BLUETEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 11
ASGNI4
line 140
;140:		}
ADDRGP4 $131
JUMPV
LABELV $130
line 141
;141:		else {
line 143
;142:			// blue scored sound
;143:			te->s.eventParm = GTS_BLUETEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 9
ASGNI4
line 144
;144:		}
LABELV $131
LABELV $125
line 145
;145:	}
LABELV $107
line 146
;146:	level.teamScores[ team ] += score;
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+48
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 147
;147:}
LABELV $105
endproc AddTeamScore 16 8
export OnSameTeam
proc OnSameTeam 16 0
line 154
;148:
;149:/*
;150:==============
;151:OnSameTeam
;152:==============
;153:*/
;154:qboolean OnSameTeam( gentity_t *ent1, gentity_t *ent2 ) {
line 155
;155:	if ( !ent1->client || !ent2->client ) {
ADDRLP4 0
CNSTI4 516
ASGNI4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $144
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $142
LABELV $144
line 156
;156:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $142
line 159
;157:	}
;158:
;159:	if ( g_gametype.integer < GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $145
line 160
;160:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $145
line 163
;161:	}
;162:
;163:	if ( ent1->client->sess.sessionTeam == ent2->client->sess.sessionTeam ) {
ADDRLP4 8
CNSTI4 516
ASGNI4
ADDRLP4 12
CNSTI4 616
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $148
line 164
;164:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $141
JUMPV
LABELV $148
line 167
;165:	}
;166:
;167:	return qfalse;
CNSTI4 0
RETI4
LABELV $141
endproc OnSameTeam 16 0
data
align 1
LABELV ctfFlagStatusRemap
byte 1 48
byte 1 49
byte 1 42
byte 1 42
byte 1 50
align 1
LABELV oneFlagStatusRemap
byte 1 48
byte 1 49
byte 1 50
byte 1 51
byte 1 52
export Team_SetFlagStatus
code
proc Team_SetFlagStatus 12 8
line 174
;168:}
;169:
;170:
;171:static char ctfFlagStatusRemap[] = { '0', '1', '*', '*', '2' };
;172:static char oneFlagStatusRemap[] = { '0', '1', '2', '3', '4' };
;173:
;174:void Team_SetFlagStatus( int team, flagStatus_t status ) {
line 175
;175:	qboolean modified = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 177
;176:
;177:	switch( team ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $163
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $153
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $158
ADDRGP4 $151
JUMPV
LABELV $153
line 179
;178:	case TEAM_RED:	// CTF
;179:		if( teamgame.redStatus != status ) {
ADDRGP4 teamgame+8
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $152
line 180
;180:			teamgame.redStatus = status;
ADDRGP4 teamgame+8
ADDRFP4 4
INDIRI4
ASGNI4
line 181
;181:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 182
;182:		}
line 183
;183:		break;
ADDRGP4 $152
JUMPV
LABELV $158
line 186
;184:
;185:	case TEAM_BLUE:	// CTF
;186:		if( teamgame.blueStatus != status ) {
ADDRGP4 teamgame+12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $152
line 187
;187:			teamgame.blueStatus = status;
ADDRGP4 teamgame+12
ADDRFP4 4
INDIRI4
ASGNI4
line 188
;188:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 189
;189:		}
line 190
;190:		break;
ADDRGP4 $152
JUMPV
LABELV $163
line 193
;191:
;192:	case TEAM_FREE:	// One Flag CTF
;193:		if( teamgame.flagStatus != status ) {
ADDRGP4 teamgame+16
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $152
line 194
;194:			teamgame.flagStatus = status;
ADDRGP4 teamgame+16
ADDRFP4 4
INDIRI4
ASGNI4
line 195
;195:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 196
;196:		}
line 197
;197:		break;
LABELV $151
LABELV $152
line 200
;198:	}
;199:
;200:	if( modified ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $168
line 203
;201:		char st[4];
;202:
;203:		if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $170
line 204
;204:			st[0] = ctfFlagStatusRemap[teamgame.redStatus];
ADDRLP4 8
ADDRGP4 teamgame+8
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 205
;205:			st[1] = ctfFlagStatusRemap[teamgame.blueStatus];
ADDRLP4 8+1
ADDRGP4 teamgame+12
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 206
;206:			st[2] = 0;
ADDRLP4 8+2
CNSTI1 0
ASGNI1
line 207
;207:		}
ADDRGP4 $171
JUMPV
LABELV $170
line 208
;208:		else {		// GT_1FCTF
line 209
;209:			st[0] = oneFlagStatusRemap[teamgame.flagStatus];
ADDRLP4 8
ADDRGP4 teamgame+16
INDIRI4
ADDRGP4 oneFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 210
;210:			st[1] = 0;
ADDRLP4 8+1
CNSTI1 0
ASGNI1
line 211
;211:		}
LABELV $171
line 213
;212:
;213:		trap_SetConfigstring( CS_FLAGSTATUS, st );
CNSTI4 23
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 214
;214:	}
LABELV $168
line 215
;215:}
LABELV $150
endproc Team_SetFlagStatus 12 8
export Team_CheckDroppedItem
proc Team_CheckDroppedItem 0 8
line 217
;216:
;217:void Team_CheckDroppedItem( gentity_t *dropped ) {
line 218
;218:	if( dropped->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $180
line 219
;219:		Team_SetFlagStatus( TEAM_RED, FLAG_DROPPED );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 220
;220:	}
ADDRGP4 $181
JUMPV
LABELV $180
line 221
;221:	else if( dropped->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $182
line 222
;222:		Team_SetFlagStatus( TEAM_BLUE, FLAG_DROPPED );
CNSTI4 2
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 223
;223:	}
ADDRGP4 $183
JUMPV
LABELV $182
line 224
;224:	else if( dropped->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
NEI4 $184
line 225
;225:		Team_SetFlagStatus( TEAM_FREE, FLAG_DROPPED );
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 226
;226:	}
LABELV $184
LABELV $183
LABELV $181
line 227
;227:}
LABELV $179
endproc Team_CheckDroppedItem 0 8
export Team_ForceGesture
proc Team_ForceGesture 12 0
line 234
;228:
;229:/*
;230:================
;231:Team_ForceGesture
;232:================
;233:*/
;234:void Team_ForceGesture(int team) {
line 238
;235:	int i;
;236:	gentity_t *ent;
;237:
;238:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $187
line 239
;239:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 240
;240:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $191
line 241
;241:			continue;
ADDRGP4 $188
JUMPV
LABELV $191
line 242
;242:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $193
line 243
;243:			continue;
ADDRGP4 $188
JUMPV
LABELV $193
line 244
;244:		if (ent->client->sess.sessionTeam != team)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $195
line 245
;245:			continue;
ADDRGP4 $188
JUMPV
LABELV $195
line 247
;246:		//
;247:		ent->flags |= FL_FORCE_GESTURE;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 248
;248:	}
LABELV $188
line 238
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $187
line 249
;249:}
LABELV $186
endproc Team_ForceGesture 12 0
export Team_FragBonuses
proc Team_FragBonuses 276 16
line 261
;250:
;251:/*
;252:================
;253:Team_FragBonuses
;254:
;255:Calculate the bonuses for flag defense, flag carrier defense, etc.
;256:Note that bonuses are not cumulative.  You get one, they are in importance
;257:order.
;258:================
;259:*/
;260:void Team_FragBonuses(gentity_t *targ, gentity_t *inflictor, gentity_t *attacker)
;261:{
line 267
;262:	int i;
;263:	gentity_t *ent;
;264:	int flag_pw, enemy_flag_pw;
;265:	int otherteam;
;266:	int tokens;
;267:	gentity_t *flag, *carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 273
;268:	char *c;
;269:	vec3_t v1, v2;
;270:	int team;
;271:
;272:	// no bonus for fragging yourself or team mates
;273:	if (!targ->client || !attacker->client || targ == attacker || OnSameTeam(targ, attacker))
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 516
ASGNI4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $202
ADDRLP4 76
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $202
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
EQU4 $202
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $198
LABELV $202
line 274
;274:		return;
ADDRGP4 $197
JUMPV
LABELV $198
line 276
;275:
;276:	team = targ->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 277
;277:	otherteam = OtherTeam(targ->client->sess.sessionTeam);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 84
INDIRI4
ASGNI4
line 278
;278:	if (otherteam < 0)
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $203
line 279
;279:		return; // whoever died isn't on a team
ADDRGP4 $197
JUMPV
LABELV $203
line 282
;280:
;281:	// same team, if the flag at base, check to he has the enemy flag
;282:	if (team == TEAM_RED) {
ADDRLP4 52
INDIRI4
CNSTI4 1
NEI4 $205
line 283
;283:		flag_pw = PW_REDFLAG;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 284
;284:		enemy_flag_pw = PW_BLUEFLAG;
ADDRLP4 60
CNSTI4 8
ASGNI4
line 285
;285:	} else {
ADDRGP4 $206
JUMPV
LABELV $205
line 286
;286:		flag_pw = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 8
ASGNI4
line 287
;287:		enemy_flag_pw = PW_REDFLAG;
ADDRLP4 60
CNSTI4 7
ASGNI4
line 288
;288:	}
LABELV $206
line 290
;289:
;290:	if (g_gametype.integer == GT_1FCTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $207
line 291
;291:		enemy_flag_pw = PW_NEUTRALFLAG;
ADDRLP4 60
CNSTI4 9
ASGNI4
line 292
;292:	} 
LABELV $207
line 295
;293:
;294:	// did the attacker frag the flag carrier?
;295:	tokens = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 301
;296:#ifdef MISSIONPACK
;297:	if( g_gametype.integer == GT_HARVESTER ) {
;298:		tokens = targ->client->ps.generic1;
;299:	}
;300:#endif
;301:	if (targ->client->ps.powerups[enemy_flag_pw]) {
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 302
;302:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
line 303
;303:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 304
;304:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 88
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 580
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 305
;305:		PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's flag carrier!\n",
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $213
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 310
;306:			attacker->client->pers.netname, TeamName(team));
;307:
;308:		// the target had the flag, clear the hurt carrier
;309:		// field on the other team
;310:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $214
line 311
;311:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 312
;312:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $219
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $219
line 313
;313:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
LABELV $219
line 314
;314:		}
LABELV $215
line 310
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $217
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $214
line 315
;315:		return;
ADDRGP4 $197
JUMPV
LABELV $210
line 319
;316:	}
;317:
;318:	// did the attacker frag a head carrier? other->client->ps.generic1
;319:	if (tokens) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $221
line 320
;320:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
line 321
;321:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS * tokens * tokens);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 56
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 56
INDIRI4
MULI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 322
;322:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 580
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 323
;323:		PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's skull carrier!\n",
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $224
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 328
;324:			attacker->client->pers.netname, TeamName(team));
;325:
;326:		// the target had the flag, clear the hurt carrier
;327:		// field on the other team
;328:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $228
JUMPV
LABELV $225
line 329
;329:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 330
;330:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $230
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $230
line 331
;331:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
LABELV $230
line 332
;332:		}
LABELV $226
line 328
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $228
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $225
line 333
;333:		return;
ADDRGP4 $197
JUMPV
LABELV $221
line 336
;334:	}
;335:
;336:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 88
CNSTI4 516
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 0
EQF4 $232
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $232
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $232
line 338
;337:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT &&
;338:		!attacker->client->ps.powerups[flag_pw]) {
line 341
;339:		// attacker is on the same team as the flag carrier and
;340:		// fragged a guy who hurt our flag carrier
;341:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 343
;342:
;343:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 344
;344:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 346
;345:
;346:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 347
;347:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 349
;348:		// add the sprite over the player's head
;349:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 350
;350:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 351
;351:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 353
;352:
;353:		return;
ADDRGP4 $197
JUMPV
LABELV $232
line 356
;354:	}
;355:
;356:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 0
EQF4 $236
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 96
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $236
line 357
;357:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT) {
line 359
;358:		// attacker is on the same team as the skull carrier and
;359:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 361
;360:
;361:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 362
;362:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 364
;363:
;364:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 365
;365:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 367
;366:		// add the sprite over the player's head
;367:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 368
;368:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 369
;369:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 371
;370:
;371:		return;
ADDRGP4 $197
JUMPV
LABELV $236
line 398
;372:	}
;373:
;374:	// flag and flag carrier area defense bonuses
;375:
;376:	// we have to find the flag and carrier entities
;377:
;378:#ifdef MISSIONPACK	
;379:	if( g_gametype.integer == GT_OBELISK ) {
;380:		// find the team obelisk
;381:		switch (attacker->client->sess.sessionTeam) {
;382:		case TEAM_RED:
;383:			c = "team_redobelisk";
;384:			break;
;385:		case TEAM_BLUE:
;386:			c = "team_blueobelisk";
;387:			break;		
;388:		default:
;389:			return;
;390:		}
;391:		
;392:	} else if (g_gametype.integer == GT_HARVESTER ) {
;393:		// find the center obelisk
;394:		c = "team_neutralobelisk";
;395:	} else {
;396:#endif
;397:	// find the flag
;398:	switch (attacker->client->sess.sessionTeam) {
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $243
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $245
ADDRGP4 $197
JUMPV
LABELV $243
line 400
;399:	case TEAM_RED:
;400:		c = "team_CTF_redflag";
ADDRLP4 24
ADDRGP4 $244
ASGNP4
line 401
;401:		break;
ADDRGP4 $241
JUMPV
LABELV $245
line 403
;402:	case TEAM_BLUE:
;403:		c = "team_CTF_blueflag";
ADDRLP4 24
ADDRGP4 $246
ASGNP4
line 404
;404:		break;		
line 406
;405:	default:
;406:		return;
LABELV $241
line 409
;407:	}
;408:	// find attacker's team's flag carrier
;409:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 410
;410:		carrier = g_entities + i;
ADDRLP4 4
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 411
;411:		if (carrier->inuse && carrier->client->ps.powerups[flag_pw])
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $252
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $252
line 412
;412:			break;
ADDRGP4 $249
JUMPV
LABELV $252
line 413
;413:		carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 414
;414:	}
LABELV $248
line 409
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $250
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $247
LABELV $249
line 418
;415:#ifdef MISSIONPACK
;416:	}
;417:#endif
;418:	flag = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRGP4 $255
JUMPV
LABELV $254
line 419
;419:	while ((flag = G_Find (flag, FOFS(classname), c)) != NULL) {
line 420
;420:		if (!(flag->flags & FL_DROPPED_ITEM))
ADDRLP4 8
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $257
line 421
;421:			break;
ADDRGP4 $256
JUMPV
LABELV $257
line 422
;422:	}
LABELV $255
line 419
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 108
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $254
LABELV $256
line 424
;423:
;424:	if (!flag)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $259
line 425
;425:		return; // can't find attacker's flag
ADDRGP4 $197
JUMPV
LABELV $259
line 430
;426:
;427:	// ok we have the attackers flag and a pointer to the carrier
;428:
;429:	// check to see if we are defending the base's flag
;430:	VectorSubtract(targ->r.currentOrigin, flag->r.currentOrigin, v1);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 488
ASGNI4
ADDRLP4 28
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124
CNSTI4 492
ASGNI4
ADDRLP4 28+4
ADDRLP4 112
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 128
CNSTI4 496
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 431
;431:	VectorSubtract(attacker->r.currentOrigin, flag->r.currentOrigin, v2);
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 136
CNSTI4 488
ASGNI4
ADDRLP4 40
ADDRLP4 132
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144
CNSTI4 492
ASGNI4
ADDRLP4 40+4
ADDRLP4 132
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148
CNSTI4 496
ASGNI4
ADDRLP4 40+8
ADDRFP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 433
;432:
;433:	if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 1148846080
GEF4 $268
ADDRLP4 156
CNSTI4 488
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $267
LABELV $268
ADDRLP4 40
ARGP4
ADDRLP4 164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 164
INDIRF4
CNSTF4 1148846080
GEF4 $265
ADDRLP4 168
CNSTI4 488
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $265
LABELV $267
ADDRLP4 176
CNSTI4 516
ASGNI4
ADDRLP4 180
CNSTI4 616
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
EQI4 $265
line 437
;434:		trap_InPVS(flag->r.currentOrigin, targ->r.currentOrigin ) ) ||
;435:		( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;436:		trap_InPVS(flag->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;437:		attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 440
;438:
;439:		// we defended the base flag
;440:		AddScore(attacker, targ->r.currentOrigin, CTF_FLAG_DEFENSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 441
;441:		attacker->client->pers.teamState.basedefense++;
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 568
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 443
;442:
;443:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 445
;444:		// add the sprite over the player's head
;445:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 446
;446:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 447
;447:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 449
;448:
;449:		return;
ADDRGP4 $197
JUMPV
LABELV $265
line 452
;450:	}
;451:
;452:	if (carrier && carrier != attacker) {
ADDRLP4 184
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 184
INDIRU4
CNSTU4 0
EQU4 $270
ADDRLP4 184
INDIRU4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $270
line 453
;453:		VectorSubtract(targ->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
CNSTI4 488
ASGNI4
ADDRLP4 28
ADDRLP4 188
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200
CNSTI4 492
ASGNI4
ADDRLP4 28+4
ADDRLP4 188
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 204
CNSTI4 496
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 454
;454:		VectorSubtract(attacker->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 208
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 212
CNSTI4 488
ASGNI4
ADDRLP4 28
ADDRLP4 208
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220
CNSTI4 492
ASGNI4
ADDRLP4 28+4
ADDRLP4 208
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 224
CNSTI4 496
ASGNI4
ADDRLP4 28+8
ADDRFP4 8
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 456
;455:
;456:		if ( ( ( VectorLength(v1) < CTF_ATTACKER_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 228
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 228
INDIRF4
CNSTF4 1148846080
GEF4 $279
ADDRLP4 232
CNSTI4 488
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRLP4 236
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $278
LABELV $279
ADDRLP4 40
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 240
INDIRF4
CNSTF4 1148846080
GEF4 $276
ADDRLP4 244
CNSTI4 488
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRLP4 248
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
EQI4 $276
LABELV $278
ADDRLP4 252
CNSTI4 516
ASGNI4
ADDRLP4 256
CNSTI4 616
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
EQI4 $276
line 460
;457:			trap_InPVS(carrier->r.currentOrigin, targ->r.currentOrigin ) ) ||
;458:			( VectorLength(v2) < CTF_ATTACKER_PROTECT_RADIUS &&
;459:				trap_InPVS(carrier->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;460:			attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 461
;461:			AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 462
;462:			attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 260
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 464
;463:
;464:			attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 264
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 466
;465:			// add the sprite over the player's head
;466:			attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 268
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 467
;467:			attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 272
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 468
;468:			attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 470
;469:
;470:			return;
LABELV $276
line 472
;471:		}
;472:	}
LABELV $270
line 473
;473:}
LABELV $197
endproc Team_FragBonuses 276 16
export Team_CheckHurtCarrier
proc Team_CheckHurtCarrier 36 0
line 484
;474:
;475:/*
;476:================
;477:Team_CheckHurtCarrier
;478:
;479:Check to see if attacker hurt the flag carrier.  Needed when handing out bonuses for assistance to flag
;480:carrier defense.
;481:================
;482:*/
;483:void Team_CheckHurtCarrier(gentity_t *targ, gentity_t *attacker)
;484:{
line 487
;485:	int flag_pw;
;486:
;487:	if (!targ->client || !attacker->client)
ADDRLP4 4
CNSTI4 516
ASGNI4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $284
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $282
LABELV $284
line 488
;488:		return;
ADDRGP4 $281
JUMPV
LABELV $282
line 490
;489:
;490:	if (targ->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $285
line 491
;491:		flag_pw = PW_BLUEFLAG;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $285
line 493
;492:	else
;493:		flag_pw = PW_REDFLAG;
ADDRLP4 0
CNSTI4 7
ASGNI4
LABELV $286
line 496
;494:
;495:	// flags
;496:	if (targ->client->ps.powerups[flag_pw] &&
ADDRLP4 12
CNSTI4 516
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $287
ADDRLP4 20
CNSTI4 616
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $287
line 498
;497:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;498:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
LABELV $287
line 501
;499:
;500:	// skulls
;501:	if (targ->client->ps.generic1 &&
ADDRLP4 24
CNSTI4 516
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
ADDRLP4 32
CNSTI4 616
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $290
line 503
;502:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;503:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
LABELV $290
line 504
;504:}
LABELV $281
endproc Team_CheckHurtCarrier 36 0
export Team_ResetFlag
proc Team_ResetFlag 20 12
line 507
;505:
;506:
;507:gentity_t *Team_ResetFlag( int team ) {
line 509
;508:	char *c;
;509:	gentity_t *ent, *rent = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 511
;510:
;511:	switch (team) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $298
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $296
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $297
ADDRGP4 $294
JUMPV
LABELV $296
line 513
;512:	case TEAM_RED:
;513:		c = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $244
ASGNP4
line 514
;514:		break;
ADDRGP4 $295
JUMPV
LABELV $297
line 516
;515:	case TEAM_BLUE:
;516:		c = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $246
ASGNP4
line 517
;517:		break;
ADDRGP4 $295
JUMPV
LABELV $298
line 519
;518:	case TEAM_FREE:
;519:		c = "team_CTF_neutralflag";
ADDRLP4 4
ADDRGP4 $299
ASGNP4
line 520
;520:		break;
ADDRGP4 $295
JUMPV
LABELV $294
line 522
;521:	default:
;522:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $293
JUMPV
LABELV $295
line 525
;523:	}
;524:
;525:	ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $301
JUMPV
LABELV $300
line 526
;526:	while ((ent = G_Find (ent, FOFS(classname), c)) != NULL) {
line 527
;527:		if (ent->flags & FL_DROPPED_ITEM)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $303
line 528
;528:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $304
JUMPV
LABELV $303
line 529
;529:		else {
line 530
;530:			rent = ent;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 531
;531:			RespawnItem(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 532
;532:		}
LABELV $304
line 533
;533:	}
LABELV $301
line 526
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $300
line 535
;534:
;535:	Team_SetFlagStatus( team, FLAG_ATBASE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 537
;536:
;537:	return rent;
ADDRLP4 8
INDIRP4
RETP4
LABELV $293
endproc Team_ResetFlag 20 12
export Team_ResetFlags
proc Team_ResetFlags 0 4
line 540
;538:}
;539:
;540:void Team_ResetFlags( void ) {
line 541
;541:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $306
line 542
;542:		Team_ResetFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 543
;543:		Team_ResetFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 544
;544:	}
LABELV $306
line 550
;545:#ifdef MISSIONPACK
;546:	else if( g_gametype.integer == GT_1FCTF ) {
;547:		Team_ResetFlag( TEAM_FREE );
;548:	}
;549:#endif
;550:}
LABELV $305
endproc Team_ResetFlags 0 4
export Team_ReturnFlagSound
proc Team_ReturnFlagSound 12 8
line 552
;551:
;552:void Team_ReturnFlagSound( gentity_t *ent, int team ) {
line 555
;553:	gentity_t	*te;
;554:
;555:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $310
line 556
;556:		G_Printf ("Warning:  NULL passed to Team_ReturnFlagSound\n");
ADDRGP4 $312
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 557
;557:		return;
ADDRGP4 $309
JUMPV
LABELV $310
line 560
;558:	}
;559:
;560:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 561
;561:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $313
line 562
;562:		te->s.eventParm = GTS_RED_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 2
ASGNI4
line 563
;563:	}
ADDRGP4 $314
JUMPV
LABELV $313
line 564
;564:	else {
line 565
;565:		te->s.eventParm = GTS_BLUE_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 3
ASGNI4
line 566
;566:	}
LABELV $314
line 567
;567:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 568
;568:}
LABELV $309
endproc Team_ReturnFlagSound 12 8
export Team_TakeFlagSound
proc Team_TakeFlagSound 16 8
line 570
;569:
;570:void Team_TakeFlagSound( gentity_t *ent, int team ) {
line 573
;571:	gentity_t	*te;
;572:
;573:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $316
line 574
;574:		G_Printf ("Warning:  NULL passed to Team_TakeFlagSound\n");
ADDRGP4 $318
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 575
;575:		return;
ADDRGP4 $315
JUMPV
LABELV $316
line 580
;576:	}
;577:
;578:	// only play sound when the flag was at the base
;579:	// or not picked up the last 10 seconds
;580:	switch(team) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $321
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $331
ADDRGP4 $319
JUMPV
LABELV $321
line 582
;581:		case TEAM_RED:
;582:			if( teamgame.blueStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+12
INDIRI4
CNSTI4 0
EQI4 $322
line 583
;583:				if (teamgame.blueTakenTime > level.time - 10000)
ADDRGP4 teamgame+24
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $325
line 584
;584:					return;
ADDRGP4 $315
JUMPV
LABELV $325
line 585
;585:			}
LABELV $322
line 586
;586:			teamgame.blueTakenTime = level.time;
ADDRGP4 teamgame+24
ADDRGP4 level+36
INDIRI4
ASGNI4
line 587
;587:			break;
ADDRGP4 $320
JUMPV
LABELV $331
line 590
;588:
;589:		case TEAM_BLUE:	// CTF
;590:			if( teamgame.redStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+8
INDIRI4
CNSTI4 0
EQI4 $332
line 591
;591:				if (teamgame.redTakenTime > level.time - 10000)
ADDRGP4 teamgame+20
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $335
line 592
;592:					return;
ADDRGP4 $315
JUMPV
LABELV $335
line 593
;593:			}
LABELV $332
line 594
;594:			teamgame.redTakenTime = level.time;
ADDRGP4 teamgame+20
ADDRGP4 level+36
INDIRI4
ASGNI4
line 595
;595:			break;
LABELV $319
LABELV $320
line 598
;596:	}
;597:
;598:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 599
;599:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $341
line 600
;600:		te->s.eventParm = GTS_RED_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 4
ASGNI4
line 601
;601:	}
ADDRGP4 $342
JUMPV
LABELV $341
line 602
;602:	else {
line 603
;603:		te->s.eventParm = GTS_BLUE_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 5
ASGNI4
line 604
;604:	}
LABELV $342
line 605
;605:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 606
;606:}
LABELV $315
endproc Team_TakeFlagSound 16 8
export Team_CaptureFlagSound
proc Team_CaptureFlagSound 12 8
line 608
;607:
;608:void Team_CaptureFlagSound( gentity_t *ent, int team ) {
line 611
;609:	gentity_t	*te;
;610:
;611:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $344
line 612
;612:		G_Printf ("Warning:  NULL passed to Team_CaptureFlagSound\n");
ADDRGP4 $346
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 613
;613:		return;
ADDRGP4 $343
JUMPV
LABELV $344
line 616
;614:	}
;615:
;616:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 617
;617:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $347
line 618
;618:		te->s.eventParm = GTS_BLUE_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 1
ASGNI4
line 619
;619:	}
ADDRGP4 $348
JUMPV
LABELV $347
line 620
;620:	else {
line 621
;621:		te->s.eventParm = GTS_RED_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 622
;622:	}
LABELV $348
line 623
;623:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 624
;624:}
LABELV $343
endproc Team_CaptureFlagSound 12 8
export Team_ReturnFlag
proc Team_ReturnFlag 8 12
line 626
;625:
;626:void Team_ReturnFlag( int team ) {
line 627
;627:	Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 628
;628:	if( team == TEAM_FREE ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $350
line 629
;629:		PrintMsg(NULL, "The flag has returned!\n" );
CNSTP4 0
ARGP4
ADDRGP4 $352
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 630
;630:	}
ADDRGP4 $351
JUMPV
LABELV $350
line 631
;631:	else {
line 632
;632:		PrintMsg(NULL, "The %s flag has returned!\n", TeamName(team));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 633
;633:	}
LABELV $351
line 634
;634:}
LABELV $349
endproc Team_ReturnFlag 8 12
export Team_FreeEntity
proc Team_FreeEntity 0 4
line 636
;635:
;636:void Team_FreeEntity( gentity_t *ent ) {
line 637
;637:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $355
line 638
;638:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 639
;639:	}
ADDRGP4 $356
JUMPV
LABELV $355
line 640
;640:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $357
line 641
;641:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 642
;642:	}
ADDRGP4 $358
JUMPV
LABELV $357
line 643
;643:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
NEI4 $359
line 644
;644:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 645
;645:	}
LABELV $359
LABELV $358
LABELV $356
line 646
;646:}
LABELV $354
endproc Team_FreeEntity 0 4
export Team_DroppedFlagThink
proc Team_DroppedFlagThink 8 8
line 657
;647:
;648:/*
;649:==============
;650:Team_DroppedFlagThink
;651:
;652:Automatically set in Launch_Item if the item is one of the flags
;653:
;654:Flags are unique in that if they are dropped, the base flag must be respawned when they time out
;655:==============
;656:*/
;657:void Team_DroppedFlagThink(gentity_t *ent) {
line 658
;658:	int		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 660
;659:
;660:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $362
line 661
;661:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 662
;662:	}
ADDRGP4 $363
JUMPV
LABELV $362
line 663
;663:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $364
line 664
;664:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 665
;665:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 666
;666:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
NEI4 $366
line 667
;667:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 668
;668:	}
LABELV $366
LABELV $365
LABELV $363
line 670
;669:
;670:	Team_ReturnFlagSound( Team_ResetFlag( team ), team );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 672
;671:	// Reset Flag will delete this entity
;672:}
LABELV $361
endproc Team_DroppedFlagThink 8 8
export Team_TouchOurFlag
proc Team_TouchOurFlag 64 16
line 680
;673:
;674:
;675:/*
;676:==============
;677:Team_DroppedFlagThink
;678:==============
;679:*/
;680:int Team_TouchOurFlag( gentity_t *ent, gentity_t *other, int team ) {
line 683
;681:	int			i;
;682:	gentity_t	*player;
;683:	gclient_t	*cl = other->client;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 692
;684:	int			enemy_flag;
;685:
;686:#ifdef MISSIONPACK
;687:	if( g_gametype.integer == GT_1FCTF ) {
;688:		enemy_flag = PW_NEUTRALFLAG;
;689:	}
;690:	else {
;691:#endif
;692:	if (cl->sess.sessionTeam == TEAM_RED) {
ADDRLP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $369
line 693
;693:		enemy_flag = PW_BLUEFLAG;
ADDRLP4 12
CNSTI4 8
ASGNI4
line 694
;694:	} else {
ADDRGP4 $370
JUMPV
LABELV $369
line 695
;695:		enemy_flag = PW_REDFLAG;
ADDRLP4 12
CNSTI4 7
ASGNI4
line 696
;696:	}
LABELV $370
line 698
;697:
;698:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $371
line 700
;699:		// hey, its not home.  return it by teleporting it back
;700:		PrintMsg( NULL, "%s" S_COLOR_WHITE " returned the %s flag!\n", 
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 702
;701:			cl->pers.netname, TeamName(team));
;702:		AddScore(other, ent->r.currentOrigin, CTF_RECOVERY_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 703
;703:		other->client->pers.teamState.flagrecovery++;
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 704
;704:		other->client->pers.teamState.lastreturnedflag = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
line 706
;705:		//ResetFlag will remove this entity!  We must return zero
;706:		Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 707
;707:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $371
line 715
;708:	}
;709:#ifdef MISSIONPACK
;710:	}
;711:#endif
;712:
;713:	// the flag is at home base.  if the player has the enemy
;714:	// flag, he's just won!
;715:	if (!cl->ps.powerups[enemy_flag])
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $375
line 716
;716:		return 0; // We don't have the flag
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $375
line 723
;717:#ifdef MISSIONPACK
;718:	if( g_gametype.integer == GT_1FCTF ) {
;719:		PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the flag!\n", cl->pers.netname );
;720:	}
;721:	else {
;722:#endif
;723:	PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the %s flag!\n", cl->pers.netname, TeamName(OtherTeam(team)));
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 728
;724:#ifdef MISSIONPACK
;725:	}
;726:#endif
;727:
;728:	cl->ps.powerups[enemy_flag] = 0;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 730
;729:
;730:	teamgame.last_flag_capture = level.time;
ADDRGP4 teamgame
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
line 731
;731:	teamgame.last_capture_team = team;
ADDRGP4 teamgame+4
ADDRFP4 8
INDIRI4
ASGNI4
line 734
;732:
;733:	// Increase the team's score
;734:	AddTeamScore(ent->s.pos.trBase, other->client->sess.sessionTeam, 1);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 735
;735:	Team_ForceGesture(other->client->sess.sessionTeam);
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRGP4 Team_ForceGesture
CALLV
pop
line 737
;736:
;737:	other->client->pers.teamState.captures++;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 739
;738:	// add the sprite over the player's head
;739:	other->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 740
;740:	other->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 741
;741:	other->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 742
;742:	other->client->ps.persistant[PERS_CAPTURES]++;
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 745
;743:
;744:	// other gets another 10 frag bonus
;745:	AddScore(other, ent->r.currentOrigin, CTF_CAPTURE_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 747
;746:
;747:	Team_CaptureFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLV
pop
line 750
;748:
;749:	// Ok, let's do the player loop, hand out the bonuses
;750:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $381
line 751
;751:		player = &g_entities[i];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 752
;752:		if (!player->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $386
line 753
;753:			continue;
ADDRGP4 $382
JUMPV
LABELV $386
line 755
;754:
;755:		if (player->client->sess.sessionTeam !=
ADDRLP4 40
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
EQI4 $388
line 756
;756:			cl->sess.sessionTeam) {
line 757
;757:			player->client->pers.teamState.lasthurtcarrier = -5;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 3231711232
ASGNF4
line 758
;758:		} else if (player->client->sess.sessionTeam ==
ADDRGP4 $389
JUMPV
LABELV $388
ADDRLP4 44
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
NEI4 $390
line 759
;759:			cl->sess.sessionTeam) {
line 760
;760:			if (player != other)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $392
line 761
;761:				AddScore(player, ent->r.currentOrigin, CTF_TEAM_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $392
line 763
;762:			// award extra points for capture assists
;763:			if (player->client->pers.teamState.lastreturnedflag + 
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $394
line 764
;764:				CTF_RETURN_FLAG_ASSIST_TIMEOUT > level.time) {
line 765
;765:				AddScore (player, ent->r.currentOrigin, CTF_RETURN_FLAG_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 766
;766:				other->client->pers.teamState.assists++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 768
;767:
;768:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 770
;769:				// add the sprite over the player's head
;770:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 771
;771:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 772
;772:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 774
;773:
;774:			} else if (player->client->pers.teamState.lastfraggedcarrier + 
ADDRGP4 $395
JUMPV
LABELV $394
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $398
line 775
;775:				CTF_FRAG_CARRIER_ASSIST_TIMEOUT > level.time) {
line 776
;776:				AddScore(player, ent->r.currentOrigin, CTF_FRAG_CARRIER_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 777
;777:				other->client->pers.teamState.assists++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 778
;778:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 780
;779:				// add the sprite over the player's head
;780:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 781
;781:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 782
;782:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 783
;783:			}
LABELV $398
LABELV $395
line 784
;784:		}
LABELV $390
LABELV $389
line 785
;785:	}
LABELV $382
line 750
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $384
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $381
line 786
;786:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 788
;787:
;788:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 790
;789:
;790:	return 0; // Do not respawn this automatically
CNSTI4 0
RETI4
LABELV $368
endproc Team_TouchOurFlag 64 16
export Team_TouchEnemyFlag
proc Team_TouchEnemyFlag 8 16
line 793
;791:}
;792:
;793:int Team_TouchEnemyFlag( gentity_t *ent, gentity_t *other, int team ) {
line 794
;794:	gclient_t *cl = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 811
;795:
;796:#ifdef MISSIONPACK
;797:	if( g_gametype.integer == GT_1FCTF ) {
;798:		PrintMsg (NULL, "%s" S_COLOR_WHITE " got the flag!\n", other->client->pers.netname );
;799:
;800:		cl->ps.powerups[PW_NEUTRALFLAG] = INT_MAX; // flags never expire
;801:
;802:		if( team == TEAM_RED ) {
;803:			Team_SetFlagStatus( TEAM_FREE, FLAG_TAKEN_RED );
;804:		}
;805:		else {
;806:			Team_SetFlagStatus( TEAM_FREE, FLAG_TAKEN_BLUE );
;807:		}
;808:	}
;809:	else{
;810:#endif
;811:		PrintMsg (NULL, "%s" S_COLOR_WHITE " got the %s flag!\n",
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $403
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 814
;812:			other->client->pers.netname, TeamName(team));
;813:
;814:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $404
line 815
;815:			cl->ps.powerups[PW_REDFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 2147483647
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $404
line 817
;816:		else
;817:			cl->ps.powerups[PW_BLUEFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 2147483647
ASGNI4
LABELV $405
line 819
;818:
;819:		Team_SetFlagStatus( team, FLAG_TAKEN );
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 824
;820:#ifdef MISSIONPACK
;821:	}
;822:#endif
;823:
;824:	AddScore(other, ent->r.currentOrigin, CTF_FLAG_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 825
;825:	cl->pers.teamState.flagsince = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
line 826
;826:	Team_TakeFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_TakeFlagSound
CALLV
pop
line 828
;827:
;828:	return -1; // Do not respawn this automatically, but do delete it if it was FL_DROPPED
CNSTI4 -1
RETI4
LABELV $402
endproc Team_TouchEnemyFlag 8 16
export Pickup_Team
proc Pickup_Team 20 12
line 831
;829:}
;830:
;831:int Pickup_Team( gentity_t *ent, gentity_t *other ) {
line 833
;832:	int team;
;833:	gclient_t *cl = other->client;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 852
;834:
;835:#ifdef MISSIONPACK
;836:	if( g_gametype.integer == GT_OBELISK ) {
;837:		// there are no team items that can be picked up in obelisk
;838:		G_FreeEntity( ent );
;839:		return 0;
;840:	}
;841:
;842:	if( g_gametype.integer == GT_HARVESTER ) {
;843:		// the only team items that can be picked up in harvester are the cubes
;844:		if( ent->spawnflags != cl->sess.sessionTeam ) {
;845:			cl->ps.generic1 += 1;
;846:		}
;847:		G_FreeEntity( ent );
;848:		return 0;
;849:	}
;850:#endif
;851:	// figure out what team this flag is
;852:	if( strcmp(ent->classname, "team_CTF_redflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $408
line 853
;853:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 854
;854:	}
ADDRGP4 $409
JUMPV
LABELV $408
line 855
;855:	else if( strcmp(ent->classname, "team_CTF_blueflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $246
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $410
line 856
;856:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 857
;857:	}
ADDRGP4 $411
JUMPV
LABELV $410
line 863
;858:#ifdef MISSIONPACK
;859:	else if( strcmp(ent->classname, "team_CTF_neutralflag") == 0  ) {
;860:		team = TEAM_FREE;
;861:	}
;862:#endif
;863:	else {
line 864
;864:		PrintMsg ( other, "Don't know what team the flag is on.\n");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $412
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 865
;865:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $407
JUMPV
LABELV $411
LABELV $409
line 879
;866:	}
;867:#ifdef MISSIONPACK
;868:	if( g_gametype.integer == GT_1FCTF ) {
;869:		if( team == TEAM_FREE ) {
;870:			return Team_TouchEnemyFlag( ent, other, cl->sess.sessionTeam );
;871:		}
;872:		if( team != cl->sess.sessionTeam) {
;873:			return Team_TouchOurFlag( ent, other, cl->sess.sessionTeam );
;874:		}
;875:		return 0;
;876:	}
;877:#endif
;878:	// GT_CTF
;879:	if( team == cl->sess.sessionTeam) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
NEI4 $413
line 880
;880:		return Team_TouchOurFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Team_TouchOurFlag
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $407
JUMPV
LABELV $413
line 882
;881:	}
;882:	return Team_TouchEnemyFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Team_TouchEnemyFlag
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $407
endproc Pickup_Team 20 12
export Team_GetLocation
proc Team_GetLocation 48 8
line 893
;883:}
;884:
;885:/*
;886:===========
;887:Team_GetLocation
;888:
;889:Report a location for the player. Uses placed nearby target_location entities
;890:============
;891:*/
;892:gentity_t *Team_GetLocation(gentity_t *ent)
;893:{
line 898
;894:	gentity_t		*eloc, *best;
;895:	float			bestlen, len;
;896:	vec3_t			origin;
;897:
;898:	best = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 899
;899:	bestlen = 3*8192.0*8192.0;
ADDRLP4 20
CNSTF4 1296039936
ASGNF4
line 901
;900:
;901:	VectorCopy( ent->r.currentOrigin, origin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 903
;902:
;903:	for (eloc = level.locationHead; eloc; eloc = eloc->nextTrain) {
ADDRLP4 0
ADDRGP4 level+9176
INDIRP4
ASGNP4
ADDRGP4 $419
JUMPV
LABELV $416
line 904
;904:		len = ( origin[0] - eloc->r.currentOrigin[0] ) * ( origin[0] - eloc->r.currentOrigin[0] )
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 908
;905:			+ ( origin[1] - eloc->r.currentOrigin[1] ) * ( origin[1] - eloc->r.currentOrigin[1] )
;906:			+ ( origin[2] - eloc->r.currentOrigin[2] ) * ( origin[2] - eloc->r.currentOrigin[2] );
;907:
;908:		if ( len > bestlen ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LEF4 $425
line 909
;909:			continue;
ADDRGP4 $417
JUMPV
LABELV $425
line 912
;910:		}
;911:
;912:		if ( !trap_InPVS( origin, eloc->r.currentOrigin ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $427
line 913
;913:			continue;
ADDRGP4 $417
JUMPV
LABELV $427
line 916
;914:		}
;915:
;916:		bestlen = len;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 917
;917:		best = eloc;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 918
;918:	}
LABELV $417
line 903
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ASGNP4
LABELV $419
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $416
line 920
;919:
;920:	return best;
ADDRLP4 24
INDIRP4
RETP4
LABELV $415
endproc Team_GetLocation 48 8
export Team_GetLocationMsg
proc Team_GetLocationMsg 12 24
line 932
;921:}
;922:
;923:
;924:/*
;925:===========
;926:Team_GetLocation
;927:
;928:Report a location for the player. Uses placed nearby target_location entities
;929:============
;930:*/
;931:qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen)
;932:{
line 935
;933:	gentity_t *best;
;934:
;935:	best = Team_GetLocation( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 937
;936:	
;937:	if (!best)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $430
line 938
;938:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $429
JUMPV
LABELV $430
line 940
;939:
;940:	if (best->count) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
line 941
;941:		if (best->count < 0)
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
GEI4 $434
line 942
;942:			best->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
LABELV $434
line 943
;943:		if (best->count > 7)
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 7
LEI4 $436
line 944
;944:			best->count = 7;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 7
ASGNI4
LABELV $436
line 945
;945:		Com_sprintf(loc, loclen, "%c%c%s" S_COLOR_WHITE, Q_COLOR_ESCAPE, best->count + '0', best->message );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $438
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 946
;946:	} else
ADDRGP4 $433
JUMPV
LABELV $432
line 947
;947:		Com_sprintf(loc, loclen, "%s", best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $439
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $433
line 949
;948:
;949:	return qtrue;
CNSTI4 1
RETI4
LABELV $429
endproc Team_GetLocationMsg 12 24
export SelectRandomTeamSpawnPoint
proc SelectRandomTeamSpawnPoint 152 12
line 963
;950:}
;951:
;952:
;953:/*---------------------------------------------------------------------------*/
;954:
;955:/*
;956:================
;957:SelectRandomDeathmatchSpawnPoint
;958:
;959:go to a random point that doesn't telefrag
;960:================
;961:*/
;962:#define	MAX_TEAM_SPAWN_POINTS	32
;963:gentity_t *SelectRandomTeamSpawnPoint( int teamstate, team_t team ) {
line 970
;964:	gentity_t	*spot;
;965:	int			count;
;966:	int			selection;
;967:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;968:	char		*classname;
;969:
;970:	if (teamstate == TEAM_BEGIN) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $441
line 971
;971:		if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $443
line 972
;972:			classname = "team_CTF_redplayer";
ADDRLP4 8
ADDRGP4 $445
ASGNP4
ADDRGP4 $442
JUMPV
LABELV $443
line 973
;973:		else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $446
line 974
;974:			classname = "team_CTF_blueplayer";
ADDRLP4 8
ADDRGP4 $448
ASGNP4
ADDRGP4 $442
JUMPV
LABELV $446
line 976
;975:		else
;976:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $440
JUMPV
line 977
;977:	} else {
LABELV $441
line 978
;978:		if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $449
line 979
;979:			classname = "team_CTF_redspawn";
ADDRLP4 8
ADDRGP4 $451
ASGNP4
ADDRGP4 $450
JUMPV
LABELV $449
line 980
;980:		else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $452
line 981
;981:			classname = "team_CTF_bluespawn";
ADDRLP4 8
ADDRGP4 $454
ASGNP4
ADDRGP4 $453
JUMPV
LABELV $452
line 983
;982:		else
;983:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $440
JUMPV
LABELV $453
LABELV $450
line 984
;984:	}
LABELV $442
line 985
;985:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 987
;986:
;987:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $456
JUMPV
LABELV $455
line 989
;988:
;989:	while ((spot = G_Find (spot, FOFS(classname), classname)) != NULL) {
line 990
;990:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $458
line 991
;991:			continue;
ADDRGP4 $456
JUMPV
LABELV $458
line 993
;992:		}
;993:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 994
;994:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $460
line 995
;995:			break;
ADDRGP4 $457
JUMPV
LABELV $460
line 996
;996:	}
LABELV $456
line 989
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $455
LABELV $457
line 998
;997:
;998:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $462
line 999
;999:		return G_Find( NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
RETP4
ADDRGP4 $440
JUMPV
LABELV $462
line 1002
;1000:	}
;1001:
;1002:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 1003
;1003:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $440
endproc SelectRandomTeamSpawnPoint 152 12
export SelectCTFSpawnPoint
proc SelectCTFSpawnPoint 12 12
line 1013
;1004:}
;1005:
;1006:
;1007:/*
;1008:===========
;1009:SelectCTFSpawnPoint
;1010:
;1011:============
;1012:*/
;1013:gentity_t *SelectCTFSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 1016
;1014:	gentity_t	*spot;
;1015:
;1016:	spot = SelectRandomTeamSpawnPoint ( teamstate, team );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1018
;1017:
;1018:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $465
line 1019
;1019:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $464
JUMPV
LABELV $465
line 1022
;1020:	}
;1021:
;1022:	VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1023
;1023:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 1024
;1024:	VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1026
;1025:
;1026:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $464
endproc SelectCTFSpawnPoint 12 12
proc SortClients 0 0
line 1031
;1027:}
;1028:
;1029:/*---------------------------------------------------------------------------*/
;1030:
;1031:static int QDECL SortClients( const void *a, const void *b ) {
line 1032
;1032:	return *(int *)a - *(int *)b;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
SUBI4
RETI4
LABELV $467
endproc SortClients 0 0
export TeamplayInfoMessage
proc TeamplayInfoMessage 9404 36
line 1045
;1033:}
;1034:
;1035:
;1036:/*
;1037:==================
;1038:TeamplayLocationsMessage
;1039:
;1040:Format:
;1041:	clientNum location health armor weapon powerups
;1042:
;1043:==================
;1044:*/
;1045:void TeamplayInfoMessage( gentity_t *ent ) {
line 1055
;1046:	char		entry[1024];
;1047:	char		string[8192];
;1048:	int			stringlength;
;1049:	int			i, j;
;1050:	gentity_t	*player;
;1051:	int			cnt;
;1052:	int			h, a;
;1053:	int			clients[TEAM_MAXOVERLAY];
;1054:
;1055:	if ( ! ent->client->pers.teamInfo )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $469
line 1056
;1056:		return;
ADDRGP4 $468
JUMPV
LABELV $469
line 1061
;1057:
;1058:	// figure out what client should be on the display
;1059:	// we are limited to 8, but we want to use the top eight players
;1060:	// but in client order (so they don't keep changing position on the overlay)
;1061:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9372
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $471
line 1062
;1062:		player = g_entities + level.sortedClients[i];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1063
;1063:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $477
ADDRLP4 9380
CNSTI4 516
ASGNI4
ADDRLP4 9384
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
NEI4 $477
line 1064
;1064:			ent->client->sess.sessionTeam ) {
line 1065
;1065:			clients[cnt++] = level.sortedClients[i];
ADDRLP4 9388
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9388
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9392
CNSTI4 2
ASGNI4
ADDRLP4 9388
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRLP4 9244
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ASGNI4
line 1066
;1066:		}
LABELV $477
line 1067
;1067:	}
LABELV $472
line 1061
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $474
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $480
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $471
LABELV $480
line 1070
;1068:
;1069:	// We have the top eight players, sort them by clientNum
;1070:	qsort( clients, cnt, sizeof( clients[0] ), SortClients );
ADDRLP4 9244
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortClients
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1073
;1071:
;1072:	// send the latest information on all clients
;1073:	string[0] = 0;
ADDRLP4 1052
CNSTI1 0
ASGNI1
line 1074
;1074:	stringlength = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 1076
;1075:
;1076:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9376
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRGP4 $484
JUMPV
LABELV $481
line 1077
;1077:		player = g_entities + i;
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1078
;1078:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
ADDRLP4 9384
CNSTI4 516
ASGNI4
ADDRLP4 9388
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
NEI4 $486
line 1079
;1079:			ent->client->sess.sessionTeam ) {
line 1081
;1080:
;1081:			h = player->client->ps.stats[STAT_HEALTH];
ADDRLP4 1036
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1082
;1082:			a = player->client->ps.stats[STAT_ARMOR];
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1083
;1083:			if (h < 0) h = 0;
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $488
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $488
line 1084
;1084:			if (a < 0) a = 0;
ADDRLP4 1040
INDIRI4
CNSTI4 0
GEI4 $490
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $490
line 1086
;1085:
;1086:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $492
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 9396
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9396
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 9396
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1091
;1087:				" %i %i %i %i %i %i", 
;1088://				level.sortedClients[i], player->client->pers.teamState.location, h, a, 
;1089:				i, player->client->pers.teamState.location, h, a, 
;1090:				player->client->ps.weapon, player->s.powerups);
;1091:			j = strlen(entry);
ADDRLP4 12
ARGP4
ADDRLP4 9400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 9400
INDIRI4
ASGNI4
line 1092
;1092:			if (stringlength + j > sizeof(string))
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
CVIU4 4
CNSTU4 8192
LEU4 $493
line 1093
;1093:				break;
ADDRGP4 $483
JUMPV
LABELV $493
line 1094
;1094:			strcpy (string + stringlength, entry);
ADDRLP4 1044
INDIRI4
ADDRLP4 1052
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1095
;1095:			stringlength += j;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
ASGNI4
line 1096
;1096:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1097
;1097:		}
LABELV $486
line 1098
;1098:	}
LABELV $482
line 1076
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $484
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $495
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $481
LABELV $495
LABELV $483
line 1100
;1099:
;1100:	trap_SendServerCommand( ent-g_entities, va("tinfo %i %s", cnt, string) );
ADDRGP4 $496
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 9380
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ARGI4
ADDRLP4 9380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1101
;1101:}
LABELV $468
endproc TeamplayInfoMessage 9404 36
export CheckTeamStatus
proc CheckTeamStatus 24 4
line 1103
;1102:
;1103:void CheckTeamStatus(void) {
line 1107
;1104:	int i;
;1105:	gentity_t *loc, *ent;
;1106:
;1107:	if (level.time - level.lastTeamLocationTime > TEAM_LOCATION_UPDATE_TIME) {
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+64
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $498
line 1109
;1108:
;1109:		level.lastTeamLocationTime = level.time;
ADDRGP4 level+64
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1111
;1110:
;1111:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $507
JUMPV
LABELV $504
line 1112
;1112:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1114
;1113:
;1114:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $509
line 1115
;1115:				continue;
ADDRGP4 $505
JUMPV
LABELV $509
line 1118
;1116:			}
;1117:
;1118:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $511
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $513
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $511
LABELV $513
line 1119
;1119:				loc = Team_GetLocation( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1120
;1120:				if (loc)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $514
line 1121
;1121:					ent->client->pers.teamState.location = loc->health;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $515
JUMPV
LABELV $514
line 1123
;1122:				else
;1123:					ent->client->pers.teamState.location = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
LABELV $515
line 1124
;1124:			}
LABELV $511
line 1125
;1125:		}
LABELV $505
line 1111
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $507
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $504
line 1127
;1126:
;1127:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $519
JUMPV
LABELV $516
line 1128
;1128:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1130
;1129:
;1130:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $521
line 1131
;1131:				continue;
ADDRGP4 $517
JUMPV
LABELV $521
line 1134
;1132:			}
;1133:
;1134:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $523
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $525
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $523
LABELV $525
line 1135
;1135:				TeamplayInfoMessage( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 TeamplayInfoMessage
CALLV
pop
line 1136
;1136:			}
LABELV $523
line 1137
;1137:		}
LABELV $517
line 1127
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $519
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $516
line 1138
;1138:	}
LABELV $498
line 1139
;1139:}
LABELV $497
endproc CheckTeamStatus 24 4
export SP_team_CTF_redplayer
proc SP_team_CTF_redplayer 0 0
line 1146
;1140:
;1141:/*-----------------------------------------------------------------*/
;1142:
;1143:/*QUAKED team_CTF_redplayer (1 0 0) (-16 -16 -16) (16 16 32)
;1144:Only in CTF games.  Red players spawn here at game start.
;1145:*/
;1146:void SP_team_CTF_redplayer( gentity_t *ent ) {
line 1147
;1147:}
LABELV $526
endproc SP_team_CTF_redplayer 0 0
export SP_team_CTF_blueplayer
proc SP_team_CTF_blueplayer 0 0
line 1153
;1148:
;1149:
;1150:/*QUAKED team_CTF_blueplayer (0 0 1) (-16 -16 -16) (16 16 32)
;1151:Only in CTF games.  Blue players spawn here at game start.
;1152:*/
;1153:void SP_team_CTF_blueplayer( gentity_t *ent ) {
line 1154
;1154:}
LABELV $527
endproc SP_team_CTF_blueplayer 0 0
export SP_team_CTF_redspawn
proc SP_team_CTF_redspawn 0 0
line 1161
;1155:
;1156:
;1157:/*QUAKED team_CTF_redspawn (1 0 0) (-16 -16 -24) (16 16 32)
;1158:potential spawning position for red team in CTF games.
;1159:Targets will be fired when someone spawns in on them.
;1160:*/
;1161:void SP_team_CTF_redspawn(gentity_t *ent) {
line 1162
;1162:}
LABELV $528
endproc SP_team_CTF_redspawn 0 0
export SP_team_CTF_bluespawn
proc SP_team_CTF_bluespawn 0 0
line 1168
;1163:
;1164:/*QUAKED team_CTF_bluespawn (0 0 1) (-16 -16 -24) (16 16 32)
;1165:potential spawning position for blue team in CTF games.
;1166:Targets will be fired when someone spawns in on them.
;1167:*/
;1168:void SP_team_CTF_bluespawn(gentity_t *ent) {
line 1169
;1169:}
LABELV $529
endproc SP_team_CTF_bluespawn 0 0
bss
export neutralObelisk
align 4
LABELV neutralObelisk
skip 4
export teamgame
align 4
LABELV teamgame
skip 36
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import CheckObeliskAttack
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import bash_die
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $496
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $492
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $454
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $451
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $448
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $445
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $439
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $438
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $412
byte 1 68
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $403
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $377
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $373
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $353
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $352
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $346
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $318
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $312
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 82
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $299
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $246
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $244
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $224
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $102
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $97
byte 1 80
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 77
byte 1 115
byte 1 103
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $92
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $91
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $88
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $85
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $74
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 0
align 1
LABELV $73
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $70
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 0
align 1
LABELV $67
byte 1 82
byte 1 69
byte 1 68
byte 1 0
