////////////////////////big fat WIP for Genestealer cult game mode - lots of errors and stuff to define - Wel Ard
/*
/datum/game_mode
	var/list/datum/mind/Genestealer = list()

var/list/possible_changeling_IDs = list("Mindbender", "The Corrupter", "Mephila", "Devourer", "Consumer", "RNA")



/datum/game_mode/Genestealer
	name = "Genestealer Cult"
	config_tag = "gcult"
	required_players = 15 // 20 players - 5 players to be the nuke ops = 15 players remaining
	required_enemies = 3
	recommended_enemies = 5
	restricted_jobs = list("AI", "Servitor", "Undercover Goose")
	protected_jobs = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain")
	pre_setup_before_jobs = 1
	antag_flag = BE_OPERATIVE

/datum/game_mode/Genestealer/announce()
	world << "<b>The current game mode is - COMPLETELY SECRET!</b>"
	world << "<b>There is something going on but we're not telling you about it! MAHAHAHAHAHA!!</b>"

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
	if(config.protect_roles_from_antagonist)
		restricted_jobs += protected_jobs
	var/num_genestealers = 2
	if(config.genestealer_scaling_coeff)
		num_genesteaeler = max(1, round((num_players())/(config.genestealer_scaling_coeff)))
	else
		num_genestealer = max(1, min(num_players(), genestealer_amount))

	for(var/datum/mind/player in antag_candidates)
		for(var/job in restricted_jobs)//Removing robots from the list
			if(player.assigned_role == job)
				antag_candidates -= player

	if(antag_candidates.len>0)
		for(var/i = 0, i < num_changelings, i++)
			if(!antag_candidates.len) break
			var/datum/mind/changeling = pick(antag_candidates)
			antag_candidates -= changeling
			changelings += changeling
			modePlayer += changelings
		return 1
	else
		return 0
/datum/game_mode/changeling/post_setup()
	for(var/datum/mind/genestealer in genestealers)
		log_game("[genestealer.key] (ckey) has been selected as a genestealer")
		changeling.current.make_genestealer()
		changeling.special_role = "Genestealer"
		forge_genestealer_objectives(Genestealer)
		greet_genestealer(genestealer)

	spawn (rand(waittime_l, waittime_h))
		send_intercept()
	..()
	return
/datum/game_mode/proc/forge_genestealer_objectives(var/datum/mind/genestealer)
    
/datum/game_mode/proc/forge_genestealer_objectives(var/datum/mind/gcult_mind)
	var/list/heads = get_living_heads()
	for(var/datum/mind/head_mind in heads)
		var/datum/objective/mutiny/gcult_obj = new
		gcult_obj.owner = gcult_mind
		gcult_obj.target = head_mind
		gcult_obj.explanation_text = "Convert [head_mind.name], the [head_mind.assigned_role]."
		gcult_mind.objectives += gcult_obj

/datum/game_mode/proc/greet_genestealer(var/datum/mind/rev_mind, var/you_are=1)
	var/obj_count = 1
	if (you_are)
		rev_mind.current << "\red <FONT size = 3><B>You are a genestealer, an elite infiltrator of the Tyranid Hivemind</B></FONT>"
	for(var/datum/objective/objective in gcult_mind.objectives)
		rev_mind.current << "<B>Objective #[obj_count]</B>: [objective.explanation_text]"
		rev_mind.special_role = "Genestealer"
		obj_count++
	return
////////////////////////////////////////////////////////////////////////////////////////
//////////////Time to see if I can make genestealer spawn in at start//////////////////
///////////////////////////////////////////////////////////////////////////////////////
/datum/game_mode/proc/equip_genestealer(mob/living/carbon/alien/humanoid/tyranid/genestealer)

///////////////////////////////now onto converting
/datum/game_mode/proc/add_cultist(datum/mind/gcult_mind)
	if(gcult_mind.assigned_role in command_positions)
		return 0
	var/mob/living/carbon/human/H = gcult_mind.current//Check to see if the potential cultist is implanted
	if(isloyal(H))
		return 0
	if((gcult_mind in genestealers) || (gcult_mind in genestealers))
		return 0
	genestealers += gcult_mind
	gcult_mind.current << "\red <FONT size = 3> You are now a a slave to the Tyranid Hivemind., Help your cause. Do not harm your fellow cultists or the tyranids. You can identify your comrades by the red \"Tyranid\" icon. Help them convert the station and summon the hive.</FONT>"
	gcult_mind.current.attack_log += "\[[time_stamp()]\] <font color='red'>Has been converted to the cult!</font>"
	gcult_mind.special_role = "Genestealer Cultist"
	update_rev_icons_added(gcult_mind)
	return 1

///////////////////////////check victory
/datum/game_mode/Genestealer/proc/check_gcult_victory()
	for(var/datum/mind/gcult_mind in genestealers)
		for(var/datum/objective/mutiny/objective in gcult_mind.objectives)
			if(!(objective.check_completion()))
				return 0

		return 1
        */