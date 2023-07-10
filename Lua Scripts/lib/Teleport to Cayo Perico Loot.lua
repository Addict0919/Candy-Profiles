require("natives-1614644776")

local function teleport_player(x, y ,z)
    if PLAYER.IS_PLAYER_TELEPORT_ACTIVE() then
        PLAYER.STOP_PLAYER_TELEPORT()
    end
    PLAYER.START_PLAYER_TELEPORT(PLAYER.PLAYER_ID, x, y, z, 0, false, true, false)
    if PLAYER._HAS_PLAYER_TELEPORT_FINISHED(PLAYER.PLAYER_ID) then
        PLAYER.STOP_PLAYER_TELEPORT()
    end
end
local compound_list = menu.list(menu.my_root(), "Compound")
menu.action(compound_list, "El Rubio's Office", {}, "", function()
	teleport_player(5010.407227, -5752.104980, 28.840000)
end)
menu.action(compound_list, "Basement (Primary)", {}, "", function()
	teleport_player(5007.501953, -5755.193848, 15.484000)
end)
menu.action(compound_list, "Basement Storage (Secondary)", {}, "", function()
	teleport_player(4999.764160, -5749.863770, 14.840000)
end)
menu.action(compound_list, "North Storage", {}, "Open the door slightly then walk back in to load the interior", function()
	teleport_player(5079.8276, -5757.6455, 15.829647)
end)
menu.action(compound_list, "West Storage", {}, "Open the door slightly then walk back in to load the interior", function()
	teleport_player(5028.2734, -5734.967, 17.865585)
end)
menu.action(compound_list, "South Storage", {}, "Open the door slightly then walk back in to load the interior", function()
	teleport_player(5009.6895, -5785.3022, 17.831696)
end)
local island_list = menu.list(menu.my_root(), "Island")
local main_dock_list = menu.list(island_list, "Main Dock")
menu.action(main_dock_list, "Main Dock #1", {}, "", function()
	teleport_player(5193.909668, -5135.642578, 2.045917)
end)
menu.action(main_dock_list, "Main Dock #2", {}, "", function()
	teleport_player(4963.184570, -5108.933105, 1.670808)
end)
menu.action(main_dock_list, "Main Dock #3", {}, "", function()
	teleport_player(4998.709473, -5165.559570, 1.464137)
end)
menu.action(main_dock_list, "Main Dock #4", {}, "", function()
	teleport_player(4924.693359, -5243.244629, 1.223599)
end)
local north_dock_list = menu.list(island_list, "North Dock")
menu.action(north_dock_list, "North Dock #1", {}, "", function()
	teleport_player(5132.558594, -4612.922852, 1.162808)
end)
menu.action(north_dock_list, "North Dock #2", {}, "", function()
	teleport_player(5065.255371, -4591.706543, 1.555012)
end)
menu.action(north_dock_list, "North Dock #3", {}, "", function()
	teleport_player(5090.916016, -4682.670898, 1.107098)
end)
local airstrip_list = menu.list(island_list, "Airstrip")
menu.action(airstrip_list, "Airstrip #1", {}, "", function()
	teleport_player(4503.587402, -4555.740723, 2.854459)
end)
menu.action(airstrip_list, "Airstrip #2 (Hangar)", {}, "", function()
	teleport_player(4437.821777, -4447.841309, 3.028436)
end)
menu.action(airstrip_list, "Airstrip #3 (Hangar)", {}, "", function()
	teleport_player(4447.091797, -4442.184082, 5.936794)
end)
local crop_fields_list = menu.list(island_list, "Crop Fields")
menu.action(crop_fields_list, "Crop Fields #1", {}, "", function()
	teleport_player(5330.527, -5269.7515, 33.18603)
end)
while true do
	util.yield()
end