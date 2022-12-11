
-- base_nailgun


function startup()

	-- limit to 2 teams
	SetPlayerLimit(Team.kBlue, 0)
    SetPlayerLimit(Team.kRed, 0)
    SetPlayerLimit(Team.kYellow, -1)
    SetPlayerLimit(Team.kGreen, -1)

	-- limit to scout only
	local team = GetTeam(Team.kBlue)
	team:SetClassLimit( Player.kScout, 0 )
	team:SetClassLimit( Player.kSniper, -1 )
	team:SetClassLimit( Player.kSoldier, -1 )
	team:SetClassLimit( Player.kDemoman, -1 )
	team:SetClassLimit( Player.kMedic, -1 )
	team:SetClassLimit( Player.kHwguy, -1 )
	team:SetClassLimit( Player.kPyro, -1 )
	team:SetClassLimit( Player.kSpy, -1 )
	team:SetClassLimit( Player.kEngineer, -1 )
	team:SetClassLimit( Player.kCivilian, -1 )
	
	team = GetTeam(Team.kRed)
	team:SetClassLimit( Player.kScout, 0 )
	team:SetClassLimit( Player.kSniper, -1 )
	team:SetClassLimit( Player.kSoldier, -1 )
	team:SetClassLimit( Player.kDemoman, -1 )
	team:SetClassLimit( Player.kMedic, -1 )
	team:SetClassLimit( Player.kHwguy, -1 )
	team:SetClassLimit( Player.kPyro, -1 )
	team:SetClassLimit( Player.kSpy, -1 )
	team:SetClassLimit( Player.kEngineer, -1 )
	team:SetClassLimit( Player.kCivilian, -1 )

end

function player_spawn(player_entity)
    local player = CastToPlayer(player_entity)
    player:RemoveWeapon("ff_weapon_shotgun")
end

function player_killed( player_id )
	-- kill = points
	if GetPlayerTeam( killer ) then
		if not ( GetPlayerTeam( player_id ) == GetPlayerTeam( killer ) ) then -- allah shall point to the killer
			AddTeamScore( GetPlayerTeam( killer ), 1 ) -- survival of the fittest
		end
	end
end

nail_trigger = trigger_ff_script:new({ })

function nail_trigger:ontrigger(player_entity)
    local player = CastToPlayer(player_entity)
    player:AddAmmo(Ammo.kNails, 100)
end

-- spawns
redspawn = { validspawn = redallowedmethod }
bluespawn = { validspawn = blueallowedmethod }
red_spawn = redspawn; blue_spawn = bluespawn;
blue_respawndoor = bluerespawndoor; red_respawndoor = redrespawndoor;

-- clips
clip_blue = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipPlayersByTeam, ClipFlags.kClipTeamRed, ClipFlags.kClipTeamYellow, ClipFlags.kClipTeamGreen, ClipFlags.kClipAllNonPlayers} })
clip_red = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipPlayersByTeam, ClipFlags.kClipTeamBlue, ClipFlags.kClipTeamYellow, ClipFlags.kClipTeamGreen, ClipFlags.kClipAllNonPlayers} })
clip_yellow = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipPlayersByTeam, ClipFlags.kClipTeamBlue, ClipFlags.kClipTeamRed, ClipFlags.kClipTeamGreen, ClipFlags.kClipAllNonPlayers} })
clip_green = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipPlayersByTeam, ClipFlags.kClipTeamBlue, ClipFlags.kClipTeamRed, ClipFlags.kClipTeamYellow, ClipFlags.kClipAllNonPlayers} })
block_buildables = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllBuildables, ClipFlags.kClipAllBuildableWeapons} })
block_buildablepathing = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllBuildables} })
block_buildableweapons = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllBuildableWeapons} })
block_spawnturrets = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllSpawnTurrets} })
block_nonplayers = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllNonPlayers} })
block_players = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllPlayers} })
block_backpacks = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllBackpacks} })
block_flags = trigger_ff_clip:new({ clipflags = {ClipFlags.kClipAllInfoScripts} })