unitDef                    = {
	acceleration                 = 1,
	brakeRate                    = 0.1,
	buildCostEnergy              = 0,
	buildCostMetal               = 42,
	builder                      = false,
	buildTime                    = 5,
	buildpic					 = "eamphibneedle.png",
	canAttack                    = true,
	
	canGuard                     = true,
	canMove                      = true,
	canPatrol                    = true,
	canstop                      = "1",
	category                     = "LIGHT AMPHIB RAID",
	description                  = [[Light Tank Destroyer]],
	energyMake                   = 0,
	energyStorage                = 0,
	energyUse                    = 0,
	explodeAs                    = "mediumExplosionGenericPurple",
	footprintX                   = 4,
	footprintZ                   = 4,
	iconType                     = "td_lit_lit",
	idleAutoHeal                 = .5,
	idleTime                     = 2200,
	leaveTracks                  = false,
	maxDamage                    = 340,
	maxSlope                     = 28,
	maxVelocity                  = 6,
	maxReverseVelocity           = 2,
	maxWaterDepth                = 5000,
	metalStorage                 = 0,
	movementClass                = "TANK4",
	name                         = humanName,
	objectName                   = objectName,
	script			             = script,
	radarDistance                = 0,
	repairable		             = false,
	selfDestructAs               = "mediumExplosionGenericPurple",
	sightDistance                = 400,
	sonarDistance                = 400,
	stealth			             = true,
	seismicSignature             = 2,
	sonarStealth		         = false,
	smoothAnim                   = true,
	transportbyenemy             = false;
	--  turnInPlace              = false,
	--  turnInPlaceSpeedLimit    = 6.0,
	turnInPlace                  = true,
	turnRate                     = 5000,
	--  turnrate                 = 475,
	unitname                     = unitNeedle,
	workerTime                   = 0,

	sfxtypes                     = { 
		pieceExplosionGenerators = { 
			"deathceg3", 
			"deathceg4", 
		}, 

		explosiongenerators      = {
			"custom:gdhcannon",
			"custom:dirt",
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
	weapons                      = {
		[1]                      = {
			def                  = "medtankbeamlaser",
			badTargetCategory    = "BUILDING WALL",
		},
	},
	customParams                 = {
		isupgraded			  	 = isUpgraded,
		unittype				 = "mobile",
		canbetransported 		 = "true",
		needed_cover             = 2,
		death_sounds             = "generic",
		RequireTech              = tech,
		armortype                = "light",
		nofriendlyfire	         = "1",
		supply_cost              = supply,
		normaltex               = "unittextures/lego2skin_explorernormal.dds", 
		buckettex                = "unittextures/lego2skin_explorerbucket.dds",
		factionname	             = "ateran",
		corpse                   = "energycore",
	},
}

weaponDefs                 = {

	medtankbeamlaser             = {
		AreaOfEffect             = 0,
		avoidFeature             = false,
		avoidFriendly            = false,
		beamTime                 = 0.1,
		collideFeature           = false,
		collideFriendly          = false,
		coreThickness            = 0.2,
		duration                 = 0.1,
		energypershot            = 0,
		explosionGenerator       = "custom:genericshellexplosion-medium-sparks-burn",
		fallOffRate              = 1,
		fireStarter              = 50,
		interceptedByShieldType  = 4,
		impulsefactor		     = 0,
		
		largebeamlaser	         = true,
		laserflaresize 	         = 5,
		leadlimit			     = 15,
		minintensity             = 1,
		name                     = "Laser",
		range                    = 400,
		reloadtime               = 0.1,
		WeaponType               = "BeamLaser",
		rgbColor                 = "0.25 0 0.6",
		rgbColor2                = "0.8 0.8 0.8",
		soundTrigger             = true,
		soundstart               = "weapons/plasma2.wav",
		--	soundHit		     = "weapons/amphibmedtankshothit.wav",
		scrollspeed		         = 5,
		texture1                 = "lightning",
		texture2                 = "laserend",
		thickness                = 10,
		tolerance                = 3000,
		turret                   = true,
		weaponVelocity           = 1000,
		waterweapon		         = true,
		customparams             = {
			isupgraded			 = isUpgraded,
			damagetype		     = "eamphibneedle",  
		}, 
		damage                   = {
			default              = 20, -- multiply * 1.2 for correct dps output
		},
	},
}
