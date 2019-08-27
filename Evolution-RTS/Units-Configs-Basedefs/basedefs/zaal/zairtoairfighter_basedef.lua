unitDef                    = {
	acceleration                 = 1,
	airStrafe                    = false,
	airHoverFactor				 = 0,
	brakeRate                    = 1,
	buildCostEnergy              = 0,
	buildCostMetal               = 30,
	buildTime                    = 2.5,
	buildpic					 = "zaal_unitpics/zairtoairfighter.png",
	canAttack                    = true,
	canFly                       = true,
	canGuard                     = true,
	canLoopbackAttack            = true,
	canMove                      = true,
	canPatrol                    = true,
	canstop                      = true,
	category                     = "LIGHT VTOL",
	collide                      = true,
	cruiseAlt                    = 140,
	description                  = [[Air Superiority]],
	energyMake                   = 0,
	energyStorage                = 0,
	energyUse                    = 0,
	explodeAs                    = "BUG_DEATH_MEDIUM",
	floater                      = true,
	footprintX                   = 3,
	footprintZ                   = 3,
	hoverAttack                  = false,
	iconType                     = "zairtoairfighter",
	idleAutoHeal                 = 2.5,
	idleTime                     = 5,
	maxacc						 = 1,
	maxDamage                    = 812,
	maxSlope                     = 90,
	maxVelocity                  = 20,
	maxWaterDepth                = 255,
	metalStorage                 = 0,
	moverate1                    = "8",
	name                         = humanName,
	objectName                   = objectName,
	script			             = script,
	radarDistance                = 0,
	repairable		             = false,
	selfDestructAs               = "BUG_DEATH_MEDIUM",
	side                         = "ARM",
	sightDistance                = 1000,
	smoothAnim                   = true,
	sonarDistance                = 0,
	transportbyenemy             = false;
	turnRate                     = 5000,
	turnradius					 = 250,
	unitname                     = unitName,
	upright						 = true,
	sfxtypes                     = { 
		pieceExplosionGenerators = { 
			"blood_spray", 
		}, 

		explosiongenerators      = {
			"custom:blood_spray",
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
	weapons                      = {
		[1]                      = {
			onlytargetcategory = "VTOL",
			def = "WEAPON",
			maindir = "0 0 1",
			maxangledif = 90,
		},
	},
	customParams                 = {
		unittype				 = "mobile",
		--    needed_cover       = 2,
		death_sounds             = "bug",
		RequireTech              = tech,
		armortype                = armortype,
		nofriendlyfire	         = "1",
		supply_cost              = supply,
		factionname	             = "zaal",
		corpse                   = "energycore",
		normaltex 				 = "unittextures/z_normals.dds", 
		retreatRangeDAI			 = 0,
	},
}

weaponDefs                 = {
	weapon = {
		interceptedByShieldType  = 4,
		areaofeffect 			 = 32,
		avoidFriendly			 = false,
		avoidFeature			 = false,
		collideFriendly			 = false,
		collideFeature			 = false,
		cegTag                   = "zaalspiketrail-optimized",
		burnblow 				 = true,
		craterboost 			 = 0,
		cratermult 				 = 0,
		edgeeffectiveness 		 = 0,
		explosiongenerator 		 = "custom:chickenspike-large-sparks-burn",
		impulseboost 			 = 1,
		impulsefactor 			 = 1,
		interceptedbyshieldtype  = 4,
		model 					 = "ChickenDefenseModels/spike.s3o",
		name 					 = "Spike",
		noselfdamage 			 = true,
		predictboost 			 = 1,
		range 					 = 600,
		reloadtime 				 = 1,
		smoketrail 				 = true,
		soundstart 				 = "ChickenDefenseSounds/talonattack",
		startvelocity 			 = 600,
		texture1 				 = "",
		texture2 				 = "sporetrail",
		turret 					 = true,
		weaponacceleration 		 = 250,
		weapontimer 			 = 1,
		weaponvelocity 			 = 1000,
		customparams             = {
			damagetype		     = "default",
			nofriendlyfire	     = 1,
		},    
		damage = {
			default 			 = 200,
		},
	}, 
}