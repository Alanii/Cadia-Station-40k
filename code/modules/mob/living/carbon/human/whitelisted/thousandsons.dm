
/*
Thousand Sons
*/

/mob/living/carbon/human/whitelisted/ksons/leader
	name = "Akmhenhut, the Victorious Curse"
	real_name = "Akmhenhut, the Victorious Curse"
	universal_speak = 1
	gender = "male"
	status_flags = 0

/mob/living/carbon/human/whitelisted/ksons/leader/New()
	..()

	var/obj/item/device/radio/headset/R = new /obj/item/device/radio/headset/headset_cent
	R.set_frequency(1479)
	equip_to_slot_or_del(R, slot_ears)
	equip_to_slot_or_del(new /obj/item/clothing/under/color/black, slot_w_uniform)
	equip_to_slot_or_del(new /obj/item/clothing/suit/armor/thousandarmor/captain, slot_wear_suit)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/ksons, slot_shoes)
	equip_to_slot_or_del(new /obj/item/clothing/gloves/ksons, slot_gloves)
	equip_to_slot_or_del(new /obj/item/clothing/glasses/night, slot_glasses)
	equip_to_slot_or_del(new /obj/item/clothing/mask/breath/marine, slot_wear_mask)
	equip_to_slot_or_del(new /obj/item/clothing/head/helmet/ksonshelmet, slot_head)
	equip_to_slot_or_del(new /obj/item/weapon/chainsword/ksons_chainsword, slot_belt)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag/inf, slot_r_store)
	equip_to_slot_or_del(new /obj/item/weapon/tank/oxygen/ksons, slot_back)
	equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bolter/chaos/ksons, slot_s_store)
	equip_to_slot_or_del(new /obj/item/weapon/shield/riot/ksons, slot_l_hand)
	verbs += /mob/living/carbon/human/whitelisted/proc/ksonspell

/mob/living/carbon/human/whitelisted/ksons
	name = "Unknown"
	real_name = "Unknown"
	universal_speak = 1
	gender = "male"
	maxHealth = 250
	health = 250
	status_flags = 0

/mob/living/carbon/human/whitelisted/ksons/New()
	..()
	var/obj/item/device/radio/headset/R = new /obj/item/device/radio/headset/headset_cent
	R.set_frequency(1479)
	equip_to_slot_or_del(R, slot_ears)
	equip_to_slot_or_del(new /obj/item/clothing/under/color/black, slot_w_uniform)
	equip_to_slot_or_del(new /obj/item/clothing/suit/armor/thousandarmor/sorc, slot_wear_suit)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/ksons, slot_shoes)
	equip_to_slot_or_del(new /obj/item/clothing/gloves/ksons, slot_gloves)
	equip_to_slot_or_del(new /obj/item/clothing/glasses/night, slot_glasses)
	equip_to_slot_or_del(new /obj/item/clothing/mask/breath/marine, slot_wear_mask)
	equip_to_slot_or_del(new /obj/item/clothing/head/helmet/ksonshelmet, slot_head)
	equip_to_slot_or_del(new /obj/item/weapon/chainsword/ksons_chainsword, slot_belt)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag/inf, slot_r_store)
	equip_to_slot_or_del(new /obj/item/weapon/tank/oxygen/ksons, slot_back)
	equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bolter/chaos/ksons, slot_s_store)
	equip_to_slot_or_del(new /obj/item/weapon/shield/riot/ksons, slot_l_hand)
	verbs += /mob/living/carbon/human/whitelisted/proc/ksonspell


	var/namelist = list ("Si'ryon", "Azugar", "Ereraz", "Elatoth", "Caorpudaran", "Guralock", "Jirah", "Furrulak", "Lostix", "Honnux", "Guragar", "Furfar", "Zydire", "Nazustix", "Buldaban", "Davrhaz", "Nazuphus", "Madaran")
	var/rndname = pick(namelist)

	name = "[rndname] the Enlightened"
	real_name = "[rndname] the Enlightened"
	regenerate_icons()
	rename_self("[name]")



/mob/living/carbon/human/whitelisted/ksons/Life()
	..()
	var/mob/living/carbon/C = src
	if(iscarbon(src))
		C.handcuffed = initial(C.handcuffed)
		if(!stat)
			C.heal_organ_damage(1,1)

	for(var/datum/reagent/R in C.reagents.reagent_list)
		C.reagents.clear_reagents()



/mob/living/carbon/human/whitelisted/ksons/death(gibbed)
	mind.spell_list = list()
	verbs.Remove(/mob/living/carbon/human/whitelisted/proc/ksonspell)
	..()

/*
Spell verb
*/

/mob/living/carbon/human/whitelisted/proc/ksonspell()
	set category = "Spells"
	set name = "Recieve the gifts of Tzeentch"
	set desc = "This will give you spells"
	//set src in usr


	var/offensivespellchoice = input("Select an offensive spell.","Offensive Spell") as null|anything in list("Fireball", "Blind", "Magic Missile")
	switch(offensivespellchoice)
		if("Fireball")
			mind.spell_list += new /obj/effect/proc_holder/spell/dumbfire/fireball(null)

		if ("Blind")
			mind.spell_list += new /obj/effect/proc_holder/spell/targeted/trigger/blind

		if ("Magic Missile")
			mind.spell_list += new /obj/effect/proc_holder/spell/targeted/projectile/magic_missile




	var/utilityspellchoice = input("Select an additional utility spell.","Utility Spell") as null|anything in list("Knock", "Conjure Cult Floor", "Forcewall", "Blink")
	switch(utilityspellchoice)
		if("Knock")
			mind.spell_list += new /obj/effect/proc_holder/spell/aoe_turf/knock(null)

		if ("Conjure Cult Floor")
			mind.spell_list += new /obj/effect/proc_holder/spell/aoe_turf/conjure/floor(null)

		if ("Forcewall")
			mind.spell_list += new /obj/effect/proc_holder/spell/aoe_turf/conjure/lesserforcewall(null)


		if ("Blink")
			mind.spell_list += new /obj/effect/proc_holder/spell/targeted/turf_teleport/blink



	verbs -= /mob/living/carbon/human/whitelisted/proc/ksonspell
