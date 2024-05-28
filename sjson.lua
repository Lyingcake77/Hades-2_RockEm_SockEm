TraitSetData.Aspects = {
    DaggerDodgeAspect = 
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		Icon = "Hammer_Daggers_14",
		RequiredWeapon = "WeaponDagger",
		WeaponKitGrannyModel = "WeaponDaggerMultiple_Ali_Mesh",
		ReplacementGrannyModels = 
		{
			WeaponDaggerA_Mesh = "WeaponDaggerA_Ali_Mesh",
			WeaponDaggerB_Mesh = "WeaponDaggerB_Ali_Mesh"
			},
		PriorityDisplay = true,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 1.5
			},
			Epic =
			{
				Multiplier = 2.0
			},
			Heroic =
			{
				Multiplier = 2.5
			},
			Legendary =
			{
				Multiplier = 3.0
			},
			Perfect =
			{
				Multiplier = 3.5,
			},
		},
		PriorityDisplay = true,
		AddOutgoingCritModifiers =
		{
			ValidVolleyChance = 0.5,
			ReportValues = { ReportedChance = "ValidVolleyChance"},
		},
		SetupFunction =
		{
			Threaded = true,
			Name = "DaggerBlockSetup",
		},
		OnProjectileDeathFunction = 
		{
			Name = "RemoveCritVolley",
		},
		OnWeaponChargeFunctions = 
		{
			ValidWeapons = {"WeaponDagger5"},
			FunctionName = "CheckDaggerBlock",
			FunctionArgs = 
			{
				Cooldown = 15,
				CritCount = 9,
				InvulnerableEffectName = "DaggerBlockInvincibubble",
				InvulnerableDuration = 1,
				Vfx = "EurydiceDefenseFront",
				ActivatedVfx = "DaggerBlockActiveFx",
				ReportValues = 
				{ 
					ReportedCooldown = "Cooldown",
					ReportedHits = "CritCount",
					ReportedDuration = "InvulnerableDuration",
					ReportedSpeedIncrease = "ExAttackSpeed",
				},
			}
		},
		OnWeaponFiredFunctions = 
		{
			ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			FunctionName = "CheckDaggerCritCharges",
		},
		WeaponSpeedMultiplier = 
		{
		
			WeaponNames = {"WeaponDagger5"},
			Value = 
			{
				BaseValue = 0.80,
				SourceIsMultiplier = true,
			},
			ReportValues = { ReportedSpeedIncrease = "Value" }
		},
		PropertyChanges = 
		{
			{
				WeaponNames = {"WeaponDagger5"},
				BaseValue = 0.80,
				SourceIsMultiplier = true,
				SpeedPropertyChanges = true,
			}
		},
		StatLines = 
		{
			"EXAttackSpeedStatDisplay",
		},
		ExtractValues =
		{
			{
				Key = "ReportedSpeedIncrease",
				ExtractAs = "SpeedIncrease",
				Format = "NegativePercentDelta"
			},
			{
				Key = "ReportedCooldown",
				ExtractAs = "Cooldown",
				SkipAutoExtract = true,
			},
			{
				Key = "ReportedHits",
				ExtractAs = "Duration",
				SkipAutoExtract = true,
			},
			{
				Key = "ReportedDuration",
				ExtractAs = "InvulnerableDuration",
				SkipAutoExtract = true,
			},
			{
				Key = "ReportedChance",
				ExtractAs = "CritChance",
				SkipAutoExtract = true,
				Format = "Percent",
			},
		},
		FlavorText = "DaggerBlockAspect_FlavorText",
	},
}
-- OverwriteTableKeys( TraitData, TraitSetData.Aspects )