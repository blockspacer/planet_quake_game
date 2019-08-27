
local scriptfile=nil
local tab_count=0

local function WriteString(str)
	scriptfile:write(str)
end

local function WriteEndLine()
	return WriteString("\r\n")
end

local function WriteTabbedLine(str)
	for tabs=1,tab_count do
		WriteString("\t")
	end
	WriteString(str)
	WriteEndLine()
end

local function WriteFieldName(str)
	for tabs=1,tab_count do
		WriteString("\t")
	end
	WriteString(str)
	WriteString("=")
end

local function WriteFieldValue(str)
	WriteString(str)
	WriteString(";")
	WriteEndLine()
end

local function WriteNumFieldValue(fieldvalue)
	WriteFieldValue(tostring(fieldvalue))
end

local function WriteField(fieldname,fieldvalue)
	WriteFieldName(fieldname)
	WriteFieldValue(fieldvalue)
end

local function WriteNumField(fieldname,fieldvalue)
	WriteFieldName(fieldname)
	WriteNumFieldValue(fieldvalue)
end

local function WriteFieldAndComment(fieldname,fieldvalue,comment)
	WriteFieldName(fieldname)
	WriteString(fieldvalue)
	WriteString(";// ")
	WriteString(comment)
	WriteEndLine()
end

local function WriteNumFieldAndComment(fieldname,fieldvalue,comment)
	WriteFieldAndComment(fieldname,fieldvalue,comment)
end

local function StartSubSection(str)
	for tabs=1,tab_count do
		WriteString("\t")
	end
	WriteString("[")
	WriteString(str)
	WriteString("]")
	WriteEndLine()
	WriteTabbedLine("{")
	tab_count=tab_count+1
end

local function EndSubSection()
	tab_count=tab_count-1
	WriteTabbedLine("}")
end


function WriteScript(GtW,ScriptFileName)

	scriptfile = io.open(ScriptFileName or ModSpecific.ScriptFileName,"wb")-- So the second argument of WriteScript(.,.) is optional

	tab_count=0

	WriteEndLine()
	WriteTabbedLine("// To run this script, drag and drop over "..ModSpecific.ExecutableFileName)
	WriteTabbedLine("//")
	WriteTabbedLine("// Generated by zwzsg's Lua code from "..Game.modName..":")
	WriteTabbedLine("// "..GtW.description)
	WriteTabbedLine("// "..Game.modShortName.." script written by \""..(widget or gadget):GetInfo().name.."\" "..((widget and "widget") or (gadget and "gadget") or "lua").." version "..((widget or gadget):GetInfo().version or "?"))
	WriteEndLine()

	StartSubSection("GAME")

	WriteField("GameType",ModSpecific.ModFileName)
	WriteField("Mapname",GtW.map.InternalFileName)
	WriteEndLine()

	-- List of modoptions
	StartSubSection("MODOPTIONS")
	WriteTabbedLine("// "..Game.modShortName.." specific:")
	for key,value in pairs(GtW.ModOptions) do
		local desc=nil
		if ModSpecific and ModSpecific.MultiplayerModOptions and ModSpecific.MultiplayerModOptions then
			for _,k in pairs(ModSpecific.MultiplayerModOptions) do
				if k.key==key and k.desc then
					desc=k.desc
				end
			end
		end
		if desc then
			WriteFieldAndComment(key,value,desc)
		else
			WriteField(key,value)
		end
	end
	if GtW.ModOptions.missionscript then
		WriteField("MissionScript",GtW.ModOptions.missionscript)
	end
	WriteEndLine()
	WriteTabbedLine("// Generic, may not apply to "..Game.modShortName..":")
	WriteNumField("GameMode",GtW.EndCondition)
	WriteTabbedLine("\t// 0 for \"Kill everything!\"")
	WriteTabbedLine("\t// 1 for \"Kill all commanding units!\"")
	WriteTabbedLine("\t// 2 for \"Kill the first unit!\"")
	WriteTabbedLine("\t// 3 for \"Never ends!\"")
	WriteField("ghostedbuildings","1")
	WriteField("fixedallies","0")
	WriteField("MaxUnits","512")
	WriteField("MinSpeed","0.1")
	WriteField("MaxSpeed","10")
	WriteField("StartMetal","1024")
	WriteField("StartEnergy","1024")
	--WriteField("LimitDGun","0")
	--WriteField("DiminishingMMs","0")
	WriteField("LauncherName",(widget or gadget):GetInfo().name.." "..((widget and "widget") or (gadget and "gadget") or "lua"))
	WriteField("LauncherVersion",(widget or gadget):GetInfo().version or "?")
	WriteField("DateTime",os.date("%A %d %B %Y at %X"))
	
	EndSubSection()
	WriteEndLine()

	if GtW.MapOptions then
		StartSubSection("MAPOPTIONS")
		for key,value in pairs(GtW.MapOptions) do
			WriteField(key,value)
		end
		EndSubSection()
		WriteEndLine()
	end

	WriteField("//HostIP","")-- Since 0.82.7 HostIP=localhost; makes Spring crash
	WriteField("HostPort","0")-- In 0.82.7 default port is 8452, which can only be used once!
	WriteField("IsHost","1")
	WriteEndLine()
	WriteFieldAndComment("StartPosType",(GtW.StartPosType or 0)>1 and "3" or "0","0 for fixed, 1 for random, 2 for chosen ingame, 3 for chosen out of game")
	WriteField("MyPlayerNum","0")
	WriteField("MyPlayerName",GtW.PlayerName)
	WriteNumField("NumPlayers",1)
	WriteNumField("NumUsers",#GtW.players)
	WriteNumField("NumTeams",#GtW.players)
	WriteField("NumAllyTeams","2")-- <- Uhoh, NOT!
	WriteEndLine()

	WriteTabbedLine("// List of human controlled players:")
	StartSubSection("PLAYER0")
	WriteField("name",GtW.PlayerName)
	WriteNumField("Team",(GtW.isSpeccing~=0 and 0 or GtW.PlayerTeamNum))
	WriteNumField("Spectator",GtW.isSpeccing)
	EndSubSection()
	WriteEndLine()

	WriteTabbedLine("// List of AI controlled players:")
	local friendcount,enemycout=0,0
	for p,_ in ipairs(GtW.players) do
		if p~=1+GtW.PlayerTeamNum or GtW.isSpeccing~=0 then
			StartSubSection("AI"..(p-1))
			local nick=GtW.players[p].aioverride or GtW.players[p].bot.ShortName
			if GtW.isSpeccing~=0 then
				friendcount=friendcount+1
				enemycout=enemycout+1
				WriteField("Name",nick.." #"..friendcount)
			elseif GtW.players[p].allyteam==GtW.players[1+GtW.PlayerTeamNum].allyteam then
				friendcount=friendcount+1
				WriteField("Name",nick.." (Friend #"..friendcount..")")
			else
				enemycout=enemycout+1
				WriteField("Name",nick.." (Enemy #"..enemycout..")")
			end
			if GtW.players[p].aioverride then
				WriteNumFieldAndComment("ShortName",GtW.players[p].bot.ShortName,"But will be overriden to \""..GtW.players[p].aioverride.."\"")
			else
				WriteNumField("ShortName",GtW.players[p].bot.ShortName)
			end
			WriteField("//Version","?")
			WriteNumField("Team",p-1)
			WriteNumFieldAndComment("Host",0,"Number of the PLAYER hosting the AI")
			EndSubSection()
		end
	end
	WriteEndLine()

	WriteTabbedLine("// List of \"teams\" (or \"players\" depending on terminology):")
	for p,teaminfo in ipairs(GtW.players) do
		StartSubSection("TEAM"..(p-1))
		WriteField("TeamLeader","0")
		WriteNumField("AllyTeam",teaminfo.allyteam)
		WriteField("Handicap","0")
		if teaminfo.noons then
			WriteNumFieldAndComment("noons",1,"No ONS for this player")
		end
		if teaminfo.sos then
			WriteNumFieldAndComment("sos",teaminfo.sos,"Save our Soul specific to this player")
		end
		WriteField("Side",teaminfo.faction.InternalName)
		WriteFieldName("RGBColor")
		-- sprintf(colorthing,"%.4f %.4f %.4f",(float)teaminfo->color[0]/255,(float)teaminfo->color[1]/255,(float)teaminfo->color[2]/255)
		WriteFieldValue(teaminfo.color[1].." "..teaminfo.color[2].." "..teaminfo.color[3])
		if p~=1+GtW.PlayerTeamNum or GtW.isSpeccing~=0 then
			WriteField("AIDLL",teaminfo.bot.ShortName)
		end
		if teaminfo.aioverride then
			WriteField("aioverride",teaminfo.aioverride)
		end
		if teaminfo.StartPosX and teaminfo.StartPosZ then
			WriteNumField("StartPosX",teaminfo.StartPosX)
			WriteNumField("StartPosZ",teaminfo.StartPosZ)
		end
		if GtW.players[p].ExtraDoubleCustomKeys then
			for _,key in ipairs(GtW.players[p].ExtraDoubleCustomKeys) do
				WriteField(key.name,key.value)
			end
		end
		EndSubSection()
	end
	WriteEndLine()

	WriteTabbedLine("// List of ally teams: This is for assymetrical alliances")
	maxallyteam=GetMaxAllyTeam(GtW.players)
	for at=0,maxallyteam do
		local nbrallies=0
		StartSubSection("ALLYTEAM"..at)
		for p,_ in ipairs(GtW.players) do
			if GtW.players[p].allyteam==at then
				nbrallies=nbrallies+1
			end
		end
		WriteNumField("NumAllies",0*nbrallies)
		EndSubSection()
	end
	WriteEndLine()

	WriteTabbedLine("// List of restrictions")
	WriteNumField("NumRestrictions",0)
	StartSubSection("RESTRICT")
	EndSubSection()

	if GtW.HeightMapV1 then
		WriteEndLine()
		WriteTabbedLine("// Heightmap:")
		WriteField("HeightMapV1",GtW.HeightMapV1)
	end

	EndSubSection()

	scriptfile:flush()
	scriptfile:close()

end


