export G_TestEntityPosition
code
proc G_TestEntityPosition 68 28
file "../g_mover.c"
line 33
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:
;7:
;8:/*
;9:===============================================================================
;10:
;11:PUSHMOVE
;12:
;13:===============================================================================
;14:*/
;15:
;16:void MatchTeam( gentity_t *teamLeader, int moverState, int time );
;17:
;18:typedef struct {
;19:	gentity_t	*ent;
;20:	vec3_t	origin;
;21:	vec3_t	angles;
;22:	float	deltayaw;
;23:} pushed_t;
;24:pushed_t	pushed[MAX_GENTITIES], *pushed_p;
;25:
;26:
;27:/*
;28:============
;29:G_TestEntityPosition
;30:
;31:============
;32:*/
;33:gentity_t	*G_TestEntityPosition( gentity_t *ent ) {
line 37
;34:	trace_t	tr;
;35:	int		mask;
;36:
;37:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $54
line 38
;38:		mask = ent->clipmask;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 39
;39:	} else {
ADDRGP4 $55
JUMPV
LABELV $54
line 40
;40:		mask = MASK_SOLID;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 41
;41:	}
LABELV $55
line 42
;42:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $56
line 43
;43:		trap_Trace( &tr, ent->client->ps.origin, ent->r.mins, ent->r.maxs, ent->client->ps.origin, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 44
;44:	} else {
ADDRGP4 $57
JUMPV
LABELV $56
line 45
;45:		trap_Trace( &tr, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, ent->s.pos.trBase, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 46
;46:	}
LABELV $57
line 48
;47:	
;48:	if (tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $58
line 49
;49:		return &g_entities[ tr.entityNum ];
CNSTI4 808
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $53
JUMPV
LABELV $58
line 51
;50:		
;51:	return NULL;
CNSTP4 0
RETP4
LABELV $53
endproc G_TestEntityPosition 68 28
export G_CreateRotationMatrix
proc G_CreateRotationMatrix 4 16
line 59
;52:}
;53:
;54:/*
;55:================
;56:G_CreateRotationMatrix
;57:================
;58:*/
;59:void G_CreateRotationMatrix(vec3_t angles, vec3_t matrix[3]) {
line 60
;60:	AngleVectors(angles, matrix[0], matrix[1], matrix[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 61
;61:	VectorInverse(matrix[1]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 62
;62:}
LABELV $62
endproc G_CreateRotationMatrix 4 16
export G_TransposeMatrix
proc G_TransposeMatrix 24 0
line 69
;63:
;64:/*
;65:================
;66:G_TransposeMatrix
;67:================
;68:*/
;69:void G_TransposeMatrix(vec3_t matrix[3], vec3_t transpose[3]) {
line 71
;70:	int i, j;
;71:	for (i = 0; i < 3; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $64
line 72
;72:		for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $68
line 73
;73:			transpose[i][j] = matrix[j][i];
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 16
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
INDIRF4
ASGNF4
line 74
;74:		}
LABELV $69
line 72
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $68
line 75
;75:	}
LABELV $65
line 71
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $64
line 76
;76:}
LABELV $63
endproc G_TransposeMatrix 24 0
export G_RotatePoint
proc G_RotatePoint 24 0
line 83
;77:
;78:/*
;79:================
;80:G_RotatePoint
;81:================
;82:*/
;83:void G_RotatePoint(vec3_t point, vec3_t matrix[3]) {
line 86
;84:	vec3_t tvec;
;85:
;86:	VectorCopy(point, tvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 87
;87:	point[0] = DotProduct(matrix[0], tvec);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 88
;88:	point[1] = DotProduct(matrix[1], tvec);
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 89
;89:	point[2] = DotProduct(matrix[2], tvec);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 90
;90:}
LABELV $72
endproc G_RotatePoint 24 0
export G_TryPushingEntity
proc G_TryPushingEntity 172 8
line 99
;91:
;92:/*
;93:==================
;94:G_TryPushingEntity
;95:
;96:Returns qfalse if the move is blocked
;97:==================
;98:*/
;99:qboolean	G_TryPushingEntity( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 106
;100:	vec3_t		matrix[3], transpose[3];
;101:	vec3_t		org, org2, move2;
;102:	gentity_t	*block;
;103:
;104:	// EF_MOVER_STOP will just stop when contacting another entity
;105:	// instead of pushing it, but entities can still ride on top of it
;106:	if ( ( pusher->s.eFlags & EF_MOVER_STOP ) && 
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $80
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 112
INDIRP4
INDIRI4
EQI4 $80
line 107
;107:		check->s.groundEntityNum != pusher->s.number ) {
line 108
;108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $80
line 112
;109:	}
;110:
;111:	// save off the old position
;112:	if (pushed_p > &pushed[MAX_GENTITIES]) {
ADDRGP4 pushed_p
INDIRP4
CVPU4 4
ADDRGP4 pushed+32768
CVPU4 4
LEU4 $82
line 113
;113:		G_Error( "pushed_p > &pushed[MAX_GENTITIES]" );
ADDRGP4 $85
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 114
;114:	}
LABELV $82
line 115
;115:	pushed_p->ent = check;
ADDRGP4 pushed_p
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 116
;116:	VectorCopy (check->s.pos.trBase, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 117
;117:	VectorCopy (check->s.apos.trBase, pushed_p->angles);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 118
;118:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $86
line 119
;119:		pushed_p->deltayaw = check->client->ps.delta_angles[YAW];
ADDRGP4 pushed_p
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 120
;120:		VectorCopy (check->client->ps.origin, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 121
;121:	}
LABELV $86
line 122
;122:	pushed_p++;
ADDRLP4 116
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 126
;123:
;124:	// try moving the contacted entity 
;125:	// figure movement due to the pusher's amove
;126:	G_CreateRotationMatrix( amove, transpose );
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_CreateRotationMatrix
CALLV
pop
line 127
;127:	G_TransposeMatrix( transpose, matrix );
ADDRLP4 76
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_TransposeMatrix
CALLV
pop
line 128
;128:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $88
line 129
;129:		VectorSubtract (check->client->ps.origin, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 130
;130:	}
ADDRGP4 $89
JUMPV
LABELV $88
line 131
;131:	else {
line 132
;132:		VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 133
;133:	}
LABELV $89
line 134
;134:	VectorCopy( org, org2 );
ADDRLP4 24
ADDRLP4 12
INDIRB
ASGNB 12
line 135
;135:	G_RotatePoint( org2, matrix );
ADDRLP4 24
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_RotatePoint
CALLV
pop
line 136
;136:	VectorSubtract (org2, org, move2);
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 138
;137:	// add movement
;138:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 139
;139:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 140
;140:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $102
line 141
;141:		VectorAdd (check->client->ps.origin, move, check->client->ps.origin);
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 142
;142:		VectorAdd (check->client->ps.origin, move2, check->client->ps.origin);
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 144
;143:		// make sure the client's view rotates when on a rotating mover
;144:		check->client->ps.delta_angles[YAW] += ANGLE2SHORT(amove[YAW]);
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 145
;145:	}
LABELV $102
line 148
;146:
;147:	// may have pushed them off an edge
;148:	if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $106
line 149
;149:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 -1
ASGNI4
line 150
;150:	}
LABELV $106
line 152
;151:
;152:	block = G_TestEntityPosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 144
INDIRP4
ASGNP4
line 153
;153:	if (!block) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $108
line 155
;154:		// pushed ok
;155:		if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $110
line 156
;156:			VectorCopy( check->client->ps.origin, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 157
;157:		} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 158
;158:			VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 159
;159:		}
LABELV $111
line 160
;160:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 161
;161:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
LABELV $108
line 167
;162:	}
;163:
;164:	// if it is ok to leave in the old position, do it
;165:	// this is only relevent for riding entities, not pushed
;166:	// Sliding trapdoors can cause this.
;167:	VectorCopy( (pushed_p-1)->origin, check->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 168
;168:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $112
line 169
;169:		VectorCopy( (pushed_p-1)->origin, check->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 170
;170:	}
LABELV $112
line 171
;171:	VectorCopy( (pushed_p-1)->angles, check->s.apos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -16
ADDP4
INDIRB
ASGNB 12
line 172
;172:	block = G_TestEntityPosition (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 148
INDIRP4
ASGNP4
line 173
;173:	if ( !block ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 174
;174:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 -1
ASGNI4
line 175
;175:		pushed_p--;
ADDRLP4 152
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
line 176
;176:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
LABELV $114
line 180
;177:	}
;178:
;179:	// blocked
;180:	return qfalse;
CNSTI4 0
RETI4
LABELV $79
endproc G_TryPushingEntity 172 8
export G_CheckProxMinePosition
proc G_CheckProxMinePosition 108 28
line 188
;181:}
;182:
;183:/*
;184:==================
;185:G_CheckProxMinePosition
;186:==================
;187:*/
;188:qboolean G_CheckProxMinePosition( gentity_t *check ) {
line 192
;189:	vec3_t		start, end;
;190:	trace_t	tr;
;191:
;192:	VectorMA(check->s.pos.trBase, 0.125, check->movedir, start);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTF4 1040187392
ASGNF4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 88
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1040187392
ADDRLP4 88
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 193
;193:	VectorMA(check->s.pos.trBase, 2, check->movedir, end);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
CNSTF4 1073741824
ASGNF4
ADDRLP4 12
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 92
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 100
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 194
;194:	trap_Trace( &tr, start, NULL, NULL, end, check->s.number, MASK_SOLID );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 104
CNSTP4 0
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 196
;195:	
;196:	if (tr.startsolid || tr.fraction < 1)
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $125
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $121
LABELV $125
line 197
;197:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $116
JUMPV
LABELV $121
line 199
;198:
;199:	return qtrue;
CNSTI4 1
RETI4
LABELV $116
endproc G_CheckProxMinePosition 108 28
export G_TryPushingProxMine
proc G_TryPushingProxMine 120 16
line 207
;200:}
;201:
;202:/*
;203:==================
;204:G_TryPushingProxMine
;205:==================
;206:*/
;207:qboolean G_TryPushingProxMine( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 213
;208:	vec3_t		forward, right, up;
;209:	vec3_t		org, org2, move2;
;210:	int ret;
;211:
;212:	// we need this for pushing things later
;213:	VectorSubtract (vec3_origin, amove, org);
ADDRLP4 76
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 76
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 214
;214:	AngleVectors (org, forward, right, up);
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 217
;215:
;216:	// try moving the contacted entity 
;217:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 220
;218:
;219:	// figure movement due to the pusher's amove
;220:	VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 221
;221:	org2[0] = DotProduct (org, forward);
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 222
;222:	org2[1] = -DotProduct (org, right);
ADDRLP4 12+4
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
NEGF4
ASGNF4
line 223
;223:	org2[2] = DotProduct (org, up);
ADDRLP4 12+8
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 60+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 224
;224:	VectorSubtract (org2, org, move2);
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 225
;225:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 227
;226:
;227:	ret = G_CheckProxMinePosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 G_CheckProxMinePosition
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 112
INDIRI4
ASGNI4
line 228
;228:	if (ret) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $155
line 229
;229:		VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 116
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 230
;230:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 231
;231:	}
LABELV $155
line 232
;232:	return ret;
ADDRLP4 72
INDIRI4
RETI4
LABELV $126
endproc G_TryPushingProxMine 120 16
export G_MoverPush
proc G_MoverPush 4240 32
line 246
;233:}
;234:
;235:void G_ExplodeMissile( gentity_t *ent );
;236:
;237:/*
;238:============
;239:G_MoverPush
;240:
;241:Objects need to be moved back on a failed push,
;242:otherwise riders would continue to slide.
;243:If qfalse is returned, *obstacle will be the blocking entity
;244:============
;245:*/
;246:qboolean G_MoverPush( gentity_t *pusher, vec3_t move, vec3_t amove, gentity_t **obstacle ) {
line 255
;247:	int			i, e;
;248:	gentity_t	*check;
;249:	vec3_t		mins, maxs;
;250:	pushed_t	*p;
;251:	int			entityList[MAX_GENTITIES];
;252:	int			listedEntities;
;253:	vec3_t		totalMins, totalMaxs;
;254:
;255:	*obstacle = NULL;
ADDRFP4 12
INDIRP4
CNSTP4 0
ASGNP4
line 260
;256:
;257:
;258:	// mins/maxs are the bounds at the destination
;259:	// totalMins / totalMaxs are the bounds for the entire move
;260:	if ( pusher->r.currentAngles[0] || pusher->r.currentAngles[1] || pusher->r.currentAngles[2]
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
CNSTF4 0
ASGNF4
ADDRLP4 4164
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4164
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4164
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4172
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4172
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4172
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
EQF4 $158
LABELV $164
line 261
;261:		|| amove[0] || amove[1] || amove[2] ) {
line 264
;262:		float		radius;
;263:
;264:		radius = RadiusFromBounds( pusher->r.mins, pusher->r.maxs );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 4180
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 4184
ADDRGP4 RadiusFromBounds
CALLF4
ASGNF4
ADDRLP4 4176
ADDRLP4 4184
INDIRF4
ASGNF4
line 265
;265:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $165
line 266
;266:			mins[i] = pusher->r.currentOrigin[i] + move[i] - radius;
ADDRLP4 4188
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4188
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4188
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDP4
INDIRF4
ADDRLP4 4188
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
SUBF4
ASGNF4
line 267
;267:			maxs[i] = pusher->r.currentOrigin[i] + move[i] + radius;
ADDRLP4 4192
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4192
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4192
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDP4
INDIRF4
ADDRLP4 4192
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
ADDF4
ASGNF4
line 268
;268:			totalMins[i] = mins[i] - move[i];
ADDRLP4 4196
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4196
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 4196
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 4196
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 269
;269:			totalMaxs[i] = maxs[i] - move[i];
ADDRLP4 4200
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4200
INDIRI4
ADDRLP4 4152
ADDP4
ADDRLP4 4200
INDIRI4
ADDRLP4 28
ADDP4
INDIRF4
ADDRLP4 4200
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 270
;270:		}
LABELV $166
line 265
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $165
line 271
;271:	} else {
ADDRGP4 $159
JUMPV
LABELV $158
line 272
;272:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $169
line 273
;273:			mins[i] = pusher->r.absmin[i] + move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 274
;274:			maxs[i] = pusher->r.absmax[i] + move[i];
ADDRLP4 4180
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 275
;275:		}
LABELV $170
line 272
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $169
line 277
;276:
;277:		VectorCopy( pusher->r.absmin, totalMins );
ADDRLP4 4140
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 278
;278:		VectorCopy( pusher->r.absmax, totalMaxs );
ADDRLP4 4152
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 279
;279:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $173
line 280
;280:			if ( move[i] > 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $177
line 281
;281:				totalMaxs[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4152
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 282
;282:			} else {
ADDRGP4 $178
JUMPV
LABELV $177
line 283
;283:				totalMins[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4140
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 284
;284:			}
LABELV $178
line 285
;285:		}
LABELV $174
line 279
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $173
line 286
;286:	}
LABELV $159
line 289
;287:
;288:	// unlink the pusher so we don't get it in the entityList
;289:	trap_UnlinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 291
;290:
;291:	listedEntities = trap_EntitiesInBox( totalMins, totalMaxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4176
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4176
INDIRI4
ASGNI4
line 294
;292:
;293:	// move the pusher to it's final position
;294:	VectorAdd( pusher->r.currentOrigin, move, pusher->r.currentOrigin );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4184
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 295
;295:	VectorAdd( pusher->r.currentAngles, amove, pusher->r.currentAngles );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ASGNP4
ADDRLP4 4192
INDIRP4
ADDRLP4 4192
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4196
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ASGNP4
ADDRLP4 4196
INDIRP4
ADDRLP4 4196
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4200
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ASGNP4
ADDRLP4 4200
INDIRP4
ADDRLP4 4200
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 296
;296:	trap_LinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 299
;297:
;298:	// see if any solid entities are inside the final position
;299:	for ( e = 0 ; e < listedEntities ; e++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $182
JUMPV
LABELV $179
line 300
;300:		check = &g_entities[ entityList[ e ] ];
ADDRLP4 8
CNSTI4 808
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 339
;301:
;302:#ifdef MISSIONPACK
;303:		if ( check->s.eType == ET_MISSILE ) {
;304:			// if it is a prox mine
;305:			if ( !strcmp(check->classname, "prox mine") ) {
;306:				// if this prox mine is attached to this mover try to move it with the pusher
;307:				if ( check->enemy == pusher ) {
;308:					if (!G_TryPushingProxMine( check, pusher, move, amove )) {
;309:						//explode
;310:						check->s.loopSound = 0;
;311:						G_AddEvent( check, EV_PROXIMITY_MINE_TRIGGER, 0 );
;312:						G_ExplodeMissile(check);
;313:						if (check->activator) {
;314:							G_FreeEntity(check->activator);
;315:							check->activator = NULL;
;316:						}
;317:						//G_Printf("prox mine explodes\n");
;318:					}
;319:				}
;320:				else {
;321:					//check if the prox mine is crushed by the mover
;322:					if (!G_CheckProxMinePosition( check )) {
;323:						//explode
;324:						check->s.loopSound = 0;
;325:						G_AddEvent( check, EV_PROXIMITY_MINE_TRIGGER, 0 );
;326:						G_ExplodeMissile(check);
;327:						if (check->activator) {
;328:							G_FreeEntity(check->activator);
;329:							check->activator = NULL;
;330:						}
;331:						//G_Printf("prox mine explodes\n");
;332:					}
;333:				}
;334:				continue;
;335:			}
;336:		}
;337:#endif
;338:		// only push items and players
;339:		if ( check->s.eType != ET_ITEM && check->s.eType != ET_PLAYER && !check->physicsObject ) {
ADDRLP4 4208
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4208
INDIRI4
CNSTI4 2
EQI4 $183
ADDRLP4 4208
INDIRI4
CNSTI4 1
EQI4 $183
ADDRLP4 8
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
NEI4 $183
line 340
;340:			continue;
ADDRGP4 $180
JUMPV
LABELV $183
line 344
;341:		}
;342:
;343:		// if the entity is standing on the pusher, it will definitely be moved
;344:		if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $185
line 346
;345:			// see if the ent needs to be tested
;346:			if ( check->r.absmin[0] >= maxs[0]
ADDRLP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
GEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
GEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
LEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
GTF4 $187
LABELV $197
line 351
;347:			|| check->r.absmin[1] >= maxs[1]
;348:			|| check->r.absmin[2] >= maxs[2]
;349:			|| check->r.absmax[0] <= mins[0]
;350:			|| check->r.absmax[1] <= mins[1]
;351:			|| check->r.absmax[2] <= mins[2] ) {
line 352
;352:				continue;
ADDRGP4 $180
JUMPV
LABELV $187
line 356
;353:			}
;354:			// see if the ent's bbox is inside the pusher's final position
;355:			// this does allow a fast moving object to pass through a thin entity...
;356:			if (!G_TestEntityPosition (check)) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4216
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 4216
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $198
line 357
;357:				continue;
ADDRGP4 $180
JUMPV
LABELV $198
line 359
;358:			}
;359:		}
LABELV $185
line 362
;360:
;361:		// the entity needs to be pushed
;362:		if ( G_TryPushingEntity( check, pusher, move, amove ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4212
ADDRGP4 G_TryPushingEntity
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
EQI4 $200
line 363
;363:			continue;
ADDRGP4 $180
JUMPV
LABELV $200
line 369
;364:		}
;365:
;366:		// the move was blocked an entity
;367:
;368:		// bobbing entities are instant-kill and never get blocked
;369:		if ( pusher->s.pos.trType == TR_SINE || pusher->s.apos.trType == TR_SINE ) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
CNSTI4 4
ASGNI4
ADDRLP4 4216
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4220
INDIRI4
EQI4 $204
ADDRLP4 4216
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4220
INDIRI4
NEI4 $202
LABELV $204
line 370
;370:			G_Damage( check, pusher, pusher, NULL, NULL, 99999, 0, MOD_CRUSH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4228
CNSTP4 0
ASGNP4
ADDRLP4 4228
INDIRP4
ARGP4
ADDRLP4 4228
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 371
;371:			continue;
ADDRGP4 $180
JUMPV
LABELV $202
line 376
;372:		}
;373:
;374:		
;375:		// save off the obstacle so we can call the block function (crush, etc)
;376:		*obstacle = check;
ADDRFP4 12
INDIRP4
ADDRLP4 8
INDIRP4
ASGNP4
line 381
;377:
;378:		// move back any entities we already moved
;379:		// go backwards, so if the same entity was pushed
;380:		// twice, it goes back to the original position
;381:		for ( p=pushed_p-1 ; p>=pushed ; p-- ) {
ADDRLP4 0
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
ADDRGP4 $208
JUMPV
LABELV $205
line 382
;382:			VectorCopy (p->origin, p->ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 383
;383:			VectorCopy (p->angles, p->ent->s.apos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRB
ASGNB 12
line 384
;384:			if ( p->ent->client ) {
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
line 385
;385:				p->ent->client->ps.delta_angles[YAW] = p->deltayaw;
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 386
;386:				VectorCopy (p->origin, p->ent->client->ps.origin);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 387
;387:			}
LABELV $209
line 388
;388:			trap_LinkEntity (p->ent);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 389
;389:		}
LABELV $206
line 381
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
LABELV $208
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 pushed
CVPU4 4
GEU4 $205
line 390
;390:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $180
line 299
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $182
ADDRLP4 12
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $179
line 393
;391:	}
;392:
;393:	return qtrue;
CNSTI4 1
RETI4
LABELV $157
endproc G_MoverPush 4240 32
export G_MoverTeam
proc G_MoverTeam 72 16
line 402
;394:}
;395:
;396:
;397:/*
;398:=================
;399:G_MoverTeam
;400:=================
;401:*/
;402:void G_MoverTeam( gentity_t *ent ) {
line 407
;403:	vec3_t		move, amove;
;404:	gentity_t	*part, *obstacle;
;405:	vec3_t		origin, angles;
;406:
;407:	obstacle = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 412
;408:
;409:	// make sure all team slaves can move before commiting
;410:	// any moves or calling any think functions
;411:	// if the move is blocked, all moved objects will be backed out
;412:	pushed_p = pushed;
ADDRGP4 pushed_p
ADDRGP4 pushed
ASGNP4
line 413
;413:	for (part = ent ; part ; part=part->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $215
JUMPV
LABELV $212
line 415
;414:		// get current position
;415:		BG_EvaluateTrajectory( &part->s.pos, level.time, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 416
;416:		BG_EvaluateTrajectory( &part->s.apos, level.time, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 417
;417:		VectorSubtract( origin, part->r.currentOrigin, move );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 418
;418:		VectorSubtract( angles, part->r.currentAngles, amove );
ADDRLP4 16
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
SUBF4
ASGNF4
line 419
;419:		if ( !G_MoverPush( part, move, amove, &obstacle ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ADDRGP4 G_MoverPush
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $226
line 420
;420:			break;	// move was blocked
ADDRGP4 $214
JUMPV
LABELV $226
line 422
;421:		}
;422:	}
LABELV $213
line 413
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $215
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $212
LABELV $214
line 424
;423:
;424:	if (part) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
line 426
;425:		// go back to the previous position
;426:		for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $233
JUMPV
LABELV $230
line 427
;427:			part->s.pos.trTime += level.time - level.previousTime;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
ADDI4
ASGNI4
line 428
;428:			part->s.apos.trTime += level.time - level.previousTime;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
ADDI4
ASGNI4
line 429
;429:			BG_EvaluateTrajectory( &part->s.pos, level.time, part->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 430
;430:			BG_EvaluateTrajectory( &part->s.apos, level.time, part->r.currentAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 431
;431:			trap_LinkEntity( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 432
;432:		}
LABELV $231
line 426
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $233
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $230
line 435
;433:
;434:		// if the pusher has a "blocked" function, call it
;435:		if (ent->blocked) {
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
line 436
;436:			ent->blocked( ent, obstacle );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 700
ADDP4
INDIRP4
CALLV
pop
line 437
;437:		}
line 438
;438:		return;
ADDRGP4 $211
JUMPV
LABELV $228
line 442
;439:	}
;440:
;441:	// the move succeeded
;442:	for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $245
JUMPV
LABELV $242
line 444
;443:		// call the reached function if time is at or past end point
;444:		if ( part->s.pos.trType == TR_LINEAR_STOP ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $246
line 445
;445:			if ( level.time >= part->s.pos.trTime + part->s.pos.trDuration ) {
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDI4
LTI4 $248
line 446
;446:				if ( part->reached ) {
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 447
;447:					part->reached( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRP4
CALLV
pop
line 448
;448:				}
LABELV $251
line 449
;449:			}
LABELV $248
line 450
;450:		}
LABELV $246
line 451
;451:	}
LABELV $243
line 442
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $245
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $242
line 452
;452:}
LABELV $211
endproc G_MoverTeam 72 16
export G_RunMover
proc G_RunMover 8 4
line 460
;453:
;454:/*
;455:================
;456:G_RunMover
;457:
;458:================
;459:*/
;460:void G_RunMover( gentity_t *ent ) {
line 463
;461:	// if not a team captain, don't do anything, because
;462:	// the captain will handle everything
;463:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $254
line 464
;464:		return;
ADDRGP4 $253
JUMPV
LABELV $254
line 468
;465:	}
;466:
;467:	// if stationary at one of the positions, don't move anything
;468:	if ( ent->s.pos.trType != TR_STATIONARY || ent->s.apos.trType != TR_STATIONARY ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $258
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $256
LABELV $258
line 469
;469:		G_MoverTeam( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_MoverTeam
CALLV
pop
line 470
;470:	}
LABELV $256
line 473
;471:
;472:	// check think function
;473:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 474
;474:}
LABELV $253
endproc G_RunMover 8 4
export SetMoverState
proc SetMoverState 56 12
line 491
;475:
;476:/*
;477:============================================================================
;478:
;479:GENERAL MOVERS
;480:
;481:Doors, plats, and buttons are all binary (two position) movers
;482:Pos1 is "at rest", pos2 is "activated"
;483:============================================================================
;484:*/
;485:
;486:/*
;487:===============
;488:SetMoverState
;489:===============
;490:*/
;491:void SetMoverState( gentity_t *ent, moverState_t moverState, int time ) {
line 495
;492:	vec3_t			delta;
;493:	float			f;
;494:
;495:	ent->moverState = moverState;
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 497
;496:
;497:	ent->s.pos.trTime = time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 498
;498:	switch( moverState ) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $260
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $260
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $275
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $275
address $263
address $264
address $265
address $270
code
LABELV $263
line 500
;499:	case MOVER_POS1:
;500:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 501
;501:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 502
;502:		break;
ADDRGP4 $261
JUMPV
LABELV $264
line 504
;503:	case MOVER_POS2:
;504:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 505
;505:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 506
;506:		break;
ADDRGP4 $261
JUMPV
LABELV $265
line 508
;507:	case MOVER_1TO2:
;508:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 509
;509:		VectorSubtract( ent->pos2, ent->pos1, delta );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
line 510
;510:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 511
;511:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 512
;512:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 513
;513:		break;
ADDRGP4 $261
JUMPV
LABELV $270
line 515
;514:	case MOVER_2TO1:
;515:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 516
;516:		VectorSubtract( ent->pos1, ent->pos2, delta );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 52
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
SUBF4
ASGNF4
line 517
;517:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 518
;518:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 519
;519:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 520
;520:		break;
LABELV $260
LABELV $261
line 522
;521:	}
;522:	BG_EvaluateTrajectory( &ent->s.pos, level.time, ent->r.currentOrigin );	
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 523
;523:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 524
;524:}
LABELV $259
endproc SetMoverState 56 12
export MatchTeam
proc MatchTeam 4 12
line 534
;525:
;526:/*
;527:================
;528:MatchTeam
;529:
;530:All entities in a mover team will move from pos1 to pos2
;531:in the same amount of time
;532:================
;533:*/
;534:void MatchTeam( gentity_t *teamLeader, int moverState, int time ) {
line 537
;535:	gentity_t		*slave;
;536:
;537:	for ( slave = teamLeader ; slave ; slave = slave->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $281
JUMPV
LABELV $278
line 538
;538:		SetMoverState( slave, moverState, time );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 539
;539:	}
LABELV $279
line 537
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $281
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $278
line 540
;540:}
LABELV $277
endproc MatchTeam 4 12
export ReturnToPos1
proc ReturnToPos1 8 12
line 549
;541:
;542:
;543:
;544:/*
;545:================
;546:ReturnToPos1
;547:================
;548:*/
;549:void ReturnToPos1( gentity_t *ent ) {
line 550
;550:	MatchTeam( ent, MOVER_2TO1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 553
;551:
;552:	// looping sound
;553:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 556
;554:
;555:	// starting sound
;556:	if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $284
line 557
;557:		G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 558
;558:	}
LABELV $284
line 559
;559:}
LABELV $282
endproc ReturnToPos1 8 12
export Reached_BinaryMover
proc Reached_BinaryMover 12 12
line 567
;560:
;561:
;562:/*
;563:================
;564:Reached_BinaryMover
;565:================
;566:*/
;567:void Reached_BinaryMover( gentity_t *ent ) {
line 570
;568:
;569:	// stop the looping sound
;570:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 572
;571:
;572:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 2
NEI4 $287
line 574
;573:		// reached pos2
;574:		SetMoverState( ent, MOVER_POS2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 577
;575:
;576:		// play sound
;577:		if ( ent->soundPos2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
line 578
;578:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos2 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 579
;579:		}
LABELV $290
line 582
;580:
;581:		// return to pos1 after a delay
;582:		ent->think = ReturnToPos1;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 ReturnToPos1
ASGNP4
line 583
;583:		ent->nextthink = level.time + ent->wait;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 586
;584:
;585:		// fire targets
;586:		if ( !ent->activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $293
line 587
;587:			ent->activator = ent;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 588
;588:		}
LABELV $293
line 589
;589:		G_UseTargets( ent, ent->activator );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 590
;590:	} else if ( ent->moverState == MOVER_2TO1 ) {
ADDRGP4 $288
JUMPV
LABELV $287
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 3
NEI4 $295
line 592
;591:		// reached pos1
;592:		SetMoverState( ent, MOVER_POS1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 595
;593:
;594:		// play sound
;595:		if ( ent->soundPos1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $298
line 596
;596:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 597
;597:		}
LABELV $298
line 600
;598:
;599:		// close areaportals
;600:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
ADDRLP4 4
INDIRP4
CVPU4 4
EQU4 $302
ADDRLP4 8
INDIRU4
CNSTU4 0
NEU4 $296
LABELV $302
line 601
;601:			trap_AdjustAreaPortalState( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 602
;602:		}
line 603
;603:	} else {
ADDRGP4 $296
JUMPV
LABELV $295
line 604
;604:		G_Error( "Reached_BinaryMover: bad moverState" );
ADDRGP4 $303
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 605
;605:	}
LABELV $296
LABELV $288
line 606
;606:}
LABELV $286
endproc Reached_BinaryMover 12 12
export Use_BinaryMover
proc Use_BinaryMover 20 12
line 614
;607:
;608:
;609:/*
;610:================
;611:Use_BinaryMover
;612:================
;613:*/
;614:void Use_BinaryMover( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 619
;615:	int		total;
;616:	int		partial;
;617:
;618:	// only the master should be used
;619:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $305
line 620
;620:		Use_BinaryMover( ent->teammaster, other, activator );
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 621
;621:		return;
ADDRGP4 $304
JUMPV
LABELV $305
line 624
;622:	}
;623:
;624:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 626
;625:
;626:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $307
line 629
;627:		// start moving 50 msec later, becase if this was player
;628:		// triggered, level.time hasn't been advanced yet
;629:		MatchTeam( ent, MOVER_1TO2, level.time + 50 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 632
;630:
;631:		// starting sound
;632:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $310
line 633
;633:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 634
;634:		}
LABELV $310
line 637
;635:
;636:		// looping sound
;637:		ent->s.loopSound = ent->soundLoop;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 640
;638:
;639:		// open areaportal
;640:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
ADDRLP4 12
INDIRP4
CVPU4 4
EQU4 $314
ADDRLP4 16
INDIRU4
CNSTU4 0
NEU4 $304
LABELV $314
line 641
;641:			trap_AdjustAreaPortalState( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 642
;642:		}
line 643
;643:		return;
ADDRGP4 $304
JUMPV
LABELV $307
line 647
;644:	}
;645:
;646:	// if all the way up, just delay before coming down
;647:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 1
NEI4 $315
line 648
;648:		ent->nextthink = level.time + ent->wait;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 649
;649:		return;
ADDRGP4 $304
JUMPV
LABELV $315
line 653
;650:	}
;651:
;652:	// only partway down before reversing
;653:	if ( ent->moverState == MOVER_2TO1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 3
NEI4 $318
line 654
;654:		total = ent->s.pos.trDuration;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 655
;655:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 656
;656:		if ( partial > total ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $321
line 657
;657:			partial = total;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 658
;658:		}
LABELV $321
line 660
;659:
;660:		MatchTeam( ent, MOVER_1TO2, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 662
;661:
;662:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
line 663
;663:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 664
;664:		}
line 665
;665:		return;
ADDRGP4 $304
JUMPV
LABELV $318
line 669
;666:	}
;667:
;668:	// only partway up before reversing
;669:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 2
NEI4 $326
line 670
;670:		total = ent->s.pos.trDuration;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 671
;671:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 672
;672:		if ( partial > total ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $329
line 673
;673:			partial = total;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 674
;674:		}
LABELV $329
line 676
;675:
;676:		MatchTeam( ent, MOVER_2TO1, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 678
;677:
;678:		if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
line 679
;679:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 680
;680:		}
line 681
;681:		return;
LABELV $326
line 683
;682:	}
;683:}
LABELV $304
endproc Use_BinaryMover 20 12
export InitMover
proc InitMover 100 12
line 695
;684:
;685:
;686:
;687:/*
;688:================
;689:InitMover
;690:
;691:"pos1", "pos2", and "speed" should be set before calling,
;692:so the movement delta can be calculated
;693:================
;694:*/
;695:void InitMover( gentity_t *ent ) {
line 705
;696:	vec3_t		move;
;697:	float		distance;
;698:	float		light;
;699:	vec3_t		color;
;700:	qboolean	lightSet, colorSet;
;701:	char		*sound;
;702:
;703:	// if the "model2" key is set, use a seperate model
;704:	// for drawing, but clip against the brushes
;705:	if ( ent->model2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $335
line 706
;706:		ent->s.modelindex2 = G_ModelIndex( ent->model2 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 707
;707:	}
LABELV $335
line 710
;708:
;709:	// if the "loopsound" key is set, use a constant looping sound when moving
;710:	if ( G_SpawnString( "noise", "100", &sound ) ) {
ADDRGP4 $339
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 44
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $337
line 711
;711:		ent->s.loopSound = G_SoundIndex( sound );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 712
;712:	}
LABELV $337
line 715
;713:
;714:	// if the "color" or "light" keys are set, setup constantLight
;715:	lightSet = G_SpawnFloat( "light", "100", &light );
ADDRGP4 $341
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 48
INDIRI4
ASGNI4
line 716
;716:	colorSet = G_SpawnVector( "color", "1 1 1", color );
ADDRGP4 $342
ARGP4
ADDRGP4 $343
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
ADDRGP4 G_SpawnVector
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 52
INDIRI4
ASGNI4
line 717
;717:	if ( lightSet || colorSet ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $346
ADDRLP4 32
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $344
LABELV $346
line 720
;718:		int		r, g, b, i;
;719:
;720:		r = color[0] * 255;
ADDRLP4 60
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 721
;721:		if ( r > 255 ) {
ADDRLP4 60
INDIRI4
CNSTI4 255
LEI4 $347
line 722
;722:			r = 255;
ADDRLP4 60
CNSTI4 255
ASGNI4
line 723
;723:		}
LABELV $347
line 724
;724:		g = color[1] * 255;
ADDRLP4 64
CNSTF4 1132396544
ADDRLP4 12+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 725
;725:		if ( g > 255 ) {
ADDRLP4 64
INDIRI4
CNSTI4 255
LEI4 $350
line 726
;726:			g = 255;
ADDRLP4 64
CNSTI4 255
ASGNI4
line 727
;727:		}
LABELV $350
line 728
;728:		b = color[2] * 255;
ADDRLP4 68
CNSTF4 1132396544
ADDRLP4 12+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 729
;729:		if ( b > 255 ) {
ADDRLP4 68
INDIRI4
CNSTI4 255
LEI4 $353
line 730
;730:			b = 255;
ADDRLP4 68
CNSTI4 255
ASGNI4
line 731
;731:		}
LABELV $353
line 732
;732:		i = light / 4;
ADDRLP4 72
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 733
;733:		if ( i > 255 ) {
ADDRLP4 72
INDIRI4
CNSTI4 255
LEI4 $355
line 734
;734:			i = 255;
ADDRLP4 72
CNSTI4 255
ASGNI4
line 735
;735:		}
LABELV $355
line 736
;736:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 68
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 72
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 737
;737:	}
LABELV $344
line 740
;738:
;739:
;740:	ent->use = Use_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_BinaryMover
ASGNP4
line 741
;741:	ent->reached = Reached_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 Reached_BinaryMover
ASGNP4
line 743
;742:
;743:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTI4 0
ASGNI4
line 744
;744:	ent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 745
;745:	ent->s.eType = ET_MOVER;
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 746
;746:	VectorCopy (ent->pos1, ent->r.currentOrigin);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 747
;747:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 749
;748:
;749:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 750
;750:	VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 753
;751:
;752:	// calculate time to reach second position from speed
;753:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 76
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
line 754
;754:	distance = VectorLength( move );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
line 755
;755:	if ( ! ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $359
line 756
;756:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1120403456
ASGNF4
line 757
;757:	}
LABELV $359
line 758
;758:	VectorScale( move, ent->speed, ent->s.pos.trDelta );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
line 759
;759:	ent->s.pos.trDuration = distance * 1000 / ent->speed;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 760
;760:	if ( ent->s.pos.trDuration <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
GTI4 $363
line 761
;761:		ent->s.pos.trDuration = 1;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 762
;762:	}
LABELV $363
line 763
;763:}
LABELV $334
endproc InitMover 100 12
export Blocked_Door
proc Blocked_Door 8 32
line 782
;764:
;765:
;766:/*
;767:===============================================================================
;768:
;769:DOOR
;770:
;771:A use can be triggered either by a touch function, by being shot, or by being
;772:targeted by another entity.
;773:
;774:===============================================================================
;775:*/
;776:
;777:/*
;778:================
;779:Blocked_Door
;780:================
;781:*/
;782:void Blocked_Door( gentity_t *ent, gentity_t *other ) {
line 784
;783:	// remove anything other than a client
;784:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $366
line 786
;785:		// except CTF flags!!!!
;786:		if( other->s.eType == ET_ITEM && other->item->giType == IT_TEAM ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $368
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $368
line 787
;787:			Team_DroppedFlagThink( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Team_DroppedFlagThink
CALLV
pop
line 788
;788:			return;
ADDRGP4 $365
JUMPV
LABELV $368
line 790
;789:		}
;790:		G_TempEntity( other->s.origin, EV_ITEM_POP );
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 41
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 791
;791:		G_FreeEntity( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 792
;792:		return;
ADDRGP4 $365
JUMPV
LABELV $366
line 795
;793:	}
;794:
;795:	if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $370
line 796
;796:		G_Damage( other, ent, ent, NULL, NULL, ent->damage, 0, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 797
;797:	}
LABELV $370
line 798
;798:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $372
line 799
;799:		return;		// crushers don't reverse
ADDRGP4 $365
JUMPV
LABELV $372
line 803
;800:	}
;801:
;802:	// reverse direction
;803:	Use_BinaryMover( ent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 804
;804:}
LABELV $365
endproc Blocked_Door 8 32
proc Touch_DoorTriggerSpectator 72 12
line 811
;805:
;806:/*
;807:================
;808:Touch_DoorTriggerSpectator
;809:================
;810:*/
;811:static void Touch_DoorTriggerSpectator( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 815
;812:	int i, axis;
;813:	vec3_t origin, dir, angles;
;814:
;815:	axis = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 816
;816:	VectorClear(dir);
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 20+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 817
;817:	if (fabs(other->s.origin[axis] - ent->r.absmax[axis]) <
ADDRLP4 48
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $377
line 818
;818:		fabs(other->s.origin[axis] - ent->r.absmin[axis])) {
line 819
;819:		origin[axis] = ent->r.absmin[axis] - 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 820
;820:		dir[axis] = -1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 3212836864
ASGNF4
line 821
;821:	}
ADDRGP4 $378
JUMPV
LABELV $377
line 822
;822:	else {
line 823
;823:		origin[axis] = ent->r.absmax[axis] + 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 824
;824:		dir[axis] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 1065353216
ASGNF4
line 825
;825:	}
LABELV $378
line 826
;826:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $379
line 827
;827:		if (i == axis) continue;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $383
ADDRGP4 $380
JUMPV
LABELV $383
line 828
;828:		origin[i] = (ent->r.absmin[i] + ent->r.absmax[i]) * 0.5;
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
CNSTF4 1056964608
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 829
;829:	}
LABELV $380
line 826
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $379
line 830
;830:	vectoangles(dir, angles);
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 831
;831:	TeleportPlayer(other, origin, angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 832
;832:}
LABELV $374
endproc Touch_DoorTriggerSpectator 72 12
export Touch_DoorTrigger
proc Touch_DoorTrigger 8 12
line 839
;833:
;834:/*
;835:================
;836:Touch_DoorTrigger
;837:================
;838:*/
;839:void Touch_DoorTrigger( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 840
;840:	if ( other->client && other->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $386
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
NEI4 $386
line 842
;841:		// if the door is not open and not opening
;842:		if ( ent->parent->moverState != MOVER_1TO2 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $387
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $387
line 843
;843:			ent->parent->moverState != MOVER_POS2) {
line 844
;844:			Touch_DoorTriggerSpectator( ent, other, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Touch_DoorTriggerSpectator
CALLV
pop
line 845
;845:		}
line 846
;846:	}
ADDRGP4 $387
JUMPV
LABELV $386
line 847
;847:	else if ( ent->parent->moverState != MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 2
EQI4 $390
line 848
;848:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 849
;849:	}
LABELV $390
LABELV $387
line 850
;850:}
LABELV $385
endproc Touch_DoorTrigger 8 12
export Think_SpawnNewDoorTrigger
proc Think_SpawnNewDoorTrigger 52 12
line 861
;851:
;852:
;853:/*
;854:======================
;855:Think_SpawnNewDoorTrigger
;856:
;857:All of the parts of a door have been spawned, so create
;858:a trigger that encloses all of them
;859:======================
;860:*/
;861:void Think_SpawnNewDoorTrigger( gentity_t *ent ) {
line 867
;862:	gentity_t		*other;
;863:	vec3_t		mins, maxs;
;864:	int			i, best;
;865:
;866:	// set all of the slaves as shootable
;867:	for ( other = ent ; other ; other = other->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $396
JUMPV
LABELV $393
line 868
;868:		other->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 869
;869:	}
LABELV $394
line 867
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $396
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $393
line 872
;870:
;871:	// find the bounds of everything on the team
;872:	VectorCopy (ent->r.absmin, mins);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 873
;873:	VectorCopy (ent->r.absmax, maxs);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 875
;874:
;875:	for (other = ent->teamchain ; other ; other=other->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $400
JUMPV
LABELV $397
line 876
;876:		AddPointToBounds (other->r.absmin, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 877
;877:		AddPointToBounds (other->r.absmax, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 878
;878:	}
LABELV $398
line 875
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $400
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $397
line 881
;879:
;880:	// find the thinnest axis, which will be the one we expand
;881:	best = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 882
;882:	for ( i = 1 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $401
line 883
;883:		if ( maxs[i] - mins[i] < maxs[best] - mins[best] ) {
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 40
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 44
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 44
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
GEF4 $405
line 884
;884:			best = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 885
;885:		}
LABELV $405
line 886
;886:	}
LABELV $402
line 882
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $401
line 887
;887:	maxs[best] += 120;
ADDRLP4 36
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 888
;888:	mins[best] -= 120;
ADDRLP4 40
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1123024896
SUBF4
ASGNF4
line 891
;889:
;890:	// create a trigger with this size
;891:	other = G_Spawn ();
ADDRLP4 44
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 892
;892:	other->classname = "door_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $407
ASGNP4
line 893
;893:	VectorCopy (mins, other->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 894
;894:	VectorCopy (maxs, other->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 895
;895:	other->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 896
;896:	other->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 897
;897:	other->touch = Touch_DoorTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_DoorTrigger
ASGNP4
line 899
;898:	// remember the thinnest axis
;899:	other->count = best;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 900
;900:	trap_LinkEntity (other);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 902
;901:
;902:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 903
;903:}
LABELV $392
endproc Think_SpawnNewDoorTrigger 52 12
export Think_MatchTeam
proc Think_MatchTeam 4 12
line 905
;904:
;905:void Think_MatchTeam( gentity_t *ent ) {
line 906
;906:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 907
;907:}
LABELV $409
endproc Think_MatchTeam 4 12
export SP_func_door
proc SP_func_door 112 12
line 926
;908:
;909:
;910:/*QUAKED func_door (0 .5 .8) ? START_OPEN x CRUSHER
;911:TOGGLE		wait in both the start and end states for a trigger event.
;912:START_OPEN	the door to moves to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not useful for touch or takedamage doors).
;913:NOMONSTER	monsters will not trigger this door
;914:
;915:"model2"	.md3 model to also draw
;916:"angle"		determines the opening direction
;917:"targetname" if set, no touch field will be spawned and a remote button or trigger field activates the door.
;918:"speed"		movement speed (100 default)
;919:"wait"		wait before returning (3 default, -1 = never return)
;920:"lip"		lip remaining at end of move (8 default)
;921:"dmg"		damage to inflict when blocked (2 default)
;922:"color"		constantLight color
;923:"light"		constantLight radius
;924:"health"	if set, the door must be shot open
;925:*/
;926:void SP_func_door (gentity_t *ent) {
line 932
;927:	vec3_t	abs_movedir;
;928:	float	distance;
;929:	vec3_t	size;
;930:	float	lip;
;931:
;932:	ent->sound1to2 = ent->sound2to1 = G_SoundIndex("sound/movers/doors/dr1_strt.wav");
ADDRGP4 $412
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 933
;933:	ent->soundPos1 = ent->soundPos2 = G_SoundIndex("sound/movers/doors/dr1_end.wav");
ADDRGP4 $413
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 935
;934:
;935:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 938
;936:
;937:	// default speed of 400
;938:	if (!ent->speed)
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $414
line 939
;939:		ent->speed = 400;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1137180672
ASGNF4
LABELV $414
line 942
;940:
;941:	// default wait of 2 seconds
;942:	if (!ent->wait)
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $416
line 943
;943:		ent->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1073741824
ASGNF4
LABELV $416
line 944
;944:	ent->wait *= 1000;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1148846080
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
line 947
;945:
;946:	// default lip of 8 units
;947:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $418
ARGP4
ADDRGP4 $419
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 950
;948:
;949:	// default damage of 2 points
;950:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 953
;951:
;952:	// first position at start
;953:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 956
;954:
;955:	// calculate second position
;956:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 957
;957:	G_SetMovedir (ent->s.angles, ent->movedir);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 958
;958:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 64
INDIRF4
ASGNF4
line 959
;959:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68
INDIRF4
ASGNF4
line 960
;960:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 72
INDIRF4
ASGNF4
line 961
;961:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 76
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 80
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ASGNF4
line 962
;962:	distance = DotProduct( abs_movedir, size ) - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 963
;963:	VectorMA( ent->pos1, distance, ent->movedir, ent->pos2 );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 966
;964:
;965:	// if "start_open", reverse position 1 and 2
;966:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $430
line 969
;967:		vec3_t	temp;
;968:
;969:		VectorCopy( ent->pos2, temp );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 970
;970:		VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 971
;971:		VectorCopy( temp, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 96
INDIRB
ASGNB 12
line 972
;972:	}
LABELV $430
line 974
;973:
;974:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 976
;975:
;976:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 978
;977:
;978:	if ( ! (ent->flags & FL_TEAMSLAVE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $433
line 981
;979:		int health;
;980:
;981:		G_SpawnInt( "health", "0", &health );
ADDRGP4 $435
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 982
;982:		if ( health ) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $437
line 983
;983:			ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 984
;984:		}
LABELV $437
line 985
;985:		if ( ent->targetname || health ) {
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $441
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $439
LABELV $441
line 987
;986:			// non touch/shoot doors
;987:			ent->think = Think_MatchTeam;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_MatchTeam
ASGNP4
line 988
;988:		} else {
ADDRGP4 $440
JUMPV
LABELV $439
line 989
;989:			ent->think = Think_SpawnNewDoorTrigger;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_SpawnNewDoorTrigger
ASGNP4
line 990
;990:		}
LABELV $440
line 991
;991:	}
LABELV $433
line 994
;992:
;993:
;994:}
LABELV $411
endproc SP_func_door 112 12
export Touch_Plat
proc Touch_Plat 4 0
line 1011
;995:
;996:/*
;997:===============================================================================
;998:
;999:PLAT
;1000:
;1001:===============================================================================
;1002:*/
;1003:
;1004:/*
;1005:==============
;1006:Touch_Plat
;1007:
;1008:Don't allow decent if a living player is on it
;1009:===============
;1010:*/
;1011:void Touch_Plat( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1012
;1012:	if ( !other->client || other->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $443
LABELV $445
line 1013
;1013:		return;
ADDRGP4 $442
JUMPV
LABELV $443
line 1017
;1014:	}
;1015:
;1016:	// delay return-to-pos1 by one second
;1017:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 1
NEI4 $446
line 1018
;1018:		ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1019
;1019:	}
LABELV $446
line 1020
;1020:}
LABELV $442
endproc Touch_Plat 4 0
export Touch_PlatCenterTrigger
proc Touch_PlatCenterTrigger 4 12
line 1029
;1021:
;1022:/*
;1023:==============
;1024:Touch_PlatCenterTrigger
;1025:
;1026:If the plat is at the bottom position, start it going up
;1027:===============
;1028:*/
;1029:void Touch_PlatCenterTrigger(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1030
;1030:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $450
line 1031
;1031:		return;
ADDRGP4 $449
JUMPV
LABELV $450
line 1034
;1032:	}
;1033:
;1034:	if ( ent->parent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $452
line 1035
;1035:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1036
;1036:	}
LABELV $452
line 1037
;1037:}
LABELV $449
endproc Touch_PlatCenterTrigger 4 12
export SpawnPlatTrigger
proc SpawnPlatTrigger 60 4
line 1049
;1038:
;1039:
;1040:/*
;1041:================
;1042:SpawnPlatTrigger
;1043:
;1044:Spawn a trigger in the middle of the plat's low position
;1045:Elevator cars require that the trigger extend through the entire low position,
;1046:not just sit on top of it.
;1047:================
;1048:*/
;1049:void SpawnPlatTrigger( gentity_t *ent ) {
line 1055
;1050:	gentity_t	*trigger;
;1051:	vec3_t	tmin, tmax;
;1052:
;1053:	// the middle trigger will be a thin trigger just
;1054:	// above the starting position
;1055:	trigger = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1056
;1056:	trigger->classname = "plat_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $455
ASGNP4
line 1057
;1057:	trigger->touch = Touch_PlatCenterTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_PlatCenterTrigger
ASGNP4
line 1058
;1058:	trigger->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 1059
;1059:	trigger->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1061
;1060:	
;1061:	tmin[0] = ent->pos1[0] + ent->r.mins[0] + 33;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1062
;1062:	tmin[1] = ent->pos1[1] + ent->r.mins[1] + 33;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1063
;1063:	tmin[2] = ent->pos1[2] + ent->r.mins[2];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1065
;1064:
;1065:	tmax[0] = ent->pos1[0] + ent->r.maxs[0] - 33;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1066
;1066:	tmax[1] = ent->pos1[1] + ent->r.maxs[1] - 33;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+4
ADDRLP4 48
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1067
;1067:	tmax[2] = ent->pos1[2] + ent->r.maxs[2] + 8;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+8
ADDRLP4 52
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1069
;1068:
;1069:	if ( tmax[0] <= tmin[0] ) {
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
GTF4 $460
line 1070
;1070:		tmin[0] = ent->pos1[0] + (ent->r.mins[0] + ent->r.maxs[0]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1071
;1071:		tmax[0] = tmin[0] + 1;
ADDRLP4 16
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1072
;1072:	}
LABELV $460
line 1073
;1073:	if ( tmax[1] <= tmin[1] ) {
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
GTF4 $462
line 1074
;1074:		tmin[1] = ent->pos1[1] + (ent->r.mins[1] + ent->r.maxs[1]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1075
;1075:		tmax[1] = tmin[1] + 1;
ADDRLP4 16+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1076
;1076:	}
LABELV $462
line 1078
;1077:	
;1078:	VectorCopy (tmin, trigger->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1079
;1079:	VectorCopy (tmax, trigger->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1081
;1080:
;1081:	trap_LinkEntity (trigger);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1082
;1082:}
LABELV $454
endproc SpawnPlatTrigger 60 4
export SP_func_plat
proc SP_func_plat 56 12
line 1096
;1083:
;1084:
;1085:/*QUAKED func_plat (0 .5 .8) ?
;1086:Plats are always drawn in the extended position so they will light correctly.
;1087:
;1088:"lip"		default 8, protrusion above rest position
;1089:"height"	total height of movement, defaults to model height
;1090:"speed"		overrides default 200.
;1091:"dmg"		overrides default 2
;1092:"model2"	.md3 model to also draw
;1093:"color"		constantLight color
;1094:"light"		constantLight radius
;1095:*/
;1096:void SP_func_plat (gentity_t *ent) {
line 1099
;1097:	float		lip, height;
;1098:
;1099:	ent->sound1to2 = ent->sound2to1 = G_SoundIndex("sound/movers/plats/pt1_strt.wav");
ADDRGP4 $470
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1100
;1100:	ent->soundPos1 = ent->soundPos2 = G_SoundIndex("sound/movers/plats/pt1_end.wav");
ADDRGP4 $471
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1102
;1101:
;1102:	VectorClear (ent->s.angles);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1104
;1103:
;1104:	G_SpawnFloat( "speed", "200", &ent->speed );
ADDRGP4 $472
ARGP4
ADDRGP4 $473
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1105
;1105:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1106
;1106:	G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $474
ARGP4
ADDRGP4 $475
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1107
;1107:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $418
ARGP4
ADDRGP4 $419
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1109
;1108:
;1109:	ent->wait = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1148846080
ASGNF4
line 1112
;1110:
;1111:	// create second position
;1112:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1114
;1113:
;1114:	if ( !G_SpawnFloat( "height", "0", &height ) ) {
ADDRGP4 $478
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $476
line 1115
;1115:		height = (ent->r.maxs[2] - ent->r.mins[2]) - lip;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 1116
;1116:	}
LABELV $476
line 1119
;1117:
;1118:	// pos1 is the rest (bottom) position, pos2 is the top
;1119:	VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1120
;1120:	VectorCopy( ent->pos2, ent->pos1 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 1121
;1121:	ent->pos1[2] -= height;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 1123
;1122:
;1123:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1127
;1124:
;1125:	// touch function keeps the plat from returning while
;1126:	// a live player is standing on it
;1127:	ent->touch = Touch_Plat;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Plat
ASGNP4
line 1129
;1128:
;1129:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1131
;1130:
;1131:	ent->parent = ent;	// so it can be treated as a door
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 600
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
line 1134
;1132:
;1133:	// spawn the trigger if one hasn't been custom made
;1134:	if ( !ent->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $479
line 1135
;1135:		SpawnPlatTrigger(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpawnPlatTrigger
CALLV
pop
line 1136
;1136:	}
LABELV $479
line 1137
;1137:}
LABELV $469
endproc SP_func_plat 56 12
export Touch_Button
proc Touch_Button 4 12
line 1154
;1138:
;1139:
;1140:/*
;1141:===============================================================================
;1142:
;1143:BUTTON
;1144:
;1145:===============================================================================
;1146:*/
;1147:
;1148:/*
;1149:==============
;1150:Touch_Button
;1151:
;1152:===============
;1153:*/
;1154:void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1155
;1155:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $482
line 1156
;1156:		return;
ADDRGP4 $481
JUMPV
LABELV $482
line 1159
;1157:	}
;1158:
;1159:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $484
line 1160
;1160:		Use_BinaryMover( ent, other, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1161
;1161:	}
LABELV $484
line 1162
;1162:}
LABELV $481
endproc Touch_Button 4 12
export SP_func_button
proc SP_func_button 84 12
line 1178
;1163:
;1164:
;1165:/*QUAKED func_button (0 .5 .8) ?
;1166:When a button is touched, it moves some distance in the direction of it's angle, triggers all of it's targets, waits some time, then returns to it's original position where it can be triggered again.
;1167:
;1168:"model2"	.md3 model to also draw
;1169:"angle"		determines the opening direction
;1170:"target"	all entities with a matching targetname will be used
;1171:"speed"		override the default 40 speed
;1172:"wait"		override the default 1 second wait (-1 = never return)
;1173:"lip"		override the default 4 pixel lip remaining at end of move
;1174:"health"	if set, the button must be killed instead of touched
;1175:"color"		constantLight color
;1176:"light"		constantLight radius
;1177:*/
;1178:void SP_func_button( gentity_t *ent ) {
line 1184
;1179:	vec3_t		abs_movedir;
;1180:	float		distance;
;1181:	vec3_t		size;
;1182:	float		lip;
;1183:
;1184:	ent->sound1to2 = G_SoundIndex("sound/movers/switches/butn2.wav");
ADDRGP4 $487
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1186
;1185:	
;1186:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $488
line 1187
;1187:		ent->speed = 40;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1109393408
ASGNF4
line 1188
;1188:	}
LABELV $488
line 1190
;1189:
;1190:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $490
line 1191
;1191:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1065353216
ASGNF4
line 1192
;1192:	}
LABELV $490
line 1193
;1193:	ent->wait *= 1000;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1148846080
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1196
;1194:
;1195:	// first position
;1196:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1199
;1197:
;1198:	// calculate second position
;1199:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1201
;1200:
;1201:	G_SpawnFloat( "lip", "4", &lip );
ADDRGP4 $418
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1203
;1202:
;1203:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 1204
;1204:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
ASGNF4
line 1205
;1205:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56
INDIRF4
ASGNF4
line 1206
;1206:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 60
INDIRF4
ASGNF4
line 1207
;1207:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 64
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 64
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 68
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1208
;1208:	distance = abs_movedir[0] * size[0] + abs_movedir[1] * size[1] + abs_movedir[2] * size[2] - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 1209
;1209:	VectorMA (ent->pos1, distance, ent->movedir, ent->pos2);
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1211
;1210:
;1211:	if (ent->health) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $501
line 1213
;1212:		// shootable button
;1213:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1214
;1214:	} else {
ADDRGP4 $502
JUMPV
LABELV $501
line 1216
;1215:		// touchable button
;1216:		ent->touch = Touch_Button;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Button
ASGNP4
line 1217
;1217:	}
LABELV $502
line 1219
;1218:
;1219:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1220
;1220:}
LABELV $486
endproc SP_func_button 84 12
export Think_BeginMoving
proc Think_BeginMoving 0 0
line 1244
;1221:
;1222:
;1223:
;1224:/*
;1225:===============================================================================
;1226:
;1227:TRAIN
;1228:
;1229:===============================================================================
;1230:*/
;1231:
;1232:
;1233:#define TRAIN_START_ON		1
;1234:#define TRAIN_TOGGLE		2
;1235:#define TRAIN_BLOCK_STOPS	4
;1236:
;1237:/*
;1238:===============
;1239:Think_BeginMoving
;1240:
;1241:The wait time at a corner has completed, so start moving again
;1242:===============
;1243:*/
;1244:void Think_BeginMoving( gentity_t *ent ) {
line 1245
;1245:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1246
;1246:	ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 1247
;1247:}
LABELV $503
endproc Think_BeginMoving 0 0
export Reached_Train
proc Reached_Train 48 12
line 1254
;1248:
;1249:/*
;1250:===============
;1251:Reached_Train
;1252:===============
;1253:*/
;1254:void Reached_Train( gentity_t *ent ) {
line 1261
;1255:	gentity_t		*next;
;1256:	float			speed;
;1257:	vec3_t			move;
;1258:	float			length;
;1259:
;1260:	// copy the apropriate values
;1261:	next = ent->nextTrain;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ASGNP4
line 1262
;1262:	if ( !next || !next->nextTrain ) {
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $508
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $506
LABELV $508
line 1263
;1263:		return;		// just stop
ADDRGP4 $505
JUMPV
LABELV $506
line 1267
;1264:	}
;1265:
;1266:	// fire all other targets
;1267:	G_UseTargets( next, NULL );
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1270
;1268:
;1269:	// set the new trajectory
;1270:	ent->nextTrain = next->nextTrain;
ADDRLP4 32
CNSTI4 604
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 1271
;1271:	VectorCopy( next->s.origin, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1272
;1272:	VectorCopy( next->nextTrain->s.origin, ent->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1275
;1273:
;1274:	// if the path_corner has a speed, use that
;1275:	if ( next->speed ) {
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $509
line 1276
;1276:		speed = next->speed;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1277
;1277:	} else {
ADDRGP4 $510
JUMPV
LABELV $509
line 1279
;1278:		// otherwise use the train's speed
;1279:		speed = ent->speed;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1280
;1280:	}
LABELV $510
line 1281
;1281:	if ( speed < 1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $511
line 1282
;1282:		speed = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1283
;1283:	}
LABELV $511
line 1286
;1284:
;1285:	// calculate duration
;1286:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1287
;1287:	length = VectorLength( move );
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1289
;1288:
;1289:	ent->s.pos.trDuration = length * 1000 / speed;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1292
;1290:
;1291:	// looping sound
;1292:	ent->s.loopSound = next->soundLoop;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 1295
;1293:
;1294:	// start it going
;1295:	SetMoverState( ent, MOVER_1TO2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 1298
;1296:
;1297:	// if there is a "wait" value on the target, don't start moving yet
;1298:	if ( next->wait ) {
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $516
line 1299
;1299:		ent->nextthink = level.time + next->wait * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1300
;1300:		ent->think = Think_BeginMoving;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_BeginMoving
ASGNP4
line 1301
;1301:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1302
;1302:	}
LABELV $516
line 1303
;1303:}
LABELV $505
endproc Reached_Train 48 12
export Think_SetupTrainTargets
proc Think_SetupTrainTargets 28 12
line 1313
;1304:
;1305:
;1306:/*
;1307:===============
;1308:Think_SetupTrainTargets
;1309:
;1310:Link all the corners together
;1311:===============
;1312:*/
;1313:void Think_SetupTrainTargets( gentity_t *ent ) {
line 1316
;1314:	gentity_t		*path, *next, *start;
;1315:
;1316:	ent->nextTrain = G_Find( NULL, FOFS(targetname), ent->target );
CNSTP4 0
ARGP4
CNSTI4 652
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 604
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 1317
;1317:	if ( !ent->nextTrain ) {
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
line 1318
;1318:		G_Printf( "func_train at %s with an unfound target\n",
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $522
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1320
;1319:			vtos(ent->r.absmin) );
;1320:		return;
ADDRGP4 $519
JUMPV
LABELV $520
line 1323
;1321:	}
;1322:
;1323:	start = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1324
;1324:	for ( path = ent->nextTrain ; path != start ; path = next ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $526
JUMPV
LABELV $523
line 1325
;1325:		if ( !start ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $527
line 1326
;1326:			start = path;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 1327
;1327:		}
LABELV $527
line 1329
;1328:
;1329:		if ( !path->target ) {
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $529
line 1330
;1330:			G_Printf( "Train corner at %s without a target\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $531
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1332
;1331:				vtos(path->s.origin) );
;1332:			return;
ADDRGP4 $519
JUMPV
LABELV $529
line 1338
;1333:		}
;1334:
;1335:		// find a path_corner among the targets
;1336:		// there may also be other targets that get fired when the corner
;1337:		// is reached
;1338:		next = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $532
line 1339
;1339:		do {
line 1340
;1340:			next = G_Find( next, FOFS(targetname), path->target );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1341
;1341:			if ( !next ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $535
line 1342
;1342:				G_Printf( "Train corner at %s without a target path_corner\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $537
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1344
;1343:					vtos(path->s.origin) );
;1344:				return;
ADDRGP4 $519
JUMPV
LABELV $535
line 1346
;1345:			}
;1346:		} while ( strcmp( next->classname, "path_corner" ) );
LABELV $533
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $532
line 1348
;1347:
;1348:		path->nextTrain = next;
ADDRLP4 4
INDIRP4
CNSTI4 604
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1349
;1349:	}
LABELV $524
line 1324
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $526
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
NEU4 $523
line 1352
;1350:
;1351:	// start the train moving from the first corner
;1352:	Reached_Train( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Reached_Train
CALLV
pop
line 1353
;1353:}
LABELV $519
endproc Think_SetupTrainTargets 28 12
export SP_path_corner
proc SP_path_corner 4 8
line 1363
;1354:
;1355:
;1356:
;1357:/*QUAKED path_corner (.5 .3 0) (-8 -8 -8) (8 8 8)
;1358:Train path corners.
;1359:Target: next path corner and other targets to fire
;1360:"speed" speed to move to the next corner
;1361:"wait" seconds to wait before behining move to next corner
;1362:*/
;1363:void SP_path_corner( gentity_t *self ) {
line 1364
;1364:	if ( !self->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $540
line 1365
;1365:		G_Printf ("path_corner with no targetname at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $542
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1366
;1366:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1367
;1367:		return;
LABELV $540
line 1370
;1368:	}
;1369:	// path corners don't need to be linked in
;1370:}
LABELV $539
endproc SP_path_corner 4 8
export SP_func_train
proc SP_func_train 12 8
line 1386
;1371:
;1372:
;1373:
;1374:/*QUAKED func_train (0 .5 .8) ? START_ON TOGGLE BLOCK_STOPS
;1375:A train is a mover that moves between path_corner target points.
;1376:Trains MUST HAVE AN ORIGIN BRUSH.
;1377:The train spawns at the first target it is pointing at.
;1378:"model2"	.md3 model to also draw
;1379:"speed"		default 100
;1380:"dmg"		default	2
;1381:"noise"		looping sound to play when the train is in motion
;1382:"target"	next path corner
;1383:"color"		constantLight color
;1384:"light"		constantLight radius
;1385:*/
;1386:void SP_func_train (gentity_t *self) {
line 1387
;1387:	VectorClear (self->s.angles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1389
;1388:
;1389:	if (self->spawnflags & TRAIN_BLOCK_STOPS) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $544
line 1390
;1390:		self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 0
ASGNI4
line 1391
;1391:	} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 1392
;1392:		if (!self->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $546
line 1393
;1393:			self->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 2
ASGNI4
line 1394
;1394:		}
LABELV $546
line 1395
;1395:	}
LABELV $545
line 1397
;1396:
;1397:	if ( !self->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $548
line 1398
;1398:		self->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1120403456
ASGNF4
line 1399
;1399:	}
LABELV $548
line 1401
;1400:
;1401:	if ( !self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $550
line 1402
;1402:		G_Printf ("func_train without a target at %s\n", vtos(self->r.absmin));
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $552
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1403
;1403:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1404
;1404:		return;
ADDRGP4 $543
JUMPV
LABELV $550
line 1407
;1405:	}
;1406:
;1407:	trap_SetBrushModel( self, self->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1408
;1408:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1410
;1409:
;1410:	self->reached = Reached_Train;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 Reached_Train
ASGNP4
line 1414
;1411:
;1412:	// start trains on the second frame, to make sure their targets have had
;1413:	// a chance to spawn
;1414:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1415
;1415:	self->think = Think_SetupTrainTargets;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_SetupTrainTargets
ASGNP4
line 1416
;1416:}
LABELV $543
endproc SP_func_train 12 8
export SP_func_static
proc SP_func_static 12 8
line 1433
;1417:
;1418:/*
;1419:===============================================================================
;1420:
;1421:STATIC
;1422:
;1423:===============================================================================
;1424:*/
;1425:
;1426:
;1427:/*QUAKED func_static (0 .5 .8) ?
;1428:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;1429:"model2"	.md3 model to also draw
;1430:"color"		constantLight color
;1431:"light"		constantLight radius
;1432:*/
;1433:void SP_func_static( gentity_t *ent ) {
line 1434
;1434:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1435
;1435:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1436
;1436:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1437
;1437:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1438
;1438:}
LABELV $554
endproc SP_func_static 12 8
export SP_func_rotating
proc SP_func_rotating 16 8
line 1461
;1439:
;1440:
;1441:/*
;1442:===============================================================================
;1443:
;1444:ROTATING
;1445:
;1446:===============================================================================
;1447:*/
;1448:
;1449:
;1450:/*QUAKED func_rotating (0 .5 .8) ? START_ON - X_AXIS Y_AXIS
;1451:You need to have an origin brush as part of this entity.  The center of that brush will be
;1452:the point around which it is rotated. It will rotate around the Z axis by default.  You can
;1453:check either the X_AXIS or Y_AXIS box to change that.
;1454:
;1455:"model2"	.md3 model to also draw
;1456:"speed"		determines how fast it moves; default value is 100.
;1457:"dmg"		damage to inflict when blocked (2 default)
;1458:"color"		constantLight color
;1459:"light"		constantLight radius
;1460:*/
;1461:void SP_func_rotating (gentity_t *ent) {
line 1462
;1462:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $556
line 1463
;1463:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1120403456
ASGNF4
line 1464
;1464:	}
LABELV $556
line 1467
;1465:
;1466:	// set the axis of rotation
;1467:	ent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 1468
;1468:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $558
line 1469
;1469:		ent->s.apos.trDelta[2] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1470
;1470:	} else if ( ent->spawnflags & 8 ) {
ADDRGP4 $559
JUMPV
LABELV $558
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $560
line 1471
;1471:		ent->s.apos.trDelta[0] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1472
;1472:	} else {
ADDRGP4 $561
JUMPV
LABELV $560
line 1473
;1473:		ent->s.apos.trDelta[1] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1474
;1474:	}
LABELV $561
LABELV $559
line 1476
;1475:
;1476:	if (!ent->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $562
line 1477
;1477:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 2
ASGNI4
line 1478
;1478:	}
LABELV $562
line 1480
;1479:
;1480:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1481
;1481:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1483
;1482:
;1483:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1484
;1484:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1485
;1485:	VectorCopy( ent->s.apos.trBase, ent->r.currentAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1487
;1486:
;1487:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1488
;1488:}
LABELV $555
endproc SP_func_rotating 16 8
export SP_func_bobbing
proc SP_func_bobbing 28 12
line 1510
;1489:
;1490:
;1491:/*
;1492:===============================================================================
;1493:
;1494:BOBBING
;1495:
;1496:===============================================================================
;1497:*/
;1498:
;1499:
;1500:/*QUAKED func_bobbing (0 .5 .8) ? X_AXIS Y_AXIS
;1501:Normally bobs on the Z axis
;1502:"model2"	.md3 model to also draw
;1503:"height"	amplitude of bob (32 default)
;1504:"speed"		seconds to complete a bob cycle (4 default)
;1505:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1506:"dmg"		damage to inflict when blocked (2 default)
;1507:"color"		constantLight color
;1508:"light"		constantLight radius
;1509:*/
;1510:void SP_func_bobbing (gentity_t *ent) {
line 1514
;1511:	float		height;
;1512:	float		phase;
;1513:
;1514:	G_SpawnFloat( "speed", "4", &ent->speed );
ADDRGP4 $472
ARGP4
ADDRGP4 $492
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1515
;1515:	G_SpawnFloat( "height", "32", &height );
ADDRGP4 $478
ARGP4
ADDRGP4 $565
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1516
;1516:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1517
;1517:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $566
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1519
;1518:
;1519:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1520
;1520:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1522
;1521:
;1522:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1523
;1523:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1525
;1524:
;1525:	ent->s.pos.trDuration = ent->speed * 1000;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1526
;1526:	ent->s.pos.trTime = ent->s.pos.trDuration * phase;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1527
;1527:	ent->s.pos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 4
ASGNI4
line 1530
;1528:
;1529:	// set the axis of bobbing
;1530:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $567
line 1531
;1531:		ent->s.pos.trDelta[0] = height;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1532
;1532:	} else if ( ent->spawnflags & 2 ) {
ADDRGP4 $568
JUMPV
LABELV $567
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $569
line 1533
;1533:		ent->s.pos.trDelta[1] = height;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1534
;1534:	} else {
ADDRGP4 $570
JUMPV
LABELV $569
line 1535
;1535:		ent->s.pos.trDelta[2] = height;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1536
;1536:	}
LABELV $570
LABELV $568
line 1537
;1537:}
LABELV $564
endproc SP_func_bobbing 28 12
export SP_func_pendulum
proc SP_func_pendulum 44 12
line 1559
;1538:
;1539:/*
;1540:===============================================================================
;1541:
;1542:PENDULUM
;1543:
;1544:===============================================================================
;1545:*/
;1546:
;1547:
;1548:/*QUAKED func_pendulum (0 .5 .8) ?
;1549:You need to have an origin brush as part of this entity.
;1550:Pendulums always swing north / south on unrotated models.  Add an angles field to the model to allow rotation in other directions.
;1551:Pendulum frequency is a physical constant based on the length of the beam and gravity.
;1552:"model2"	.md3 model to also draw
;1553:"speed"		the number of degrees each way the pendulum swings, (30 default)
;1554:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1555:"dmg"		damage to inflict when blocked (2 default)
;1556:"color"		constantLight color
;1557:"light"		constantLight radius
;1558:*/
;1559:void SP_func_pendulum(gentity_t *ent) {
line 1565
;1560:	float		freq;
;1561:	float		length;
;1562:	float		phase;
;1563:	float		speed;
;1564:
;1565:	G_SpawnFloat( "speed", "30", &speed );
ADDRGP4 $472
ARGP4
ADDRGP4 $572
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1566
;1566:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1567
;1567:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $566
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1569
;1568:
;1569:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1572
;1570:
;1571:	// find pendulum length
;1572:	length = fabs( ent->r.mins[2] );
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1573
;1573:	if ( length < 8 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1090519040
GEF4 $573
line 1574
;1574:		length = 8;
ADDRLP4 0
CNSTF4 1090519040
ASGNF4
line 1575
;1575:	}
LABELV $573
line 1577
;1576:
;1577:	freq = 1 / ( M_PI * 2 ) * sqrt( g_gravity.value / ( 3 * length ) );
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1042479491
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1579
;1578:
;1579:	ent->s.pos.trDuration = ( 1000 / freq );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1581
;1580:
;1581:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1583
;1582:
;1583:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1584
;1584:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1586
;1585:
;1586:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1588
;1587:
;1588:	ent->s.apos.trDuration = 1000 / freq;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1589
;1589:	ent->s.apos.trTime = ent->s.apos.trDuration * phase;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1590
;1590:	ent->s.apos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 4
ASGNI4
line 1591
;1591:	ent->s.apos.trDelta[2] = speed;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1592
;1592:}
LABELV $571
endproc SP_func_pendulum 44 12
import G_ExplodeMissile
bss
export pushed_p
align 4
LABELV pushed_p
skip 4
export pushed
align 4
LABELV pushed
skip 32768
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
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
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
import Team_CheckDroppedItem
import OnSameTeam
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
LABELV $572
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $566
byte 1 112
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $565
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $552
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $542
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $538
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $537
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $531
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $522
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $492
byte 1 52
byte 1 0
align 1
LABELV $487
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 116
byte 1 110
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $478
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $475
byte 1 49
byte 1 0
align 1
LABELV $474
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $473
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $472
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $471
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 116
byte 1 49
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $470
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 116
byte 1 49
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $455
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $436
byte 1 48
byte 1 0
align 1
LABELV $435
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $421
byte 1 50
byte 1 0
align 1
LABELV $420
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $419
byte 1 56
byte 1 0
align 1
LABELV $418
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $413
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 114
byte 1 49
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $412
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 114
byte 1 49
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $407
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $343
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $342
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $341
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $340
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $339
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $303
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 66
byte 1 105
byte 1 110
byte 1 97
byte 1 114
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $85
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 32
byte 1 62
byte 1 32
byte 1 38
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 91
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 84
byte 1 73
byte 1 84
byte 1 73
byte 1 69
byte 1 83
byte 1 93
byte 1 0
