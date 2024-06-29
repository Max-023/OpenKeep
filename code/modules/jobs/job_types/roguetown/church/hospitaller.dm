//shield flail or longsword, tief can be this with red cross

/datum/job/roguetown/templar
	title = "Hospitaller"
	flag = MONK
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "Paladin are former noblemen and clerics who have dedicated themselves to great combat prowess. Often, they were promised redemption for past sins if they crusaded in the name of the gods."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Tiefling",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/templar
	total_positions = 1
	spawn_positions = 1
	allowed_patrons = list(/datum/patron/divine/astrata)
	min_pq = 2
	display_order = JDO_HOSPITALLER
	give_bank_account = TRUE
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/templar/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	belt = /obj/item/storage/belt/rogue/leather/hand
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/clothing/ring/silver
	cloak = /obj/item/clothing/cloak/stabard/crusader/t
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		backl = /obj/item/rogueweapon/sword/long
		H.change_stat("strength", 2)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/churn)
	if(H.dna?.species)
		if(H.dna.species.id == "human")
			H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
		if(H.dna.species.id == "tiefling")
			cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	C.holder_mob = H
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal/)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/churn)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
