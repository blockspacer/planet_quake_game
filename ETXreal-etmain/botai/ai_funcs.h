/*
===========================================================================

Wolfenstein: Enemy Territory GPL Source Code
Copyright (C) 1999-2010 id Software LLC, a ZeniMax Media company. 

This file is part of the Wolfenstein: Enemy Territory GPL Source Code (Wolf ET Source Code).  

Wolf ET Source Code is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Wolf ET Source Code is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Wolf ET Source Code.  If not, see <http://www.gnu.org/licenses/>.

In addition, the Wolf: ET Source Code is also subject to certain additional terms. You should have received a copy of these additional terms immediately following the terms and conditions of the GNU General Public License which accompanied the Wolf ET Source Code.  If not, please request a copy in writing from id Software at the address below.

If you have questions concerning this license or the applicable additional terms, you may contact in writing id Software LLC, c/o ZeniMax Media Inc., Suite 120, Rockville, Maryland 20850 USA.

===========================================================================
*/

{
"BotObjectiveFunc", (byte *) BotObjectiveFunc}

,
{
"BotBehaviourFunc", (byte *) BotBehaviourFunc}

,
{
"BotEngagementFunc", (byte *) BotEngagementFunc}

,
{
"BotSetLeaderTagEnt", (byte *) BotSetLeaderTagEnt}

,
{
"EntGetNumBotFollowers", (byte *) EntGetNumBotFollowers}

,
{
"BotGetLeader", (byte *) BotGetLeader}

,
{
"G_RequestedFollow", (byte *) G_RequestedFollow}

,
{
"BotSpawnSpecialEntities", (byte *) BotSpawnSpecialEntities}

,
{
"BotVoiceChatAfterTeamIdleTime", (byte *) BotVoiceChatAfterTeamIdleTime}

,
{
"AI_Team_Init_All_Teams", (byte *) AI_Team_Init_All_Teams}

,
{
"AI_Team_Init", (byte *) AI_Team_Init}

,
{
"BotVoiceChatAfterIdleTime", (byte *) BotVoiceChatAfterIdleTime}

,
{
"BotSendVoiceChat", (byte *) BotSendVoiceChat}

,
{
"BotDelayedVoiceChat", (byte *) BotDelayedVoiceChat}

,
{
"BotCheckVoiceChatResponse", (byte *) BotCheckVoiceChatResponse}

,
{
"BotRecordVoiceChat", (byte *) BotRecordVoiceChat}

,
{
"BotClass_LtCheckGiveAmmo", (byte *) BotClass_LtCheckGiveAmmo}

,
{
"G_RequestedAmmo", (byte *) G_RequestedAmmo}

,
{
"BotClass_MedicCheckGiveHealth", (byte *) BotClass_MedicCheckGiveHealth}

,
{
"G_RequestedHealth", (byte *) G_RequestedHealth}

,
{
"BotClass_MedicCheckRevives", (byte *) BotClass_MedicCheckRevives}

,
{
"BotClass_CovertOpsCheckDisguises", (byte *) BotClass_CovertOpsCheckDisguises}

,
{
"BotTeamOrders", (byte *) BotTeamOrders}

,
{
"BotCTFOrders_BothFlagsAtBase", (byte *) BotCTFOrders_BothFlagsAtBase}

,
{
"BotCTFOrders_EnemyFlagNotAtBase", (byte *) BotCTFOrders_EnemyFlagNotAtBase}

,
{
"BotCTFOrders_FlagNotAtBase", (byte *) BotCTFOrders_FlagNotAtBase}

,
{
"BotCTFOrders_BothFlagsNotAtBase", (byte *) BotCTFOrders_BothFlagsNotAtBase}

,
{
"BotSuggestWeapon", (byte *) BotSuggestWeapon}

,
{
"BotSuggestClass", (byte *) BotSuggestClass}

,
{
"BotCheckNeedEngineer", (byte *) BotCheckNeedEngineer}

,
{
"BotNumTeamClasses", (byte *) BotNumTeamClasses}

,
{
"BotNumTeamMembers", (byte *) BotNumTeamMembers}

,
{
"BotGetConstructibles", (byte *) BotGetConstructibles}

,
{
"BotGetTargetDynamite", (byte *) BotGetTargetDynamite}

,
{
"GetTargetExplosives", (byte *) GetTargetExplosives}

,
{
"BotGetTargetExplosives", (byte *) BotGetTargetExplosives}

,
{
"BotGetTargetsForSatchelCharge", (byte *) BotGetTargetsForSatchelCharge}

,
{
"G_FindSatchelChargeTargetForTeam", (byte *) G_FindSatchelChargeTargetForTeam}

,
{
"G_FindDynamiteTargetForTeam", (byte *) G_FindDynamiteTargetForTeam}

,
{
"G_IsConstructible", (byte *) G_IsConstructible}

,
{
"G_ConstructionForTeam", (byte *) G_ConstructionForTeam}

,
{
"G_ConstructionIsDestroyable", (byte *) G_ConstructionIsDestroyable}

,
{
"G_ConstructionIsPartlyBuilt", (byte *) G_ConstructionIsPartlyBuilt}

,
{
"G_ConstructionIsFullyBuilt", (byte *) G_ConstructionIsFullyBuilt}

,
{
"G_ConstructionBegun", (byte *) G_ConstructionBegun}

,
{
"G_FindSatchels", (byte *) G_FindSatchels}

,
{
"G_FindLandmine", (byte *) G_FindLandmine}

,
{
"G_FindSmokeBomb", (byte *) G_FindSmokeBomb}

,
{
"G_FindDynamite", (byte *) G_FindDynamite}

,
{
"G_FindMissile", (byte *) G_FindMissile}

,
{
"BotFindSparseDefendArea", (byte *) BotFindSparseDefendArea}

,
{
"BotFindDroppedFlag", (byte *) BotFindDroppedFlag}

,
{
"BotSayTeamOrder", (byte *) BotSayTeamOrder}

,
{
"BotSortTeamMatesByBaseTravelTime", (byte *) BotSortTeamMatesByBaseTravelTime}

,
{
"BotClientTravelTimeToGoal", (byte *) BotClientTravelTimeToGoal}

,
{
"BotFlagAtBase", (byte *) BotFlagAtBase}

,
{
"BotGetTeamFlagCarrier", (byte *) BotGetTeamFlagCarrier}

,
{
"BotGetEnemyFlagCarrier", (byte *) BotGetEnemyFlagCarrier}

,
{
"BotSortPlayersByTraveltime", (byte *) BotSortPlayersByTraveltime}

,
{
"BotSortPlayersByDistance", (byte *) BotSortPlayersByDistance}

,
{
"BotNumTeamMatesWithTargetAndCloser", (byte *) BotNumTeamMatesWithTargetAndCloser}

,
{
"BotNumTeamMatesWithTargetByClass", (byte *) BotNumTeamMatesWithTargetByClass}

,
{
"BotNumTeamMatesWithTarget", (byte *) BotNumTeamMatesWithTarget}

,
{
"BotNumTeamMates", (byte *) BotNumTeamMates}

,
{
"BotValidTeamLeader", (byte *) BotValidTeamLeader}

,
{
"Bot_ScriptAction_SetCivilian", (byte *) Bot_ScriptAction_SetCivilian}

,
{
"Bot_ScriptAction_SetAmmoAmount", (byte *) Bot_ScriptAction_SetAmmoAmount}

,
{
"Bot_ScriptAction_SetScriptAutonomy", (byte *) Bot_ScriptAction_SetScriptAutonomy}

,
{
"Bot_ScriptAction_FireAtTarget", (byte *) Bot_ScriptAction_FireAtTarget}

,
{
"Bot_ScriptAction_Announce", (byte *) Bot_ScriptAction_Announce}

,
{
"Bot_ScriptAction_SetActiveWeapon", (byte *) Bot_ScriptAction_SetActiveWeapon}

,
{
"Bot_ScriptAction_SetSpeedCoefficient", (byte *) Bot_ScriptAction_SetSpeedCoefficient}

,
{
"Bot_ScriptAction_SetCloseHearingRange", (byte *) Bot_ScriptAction_SetCloseHearingRange}

,
{
"Bot_ScriptAction_SetFarSeeingRange", (byte *) Bot_ScriptAction_SetFarSeeingRange}

,
{
"Bot_ScriptAction_SetVisionRange", (byte *) Bot_ScriptAction_SetVisionRange}

,
{
"Bot_ScriptAction_SetFireCycleTime", (byte *) Bot_ScriptAction_SetFireCycleTime}

,
{
"Bot_ScriptAction_SetFireRate", (byte *) Bot_ScriptAction_SetFireRate}

,
{
"Bot_ScriptAction_BotDebugging", (byte *) Bot_ScriptAction_BotDebugging}

,
{
"Bot_ScriptAction_PrintGlobalAccum", (byte *) Bot_ScriptAction_PrintGlobalAccum}

,
{
"Bot_ScriptAction_PrintAccum", (byte *) Bot_ScriptAction_PrintAccum}

,
{
"Bot_ScriptAction_SetProne", (byte *) Bot_ScriptAction_SetProne}

,
{
"Bot_ScriptAction_SetCrouch", (byte *) Bot_ScriptAction_SetCrouch}

,
{
"Bot_ScriptAction_SetHearingRange", (byte *) Bot_ScriptAction_SetHearingRange}

,
{
"Bot_ScriptAction_SetFieldOfView", (byte *) Bot_ScriptAction_SetFieldOfView}

,
{
"Bot_ScriptAction_ResetScript", (byte *) Bot_ScriptAction_ResetScript}

,
{
"Bot_ScriptAction_NoTarget", (byte *) Bot_ScriptAction_NoTarget}

,
{
"Bot_ScriptAction_MovementAutonomy", (byte *) Bot_ScriptAction_MovementAutonomy}

,
{
"Bot_ScriptAction_SetMovementAutonomy", (byte *) Bot_ScriptAction_SetMovementAutonomy}

,
{
"Bot_ScriptAction_Cvar", (byte *) Bot_ScriptAction_Cvar}

,
{
"Bot_ScriptAction_FollowLeader", (byte *) Bot_ScriptAction_FollowLeader}

,
{
"Bot_ScriptAction_GlobalAccum", (byte *) Bot_ScriptAction_GlobalAccum}

,
{
"Bot_ScriptAction_SetClass", (byte *) Bot_ScriptAction_SetClass}

,
{
"Bot_ScriptAction_SetWeapon", (byte *) Bot_ScriptAction_SetWeapon}

,
{
"Bot_ScriptAction_PlaySoundAtPlayer", (byte *) Bot_ScriptAction_PlaySoundAtPlayer}

,
{
"Bot_ScriptAction_MountMG42", (byte *) Bot_ScriptAction_MountMG42}

,
{
"Bot_ScriptAction_SetAttribute", (byte *) Bot_ScriptAction_SetAttribute}

,
{
"Bot_ScriptAction_AbortIfWarmup", (byte *) Bot_ScriptAction_AbortIfWarmup}

,
{
"Bot_ScriptAction_Logging", (byte *) Bot_ScriptAction_Logging}

,
{
"Bot_ScriptAction_Trigger", (byte *) Bot_ScriptAction_Trigger}

,
{
"Bot_ScriptAction_MoveToMarker", (byte *) Bot_ScriptAction_MoveToMarker}

,
{
"Bot_ScriptAction_Wait", (byte *) Bot_ScriptAction_Wait}

,
{
"Bot_ScriptAction_Accum", (byte *) Bot_ScriptAction_Accum}

,
{
"Bot_ScriptAction_SpawnBot", (byte *) Bot_ScriptAction_SpawnBot}

,
{
"Bot_ScriptAction_SetAccumToPlayerCount", (byte *) Bot_ScriptAction_SetAccumToPlayerCount}

,
{
"Bot_ScriptAction_Print", (byte *) Bot_ScriptAction_Print}

,
{
"Bot_ScriptError", (byte *) Bot_ScriptError}

,
{
"Bot_ScriptAction_SetSpeed", (byte *) Bot_ScriptAction_SetSpeed}

,
{
"Bot_ScriptThink", (byte *) Bot_ScriptThink}

,
{
"Bot_ScriptLog_Entry", (byte *) Bot_ScriptLog_Entry}

,
{
"Bot_Script_GetCurrentLine", (byte *) Bot_Script_GetCurrentLine}

,
{
"Bot_ScriptRun", (byte *) Bot_ScriptRun}

,
{
"Bot_TeamScriptEvent", (byte *) Bot_TeamScriptEvent}

,
{
"Bot_ForceScriptEvent", (byte *) Bot_ForceScriptEvent}

,
{
"Bot_ScriptEvent", (byte *) Bot_ScriptEvent}

,
{
"Bot_ScriptChange", (byte *) Bot_ScriptChange}

,
{
"Bot_LineText", (byte *) Bot_LineText}

,
{
"Bot_ScriptInitBot", (byte *) Bot_ScriptInitBot}

,
{
"Bot_ScriptParse", (byte *) Bot_ScriptParse}

,
{
"Bot_ScriptParseAllCharacters", (byte *) Bot_ScriptParseAllCharacters}

,
{
"Bot_ScriptLoad", (byte *) Bot_ScriptLoad}

,
{
"Bot_ActionForString", (byte *) Bot_ActionForString}

,
{
"Bot_EventForString", (byte *) Bot_EventForString}

,
{
"Bot_EventMatch_IntInRange", (byte *) Bot_EventMatch_IntInRange}

,
{
"Bot_EventMatch_StringEqual", (byte *) Bot_EventMatch_StringEqual}

,
{
"Bot_FindSriptGlobalData", (byte *) Bot_FindSriptGlobalData}

,
{
"BotDebugViewClient", (byte *) BotDebugViewClient}

,
{
"BotInitMovementAutonomyPos", (byte *) BotInitMovementAutonomyPos}

,
{
"BotSetIdealViewAngles", (byte *) BotSetIdealViewAngles}

,
{
"GetBotAmmo", (byte *) GetBotAmmo}

,
{
"GetBotAutonomies", (byte *) GetBotAutonomies}

,
{
"BotDebug", (byte *) BotDebug}

,
{
"BotRecordAttack", (byte *) BotRecordAttack}

,
{
"BotRecordTeamDeath", (byte *) BotRecordTeamDeath}

,
{
"G_SetAASBlockingEntity", (byte *) G_SetAASBlockingEntity}

,
{
"BotCoop", (byte *) BotCoop}

,
{
"BotSinglePlayer", (byte *) BotSinglePlayer}

,
{
"BotFindEntityForName", (byte *) BotFindEntityForName}

,
{
"BotFindNextStaticEntity", (byte *) BotFindNextStaticEntity}

,
{
"BotBuildStaticEntityCache", (byte *) BotBuildStaticEntityCache}

,
{
"BotGetEntity", (byte *) BotGetEntity}

,
{
"FindBotByName", (byte *) FindBotByName}

,
{
"BotFindEntity", (byte *) BotFindEntity}

,
{
"BotAIShutdown", (byte *) BotAIShutdown}

,
{
"BotAISetup", (byte *) BotAISetup}

,
{
"BotInitLibrary", (byte *) BotInitLibrary}

,
{
"BotAIStartFrame", (byte *) BotAIStartFrame}

,
{
"BotAIThinkFrame", (byte *) BotAIThinkFrame}

,
{
"BotPreProcessAI", (byte *) BotPreProcessAI}

,
{
"BotAILoadMap", (byte *) BotAILoadMap}

,
{
"BotResetState", (byte *) BotResetState}

,
{
"BotAIShutdownClient", (byte *) BotAIShutdownClient}

,
{
"BotAISetupClient", (byte *) BotAISetupClient}

,
{
"BotSetUpCharacter", (byte *) BotSetUpCharacter}

,
{
"BotSetCharacterAttributes", (byte *) BotSetCharacterAttributes}

,
{
"ParseBotDefaultAttributes", (byte *) ParseBotDefaultAttributes}

,
{
"BotGetInitialAttributes", (byte *) BotGetInitialAttributes}

,
{
"BotScheduleBotThink", (byte *) BotScheduleBotThink}

,
{
"BotAI", (byte *) BotAI}

,
{
"BotTravelFlagsForClient", (byte *) BotTravelFlagsForClient}

,
{
"BotAIRegularUpdate", (byte *) BotAIRegularUpdate}

,
{
"BotUpdateInput", (byte *) BotUpdateInput}

,
{
"BotInputToUserCommand", (byte *) BotInputToUserCommand}

,
{
"BotSpeedBonus", (byte *) BotSpeedBonus}

,
{
"BotChangeViewAngles", (byte *) BotChangeViewAngles}

,
{
"BotChangeViewAngle", (byte *) BotChangeViewAngle}

,
{
"AngleDifference", (byte *) AngleDifference}

,
{
"BotAI_SetNumBots", (byte *) BotAI_SetNumBots}

,
{
"BotAI_GetNumBots", (byte *) BotAI_GetNumBots}

,
{
"BotEntityInfo", (byte *) BotEntityInfo}

,
{
"BotInterbreeding", (byte *) BotInterbreeding}

,
{
"BotAI_BotInitialChat", (byte *) BotAI_BotInitialChat}

,
{
"BotAI_GetSnapshotEntity", (byte *) BotAI_GetSnapshotEntity}

,
{
"BotAI_GetEntityState", (byte *) BotAI_GetEntityState}

,
{
"BotAI_GetClientState", (byte *) BotAI_GetClientState}

,
{
"BotAI_Trace", (byte *) BotAI_Trace}

,
{
"BotAI_Print", (byte *) BotAI_Print}

,
{
"BotEntityWithinView", (byte *) BotEntityWithinView}

,
{
"BotPickupWeapon", (byte *) BotPickupWeapon}

,
{
"BotCountLandMines", (byte *) BotCountLandMines}

,
{
"BotGetVisibleDamagableScriptMover", (byte *) BotGetVisibleDamagableScriptMover}

,
{
"BotBestTargetWeapon", (byte *) BotBestTargetWeapon}

,
{
"BotSetPOW", (byte *) BotSetPOW}

,
{
"BotUpdateViewAngles", (byte *) BotUpdateViewAngles}

,
{
"BotFindAndAttackEnemy", (byte *) BotFindAndAttackEnemy}

,
{
"EnemyIsCloseEnoughToFight", (byte *) EnemyIsCloseEnoughToFight}

,
{
"BotHealthScale", (byte *) BotHealthScale}

,
{
"BotCanSnipe", (byte *) BotCanSnipe}

,
{
"BotIsConstructible", (byte *) BotIsConstructible}

,
{
"BotGetReachableEntityArea", (byte *) BotGetReachableEntityArea}

,
{
"BotEntityTargetClassnameMatch", (byte *) BotEntityTargetClassnameMatch}

,
{
"BotDirectMoveToGoal", (byte *) BotDirectMoveToGoal}

,
{
"BotBattleNewNode", (byte *) BotBattleNewNode}

,
{
"BotTravelTimeToEntity", (byte *) BotTravelTimeToEntity}

,
{
"BotReduceListByTravelTime", (byte *) BotReduceListByTravelTime}

,
{
"BotGetArea", (byte *) BotGetArea}

,
{
"BotGetOrigin", (byte *) BotGetOrigin}

,
{
"BotGetEye", (byte *) BotGetEye}

,
{
"BotSeekCover", (byte *) BotSeekCover}

,
{
"BotLastHurt", (byte *) BotLastHurt}

,
{
"BotLastAttacked", (byte *) BotLastAttacked}

,
{
"BotEnemyCarryingFlag", (byte *) BotEnemyCarryingFlag}

,
{
"BotShareLastAttacked", (byte *) BotShareLastAttacked}

,
{
"BotEnemyFire", (byte *) BotEnemyFire}

,
{
"BotCheckVoiceChats", (byte *) BotCheckVoiceChats}

,
{
"BotDefaultNode", (byte *) BotDefaultNode}

,
{
"BotFindSpecialGoals", (byte *) BotFindSpecialGoals}

,
{
"BotCheckEmergencyTargets", (byte *) BotCheckEmergencyTargets}

,
{
"BotScriptAutonomyForString", (byte *) BotScriptAutonomyForString}

,
{
"BotStringForWeaponAutonomy", (byte *) BotStringForWeaponAutonomy}

,
{
"BotWeaponAutonomyForString", (byte *) BotWeaponAutonomyForString}

,
{
"BotStringForMovementAutonomy", (byte *) BotStringForMovementAutonomy}

,
{
"BotMovementAutonomyForString", (byte *) BotMovementAutonomyForString}

,
{
"BotCalculateMg42Spots", (byte *) BotCalculateMg42Spots}

,
{
"BotDropFlag", (byte *) BotDropFlag}

,
{
"BotClearGoal", (byte *) BotClearGoal}

,
{
"BotGetRandomVisibleSniperSpot", (byte *) BotGetRandomVisibleSniperSpot}

,
{
"BotGetNumVisibleSniperSpots", (byte *) BotGetNumVisibleSniperSpots}

,
{
"BotBestMG42Spot", (byte *) BotBestMG42Spot}

,
{
"BotBestLandmineSpotingSpot", (byte *) BotBestLandmineSpotingSpot}

,
{
"BotBestSniperSpot", (byte *) BotBestSniperSpot}

,
{
"BotGetAimAccuracySkill", (byte *) BotGetAimAccuracySkill}

,
{
"BotRecordDeath", (byte *) BotRecordDeath}

,
{
"BotRecordPain", (byte *) BotRecordPain}

,
{
"BotRecordKill", (byte *) BotRecordKill}

,
{
"BotRecordTeamChange", (byte *) BotRecordTeamChange}

,
{
"BotMoveToIntermission", (byte *) BotMoveToIntermission}

,
{
"BotSetBlockEnt", (byte *) BotSetBlockEnt}

,
{
"BotShutdownDeathmatchAI", (byte *) BotShutdownDeathmatchAI}

,
{
"BotSetupDeathmatchAI", (byte *) BotSetupDeathmatchAI}

,
{
"BotDeathmatchAI", (byte *) BotDeathmatchAI}

,
{
"BotPowThink", (byte *) BotPowThink}

,
{
"BotDeathmatchAIFirstCalled", (byte *) BotDeathmatchAIFirstCalled}

,
{
"BotDumpNodeSwitches", (byte *) BotDumpNodeSwitches}

,
{
"BotResetNodeSwitches", (byte *) BotResetNodeSwitches}

,
{
"BotUpdateReconInfo", (byte *) BotUpdateReconInfo}

,
{
"BotCheckAlert", (byte *) BotCheckAlert}

,
{
"BotCheckAir", (byte *) BotCheckAir}

,
{
"BotCheckSnapshot", (byte *) BotCheckSnapshot}

,
{
"BotCheckEvents", (byte *) BotCheckEvents}

,
{
"BotAIBlocked", (byte *) BotAIBlocked}

,
{
"BotModelMinsMaxs", (byte *) BotModelMinsMaxs}

,
{
"BotSetMovedir", (byte *) BotSetMovedir}

,
{
"BotEntityToActivate", (byte *) BotEntityToActivate}

,
{
"BotMapScripts", (byte *) BotMapScripts}

,
{
"BotCheckAttack", (byte *) BotCheckAttack}

,
{
"BotScopedWeapon", (byte *) BotScopedWeapon}

,
{
"BotThrottleWeapon", (byte *) BotThrottleWeapon}

,
{
"BotMoveWhileFiring", (byte *) BotMoveWhileFiring}

,
{
"BotAimAtEnemySP", (byte *) BotAimAtEnemySP}

,
{
"BotAimAtEnemy", (byte *) BotAimAtEnemy}

,
{
"swayrand", (byte *) swayrand}

,
{
"BotGetReactionTime", (byte *) BotGetReactionTime}

,
{
"BotFindEnemyMP", (byte *) BotFindEnemyMP}

,
{
"BotSortClientsByDistance", (byte *) BotSortClientsByDistance}

,
{
"BotHasWeaponWithRange", (byte *) BotHasWeaponWithRange}

,
{
"BotWeaponRange", (byte *) BotWeaponRange}

,
{
"BotFindEnemies", (byte *) BotFindEnemies}

,
{
"BotIsValidTarget", (byte *) BotIsValidTarget}

,
{
"BotGetEntitySurfaceSoundCoefficient", (byte *) BotGetEntitySurfaceSoundCoefficient}

,
{
"BotUpdateAlertStateSquadSensingInfo", (byte *) BotUpdateAlertStateSquadSensingInfo}

,
{
"ChangeBotAlertState", (byte *) ChangeBotAlertState}

,
{
"BotNoLeaderPenalty", (byte *) BotNoLeaderPenalty}

,
{
"BotDangerousGoal", (byte *) BotDangerousGoal}

,
{
"BotIgnoreGoal", (byte *) BotIgnoreGoal}

,
{
"BotCheckMovementAutonomy", (byte *) BotCheckMovementAutonomy}

,
{
"sAdjustPointTowardsPlayer", (byte *) sAdjustPointTowardsPlayer}

,
{
"sAngleBetweenVectors", (byte *) sAngleBetweenVectors}

,
{
"botindicator_think", (byte *) botindicator_think}

,
{
"BotGoalForEntity", (byte *) BotGoalForEntity}

,
{
"BotGoalWithinMovementAutonomy", (byte *) BotGoalWithinMovementAutonomy}

,
{
"BotPointWithinRawMovementAutonomy", (byte *) BotPointWithinRawMovementAutonomy}

,
{
"BotPointWithinMovementAutonomy", (byte *) BotPointWithinMovementAutonomy}

,
{
"BotWithinLeaderFollowDist", (byte *) BotWithinLeaderFollowDist}

,
{
"BotGetFollowAutonomyDist", (byte *) BotGetFollowAutonomyDist}

,
{
"BotGetMovementAutonomyRange", (byte *) BotGetMovementAutonomyRange}

,
{
"BotGetRawMovementAutonomyRange", (byte *) BotGetRawMovementAutonomyRange}

,
{
"BotGetMovementAutonomyPos", (byte *) BotGetMovementAutonomyPos}

,
{
"BotGetMovementAutonomyLevel", (byte *) BotGetMovementAutonomyLevel}

,
{
"BotCheckAttackAtPos", (byte *) BotCheckAttackAtPos}

,
{
"BotVisibleFromPos", (byte *) BotVisibleFromPos}

,
{
"BotEntityVisible", (byte *) BotEntityVisible}

,
{
"BotEntInvisibleBySmokeBomb", (byte *) BotEntInvisibleBySmokeBomb}

,
{
"InFieldOfVision", (byte *) InFieldOfVision}

,
{
"BotSameTeam", (byte *) BotSameTeam}

,
{
"BotAttackMove", (byte *) BotAttackMove}

,
{
"BotRoamGoal", (byte *) BotRoamGoal}

,
{
"BotGoForPowerups", (byte *) BotGoForPowerups}

,
{
"BotDontAvoid", (byte *) BotDontAvoid}

,
{
"BotGoCamp", (byte *) BotGoCamp}

,
{
"BotCanAndWantsToRocketJump", (byte *) BotCanAndWantsToRocketJump}

,
{
"BotWantsToHelp", (byte *) BotWantsToHelp}

,
{
"BotWantsToChase", (byte *) BotWantsToChase}

,
{
"BotWantsToRetreat", (byte *) BotWantsToRetreat}

,
{
"BotAggression", (byte *) BotAggression}

,
{
"TeamPlayIsOn", (byte *) TeamPlayIsOn}

,
{
"BotInitWaypoints", (byte *) BotInitWaypoints}

,
{
"BotFreeWaypoints", (byte *) BotFreeWaypoints}

,
{
"BotFindWayPoint", (byte *) BotFindWayPoint}

,
{
"BotCreateWayPoint", (byte *) BotCreateWayPoint}

,
{
"EntityHasQuad", (byte *) EntityHasQuad}

,
{
"EntityIsChatting", (byte *) EntityIsChatting}

,
{
"EntityIsShooting", (byte *) EntityIsShooting}

,
{
"EntityIsInvisible", (byte *) EntityIsInvisible}

,
{
"EntityInLimbo", (byte *) EntityInLimbo}

,
{
"EntityIsDead", (byte *) EntityIsDead}

,
{
"BotInSlime", (byte *) BotInSlime}

,
{
"BotInLava", (byte *) BotInLava}

,
{
"BotIntermission", (byte *) BotIntermission}

,
{
"BotIsObserver", (byte *) BotIsObserver}

,
{
"BotIsPOW", (byte *) BotIsPOW}

,
{
"BotIsDead", (byte *) BotIsDead}

,
{
"BotSetTeleportTime", (byte *) BotSetTeleportTime}

,
{
"BotBattleUseItems", (byte *) BotBattleUseItems}

,
{
"BotUpdateBattleInventory", (byte *) BotUpdateBattleInventory}

,
{
"BotUpdateInventory", (byte *) BotUpdateInventory}

,
{
"BotSetupForMovement", (byte *) BotSetupForMovement}

,
{
"BotCycleWeapon", (byte *) BotCycleWeapon}

,
{
"BotChooseWeapon", (byte *) BotChooseWeapon}

,
{
"BotBestFightWeapon", (byte *) BotBestFightWeapon}

,
{
"BotWeaponWantScale", (byte *) BotWeaponWantScale}

,
{
"BotTeamMatesNearEnemy", (byte *) BotTeamMatesNearEnemy}

,
{
"BotWeaponClosestDist", (byte *) BotWeaponClosestDist}

,
{
"BotWeaponOnlyUseIfInInRange", (byte *) BotWeaponOnlyUseIfInInRange}

,
{
"BotWeaponCharged", (byte *) BotWeaponCharged}

,
{
"G_WeaponCharged", (byte *) G_WeaponCharged}

,
{
"BotGotEnoughAmmoForWeapon", (byte *) BotGotEnoughAmmoForWeapon}

,
{
"EasyClientName", (byte *) EasyClientName}

,
{
"stristr", (byte *) stristr}

,
{
"ClientFromName", (byte *) ClientFromName}

,
{
"ClientSkin", (byte *) ClientSkin}

,
{
"ClientName", (byte *) ClientName}

,
{
"BotFindNearbyGoal", (byte *) BotFindNearbyGoal}

,
{
"BotFindNearbyTriggerGoal", (byte *) BotFindNearbyTriggerGoal}

,
{
"BotReachableBBoxAreaNum", (byte *) BotReachableBBoxAreaNum}

,
{
"BotPointAreaNum", (byte *) BotPointAreaNum}

,
{
"BotFirstLadderArea", (byte *) BotFirstLadderArea}

,
{
"BotFirstReachabilityArea", (byte *) BotFirstReachabilityArea}

,
{
"BotCarryingFlag", (byte *) BotCarryingFlag}

,
{
"AINode_MP_NavigateFromVoid", (byte *) AINode_MP_NavigateFromVoid}

,
{
"AIEnter_MP_NavigateFromVoid", (byte *) AIEnter_MP_NavigateFromVoid}

,
{
"AINode_MP_MoveToAutonomyRange", (byte *) AINode_MP_MoveToAutonomyRange}

,
{
"AIEnter_MP_MoveToAutonomyRange", (byte *) AIEnter_MP_MoveToAutonomyRange}

,
{
"AINode_MP_Script_MoveToMarker", (byte *) AINode_MP_Script_MoveToMarker}

,
{
"AIEnter_MP_Script_MoveToMarker", (byte *) AIEnter_MP_Script_MoveToMarker}

,
{
"AINode_MP_Battle_Retreat", (byte *) AINode_MP_Battle_Retreat}

,
{
"AIEnter_MP_Battle_Retreat", (byte *) AIEnter_MP_Battle_Retreat}

,
{
"AINode_MP_Battle_Chase", (byte *) AINode_MP_Battle_Chase}

,
{
"AIEnter_MP_Battle_Chase", (byte *) AIEnter_MP_Battle_Chase}

,
{
"AINode_MP_Battle_Fight", (byte *) AINode_MP_Battle_Fight}

,
{
"AIEnter_MP_Battle_Fight", (byte *) AIEnter_MP_Battle_Fight}

,
{
"AINode_MP_DisarmDynamite", (byte *) AINode_MP_DisarmDynamite}

,
{
"AIEnter_MP_DisarmDynamite", (byte *) AIEnter_MP_DisarmDynamite}

,
{
"AINode_MP_PlantMine", (byte *) AINode_MP_PlantMine}

,
{
"AIEnter_MP_PlantMine", (byte *) AIEnter_MP_PlantMine}

,
{
"AINode_MP_ConstructibleTarget", (byte *) AINode_MP_ConstructibleTarget}

,
{
"AIEnter_MP_ConstructibleTarget", (byte *) AIEnter_MP_ConstructibleTarget}

,
{
"AINode_MP_DynamiteTarget", (byte *) AINode_MP_DynamiteTarget}

,
{
"AIEnter_MP_DynamiteTarget", (byte *) AIEnter_MP_DynamiteTarget}

,
{
"AINode_MP_SatchelChargeTarget", (byte *) AINode_MP_SatchelChargeTarget}

,
{
"AIEnter_MP_SatchelChargeTarget", (byte *) AIEnter_MP_SatchelChargeTarget}

,
{
"AINode_MP_TouchTarget", (byte *) AINode_MP_TouchTarget}

,
{
"AIEnter_MP_TouchTarget", (byte *) AIEnter_MP_TouchTarget}

,
{
"AINode_MP_DefendTarget", (byte *) AINode_MP_DefendTarget}

,
{
"AIEnter_MP_DefendTarget", (byte *) AIEnter_MP_DefendTarget}

,
{
"AINode_MP_SniperSpot", (byte *) AINode_MP_SniperSpot}

,
{
"AIEnter_MP_SniperSpot", (byte *) AIEnter_MP_SniperSpot}

,
{
"AINode_MP_ScanForLandmines", (byte *) AINode_MP_ScanForLandmines}

,
{
"AIEnter_MP_ScanForLandmines", (byte *) AIEnter_MP_ScanForLandmines}

,
{
"AINode_MP_MG42Mount", (byte *) AINode_MP_MG42Mount}

,
{
"AIEnter_MP_MG42Mount", (byte *) AIEnter_MP_MG42Mount}

,
{
"AINode_MP_MG42Scan", (byte *) AINode_MP_MG42Scan}

,
{
"AIEnter_MP_MG42Scan", (byte *) AIEnter_MP_MG42Scan}

,
{
"AINode_MP_Battle_MobileMG42", (byte *) AINode_MP_Battle_MobileMG42}

,
{
"AIEnter_MP_Battle_MobileMG42", (byte *) AIEnter_MP_Battle_MobileMG42}

,
{
"AINode_MP_FixMG42", (byte *) AINode_MP_FixMG42}

,
{
"AIEnter_MP_FixMG42", (byte *) AIEnter_MP_FixMG42}

,
{
"AINode_MP_AttackTarget", (byte *) AINode_MP_AttackTarget}

,
{
"AIEnter_MP_AttackTarget", (byte *) AIEnter_MP_AttackTarget}

,
{
"AINode_MP_PanzerTarget", (byte *) AINode_MP_PanzerTarget}

,
{
"AIEnter_MP_PanzerTarget", (byte *) AIEnter_MP_PanzerTarget}

,
{
"AINode_MP_MedicRevive", (byte *) AINode_MP_MedicRevive}

,
{
"AIEnter_MP_MedicRevive", (byte *) AIEnter_MP_MedicRevive}

,
{
"AINode_MP_MedicGiveHealth", (byte *) AINode_MP_MedicGiveHealth}

,
{
"AIEnter_MP_MedicGiveHealth", (byte *) AIEnter_MP_MedicGiveHealth}

,
{
"AINode_MP_GiveAmmo", (byte *) AINode_MP_GiveAmmo}

,
{
"AIEnter_MP_GiveAmmo", (byte *) AIEnter_MP_GiveAmmo}

,
{
"AINode_MP_AvoidDanger", (byte *) AINode_MP_AvoidDanger}

,
{
"AIEnter_MP_AvoidDanger", (byte *) AIEnter_MP_AvoidDanger}

,
{
"AINode_MP_Seek_NBG", (byte *) AINode_MP_Seek_NBG}

,
{
"AIEnter_MP_Seek_NBG", (byte *) AIEnter_MP_Seek_NBG}

,
{
"AINode_MP_Seek_ActivateEntity", (byte *) AINode_MP_Seek_ActivateEntity}

,
{
"AIEnter_MP_Seek_ActivateEntity", (byte *) AIEnter_MP_Seek_ActivateEntity}

,
{
"AINode_MP_Respawn", (byte *) AINode_MP_Respawn}

,
{
"AIEnter_MP_Respawn", (byte *) AIEnter_MP_Respawn}

,
{
"AINode_MP_Stand", (byte *) AINode_MP_Stand}

,
{
"AIEnter_MP_Stand", (byte *) AIEnter_MP_Stand}

,
{
"AINode_MP_Observer", (byte *) AINode_MP_Observer}

,
{
"AIEnter_MP_Observer", (byte *) AIEnter_MP_Observer}

,
{
"AINode_MP_Intermission", (byte *) AINode_MP_Intermission}

,
{
"AIEnter_MP_Intermission", (byte *) AIEnter_MP_Intermission}

,
{
"BotMP_MoveToGoal", (byte *) BotMP_MoveToGoal}

,
{
"BotMP_FindGoal", (byte *) BotMP_FindGoal}

,
{
"BotMP_FindGoal_New", (byte *) BotMP_FindGoal_New}

,
{
"BotMP_AlreadyDoing_FastOut", (byte *) BotMP_AlreadyDoing_FastOut}

,
{
"BotMP_FindGoal_PostProcessGoal", (byte *) BotMP_FindGoal_PostProcessGoal}

,
{
"BotMP_FindGoal_ProcessGoal", (byte *) BotMP_FindGoal_ProcessGoal}

,
{
"BotMP_FindGoal_ClassForGoalType", (byte *) BotMP_FindGoal_ClassForGoalType}

,
{
"BotMP_FindGoals_Sort_CovertOps", (byte *) BotMP_FindGoals_Sort_CovertOps}

,
{
"BotMP_FindGoals_Sort_Engineer", (byte *) BotMP_FindGoals_Sort_Engineer}

,
{
"BotMP_FindGoals_Sort_Standard", (byte *) BotMP_FindGoals_Sort_Standard}

,
{
"BotMP_FindGoal_BuildGoalList", (byte *) BotMP_FindGoal_BuildGoalList}

,
{
"BotMP_CheckEmergencyGoals", (byte *) BotMP_CheckEmergencyGoals}

,
{
"BotMP_CheckClassActions", (byte *) BotMP_CheckClassActions}

,
{
"BotMatchMessage", (byte *) BotMatchMessage}

,
{
"BotMatch_Kill", (byte *) BotMatch_Kill}

,
{
"BotMatch_LeadTheWay", (byte *) BotMatch_LeadTheWay}

,
{
"BotMatch_WhereAreYou", (byte *) BotMatch_WhereAreYou}

,
{
"BotNearestVisibleItem", (byte *) BotNearestVisibleItem}

,
{
"BotMatch_WhatIsMyCommand", (byte *) BotMatch_WhatIsMyCommand}

,
{
"BotMatch_WhatAreYouDoing", (byte *) BotMatch_WhatAreYouDoing}

,
{
"BotMatch_WhoIsTeamLeader", (byte *) BotMatch_WhoIsTeamLeader}

,
{
"BotMatch_StopTeamLeaderShip", (byte *) BotMatch_StopTeamLeaderShip}

,
{
"BotMatch_StartTeamLeaderShip", (byte *) BotMatch_StartTeamLeaderShip}

,
{
"BotMatch_Dismiss", (byte *) BotMatch_Dismiss}

,
{
"BotMatch_FormationSpace", (byte *) BotMatch_FormationSpace}

,
{
"BotMatch_CheckPoint", (byte *) BotMatch_CheckPoint}

,
{
"BotMatch_WhichTeam", (byte *) BotMatch_WhichTeam}

,
{
"BotMatch_LeaveSubteam", (byte *) BotMatch_LeaveSubteam}

,
{
"BotMatch_JoinSubteam", (byte *) BotMatch_JoinSubteam}

,
{
"BotMatch_ReturnFlag", (byte *) BotMatch_ReturnFlag}

,
{
"BotMatch_RushBase", (byte *) BotMatch_RushBase}

,
{
"BotMatch_GetFlag", (byte *) BotMatch_GetFlag}

,
{
"BotMatch_Patrol", (byte *) BotMatch_Patrol}

,
{
"BotMatch_Camp", (byte *) BotMatch_Camp}

,
{
"BotMatch_GetItem", (byte *) BotMatch_GetItem}

,
{
"BotMatch_DefendKeyArea", (byte *) BotMatch_DefendKeyArea}

,
{
"BotMatch_HelpAccompany", (byte *) BotMatch_HelpAccompany}

,
{
"BotGPSToPosition", (byte *) BotGPSToPosition}

,
{
"BotAddressedToBot", (byte *) BotAddressedToBot}

,
{
"BotGetPatrolWaypoints", (byte *) BotGetPatrolWaypoints}

,
{
"NumPlayersOnSameTeam", (byte *) NumPlayersOnSameTeam}

,
{
"FindEnemyByName", (byte *) FindEnemyByName}

,
{
"FindClientByName", (byte *) FindClientByName}

,
{
"BotGetTime", (byte *) BotGetTime}

,
{
"BotGetMessageTeamGoal", (byte *) BotGetMessageTeamGoal}

,
{
"BotGetItemTeamGoal", (byte *) BotGetItemTeamGoal}

,
{
0, 0}
