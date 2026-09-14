/datum/species/sanshyuum
	group = SPECIES_SANSHYUUM
	name = "San'Shyuum"
	name_plural = "San'Shyuum"
	mob_flags = KNOWS_TECHNOLOGY
	uses_skin_color = TRUE
	flags = HAS_HARDCRIT|HAS_SKIN_COLOR|SPECIAL_BONEBREAK|NO_SHRAPNEL
	mob_inherent_traits = list(
		TRAIT_COV_TECH,
		TRAIT_FOREIGN_BIO,
		TRAIT_LEADERSHIP,
	)
	unarmed_type = /datum/unarmed_attack/punch/unggoy
	pain_type = /datum/pain/ruuhtian
	blood_color = BLOOD_COLOR_HUMAN
	flesh_color = "#4d4b46"

	total_health = 100
	burn_mod = 1.2
	brute_mod = 1.5
	slowdown = -0.2

