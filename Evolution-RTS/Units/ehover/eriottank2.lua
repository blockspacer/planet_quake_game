-- UNITDEF -- ERIOTTANK2 --
--------------------------------------------------------------------------------

unitName = "eriottank2"

--------------------------------------------------------------------------------

isUpgraded	= [[0]]

humanName = "Spas"

objectName = "eriottank3.s3o"
script = "eriottank3.cob"

tech = [[tech1]]
armortype = [[light]]
supply = [[3]]


VFS.Include("units-configs-basedefs/basedefs/hover/eriottank2_basedef.lua")

unitDef.weaponDefs = weaponDefs--------------------------------------------------------------------------------

return lowerkeys({ [unitName]    = unitDef })

--------------------------------------------------------------------------------
