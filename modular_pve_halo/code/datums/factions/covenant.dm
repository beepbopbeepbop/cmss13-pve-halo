#define COV_MINOR_RANKS list(PAY_SHORT_COV_1, PAY_SHORT_COV_2, PAY_SHORT_COV_3, PAY_SHORT_COV_S1, PAY_SHORT_COV_S2, PAY_SHORT_COV_S3)
#define COV_MAJOR_RANKS list(PAY_SHORT_COV_4, PAY_SHORT_COV_5, PAY_SHORT_COV_6, PAY_SHORT_COV_S4, PAY_SHORT_COV_S5, PAY_SHORT_COV_S6)

/datum/faction/covenant
	name = "Covenant"
	faction_tag = FACTION_COVENANT

/datum/faction/covenant/modify_hud_holder(image/holder, mob/living/carbon/human/current_human)
	// code
	var/datum/squad/squad = current_human.assigned_squad
	var/job_role
	var/rank
	var/obj/item/card/id/id_card = current_human.get_idcard()
	var/icon_file = 'icons/halo/mob/hud/covenant_hud.dmi'

	// icons
	var/hud_icon
	var/outline_icon
	var/job_icon

	var/bauble
	var/extra_1
	var/extra_2
	var/extra_3

	if(istype(squad))
		if(current_human.job)
			job_role = current_human.job
		else if(id_card)
			job_role = id_card.rank
		if(id_card)
			rank = id_card.paygrade
		hud_icon = "hudlance"
		var/squad_color = current_human.assigned_squad.equipment_color

		if(rank in COV_MINOR_RANKS)
			outline_icon = "minor"
			if(rank == PAY_SHORT_COV_2 || rank == PAY_SHORT_COV_S2)
				extra_1 = "minor_2"
			if(rank == PAY_SHORT_COV_3 || rank == PAY_SHORT_COV_S3)
				extra_1 = "minor_2"
				extra_2 = "minor_3"

		if(rank in COV_MAJOR_RANKS)
			outline_icon = "major"
			if(rank == PAY_SHORT_COV_5 || rank == PAY_SHORT_COV_S5)
				extra_1 = "major_2"
			if(rank == PAY_SHORT_COV_6 || rank == PAY_SHORT_COV_S6)
				extra_1 = "major_2"
				extra_2 = "major_3"

		if(rank == PAY_SHORT_COV_U1)
			outline_icon = "ultra"
			hud_icon = "hudevocati"
			bauble = "bauble_ultra"


		switch(GET_DEFAULT_ROLE(job_role))
			if(JOB_COV_LANCE_LEADER)
				job_icon = "hudlance_leader"
			if(JOB_COV_LANCE_ULTRA)
				job_icon = "hudlance_evocati"
			if(JOB_COV_LANCE_OBEDIENTARY)
				job_icon = "hudlance_obedientary"
			if(JOB_COV_LANCE_SPECIALIST)
				job_icon = "hudlance_specialist"

		if(squad.squad_leader == current_human)
			current_human.langchat_styles = "langchat_bolded" // bold text for bold leaders
		else if(squad.fireteam_leaders["SQ1"] == current_human || squad.fireteam_leaders["SQ2"] == current_human || squad.fireteam_leaders["SQ3"] == current_human || squad.fireteam_leaders["SQ4"] == current_human)
			current_human.langchat_styles = "langchat_smaller_bolded"
		else
			current_human.langchat_styles = initial(current_human.langchat_styles)
		current_human.langchat_color = current_human.assigned_squad.chat_color

		if(!job_icon)
			job_icon = current_human.rank_fallback
		if(hud_icon)
			var/image/hud_image = image(icon_file, current_human, hud_icon)
			if(squad_color)
				hud_image.color = squad_color
			else
				hud_image.color = "#5A934A"
			holder.overlays += hud_image
		if(outline_icon)
			var/image/outline_image = image(icon_file, current_human, outline_icon)
			holder.overlays += outline_image
		if(job_icon)
			var/image/job_image = image(icon_file, current_human, job_icon)
			holder.overlays += job_image
		if(bauble)
			var/image/bauble_image = image(icon_file, current_human, bauble)
			holder.overlays += bauble_image
		if(extra_1)
			var/image/extra_1_image = image(icon_file, current_human, extra_1)
			holder.overlays += extra_1_image
		if(extra_2)
			var/image/extra_2_image = image(icon_file, current_human, extra_2)
			holder.overlays += extra_2_image
		if(extra_3)
			var/image/extra_3_image = image(icon_file, current_human, extra_3)
			holder.overlays += extra_3_image
		if(current_human.assigned_squad && current_human.assigned_fireteam)
			var/image/fireteam_image = image(icon_file, current_human, "levy_[current_human.assigned_fireteam]")
			if(squad_color)
				fireteam_image.color = squad_color
			else
				fireteam_image.color = "#5A934A"
			holder.overlays += fireteam_image
			if(current_human.assigned_squad.fireteam_leaders[current_human.assigned_fireteam] == current_human)
				var/image/ftl_image = image(icon_file, current_human, "levy_FTL")
				holder.overlays += ftl_image
		holder.mouse_opacity = 0
