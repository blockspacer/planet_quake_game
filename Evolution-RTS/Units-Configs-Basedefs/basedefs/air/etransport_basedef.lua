unitDef                    = {
	acceleration                 = 0.5,
	airStrafe                    = false,
	airHoverFactor	             = 0,
	brakeRate                    = 2,
	buildCostEnergy              = 0,
	buildCostMetal               = 60,
	builder                      = false,
	buildTime                    = 2.5,
	buildpic					 = "etransport.png",
	canAttack                    = false,
	canFly                       = true,
	canGuard                     = false,
	canMove                      = true,
	canload                      = true,
	canPatrol                    = false,
	canstop                      = "1",
	category                     = "ARMORED VTOL",
	collide                      = true,
	cruiseAlt                    = 110,
	description                  = [[Fast Armored Transport]],
	energyMake                   = 0,
	energyUse                    = 0,
	explodeAs                    = "mediumExplosionGenericPurple",
	fallSpeed                    = 1000,
	footprintX                   = 3,
	footprintZ                   = 3,
	hoverAttack                  = true,
	holdSteady                   = true,
	--  hoverAttack              = true,
	icontype                     = "etransport",
	maxDamage                    = 500,
	maxSlope                     = 90,
	maxVelocity                  = 7,
	verticalSpeed		         = 30,
	name                         = humanName,
	objectName                   = objectName,
	script			             = script,
	releaseHeld                  = true,
	repairable		             = false,
	selfDestructAs               = "mediumExplosionGenericPurple",
	side                         = "GD",
	sightDistance                = 500,
	smoothAnim                   = true,
	transportbyenemy             = false;
	transportCapacity            = 32,
	transportMass                = 10000,
	transportSize                = 8,
	transportUnloadMethod   	 = 0,
	fallSpeed 					 = 10,
	loadingRadius				 = 220, --float
	turnRate                     = 5000,
	unitname                     = unitName,
	upright						 = true,
	sfxtypes                     = { 
		pieceExplosionGenerators = { 
			"deathceg3", 
			"deathceg4", 
		}, 

		explosiongenerators      = {
			"custom:jethtrail",
			"custom:blacksmoke",
		},
	},
	sounds                       = {
		underattack              = "other/unitsunderattack1",
		ok                       = {
			"ack",
		},
		select                   = {
			"unitselect",
		},
	},
	customParams                 = {
		unittype				  = "mobile",
		--    needed_cover       = 2,
		isupgraded				 = isUpgraded,
		death_sounds             = "generic",
--		RequireTech              = tech,
		armortype                = armortype,
		--supply_cost              = supply,
		normaltex                = "unittextures/lego2skin_explorernormal.dds", 
		buckettex                = "unittextures/lego2skin_explorerbucket.dds",
		factionname	             = "ateran",
		corpse                   = "energycore",
	},
}
