/obj/item/weapon/gun/grenadelauncher
	name = "grenade launcher"
	desc = "Well it's a gun... That shoots grenades."
	icon = 'icons/obj/gun.dmi'
	icon_state = "grenade"
	item_state = "riotgun"
	w_class = 4.0
	throw_speed = 2
	throw_range = 7
	force = 5.0
	var/list/grenades = new/list()
	var/max_grenades = 3
	m_amt = 2000

	examine()
		set src in view()
		..()
		if(!(usr in view(2)) && usr != loc)
			return
		usr << "[grenades] / [max_grenades] grenades."

	attackby(obj/item/I as obj, mob/user as mob)

		if((istype(I, /obj/item/weapon/grenade)))
			if(grenades.len < max_grenades)
				user.drop_item()
				I.loc = src
				grenades += I
				user << "\blue You put the grenade in the grenade launcher."
				user << "\blue [grenades.len] / [max_grenades] Grenades."
			else
				usr << "\red The grenade launcher cannot hold more grenades."

	afterattack(obj/target, mob/user , flag)

		if (istype(target, /obj/item/weapon/storage/backpack ))
			return

		else if (locate (/obj/structure/table, src.loc))
			return

		else if(target == user)
			return

		if(grenades.len)
			spawn(0) fire_grenade(target,user)
		else
			usr << "\red The grenade launcher is empty."

	proc
		fire_grenade(atom/target, mob/user)
			for(var/mob/O in viewers(world.view, user))
				O.show_message(text("\red [] fired a grenade!", user), 1)
			user << "\red You fire the grenade launcher!"
			var/obj/item/weapon/grenade/chem_grenade/F = grenades[1] //Now with less copypasta!
			grenades -= F
			F.loc = user.loc
			F.throw_at(target, 30, 2)
			message_admins("[key_name_admin(user)] fired a grenade ([F.name]) from a grenade launcher ([src.name]).")
			log_game("[key_name(user)] fired a grenade ([F.name]) from a grenade launcher ([src.name]).")
			F.active = 1
			F.icon_state = icon_state + "_active"
			playsound(F.loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)
			spawn(10)
				F.prime()