-- Cherax custom speedometer by CocoW#6969 v0.3

require("natives-1606100775")
local sp_bg_tex_name = "chx_spc.png" --default speedometer look
local sp_pin_tex_name = "chxs_pin_spc.png" --default pin speedometer look
local sp_bg_tex = directx.create_texture(filesystem.scripts_dir()..sp_bg_tex_name) 
local sp_pin_tex = directx.create_texture(filesystem.scripts_dir()..sp_pin_tex_name) 

--Default color background
local sp_colour = {				
			["r"] = 0.9,
			["g"] = 0.9,
			["b"] = 0.9,
			["a"] = 1.0
		}
--Default text color
local txt_colour = {				
			["r"] = 1.0,
			["g"] = 1.0,
			["b"] = 1.0,
			["a"] = 1.0
		}


--default speedometer pos
local sp_posX = 0.93
local sp_posY = 0.88

GenerateFeatures = function()

menu.divider(menu.my_root(), "Speedometer options")
menu.toggle(menu.my_root(),"Change speedometer look", {"splook"}, "Change speedometer look to either normal or need for speedometer",function(pog)	
	if pog then
		sp_bg_tex_name = "chx_spc2.png"
		sp_pin_tex_name = "chxs_pin_spc2.png"
		sp_bg_tex = directx.create_texture(filesystem.scripts_dir()..sp_bg_tex_name) 
		sp_pin_tex = directx.create_texture(filesystem.scripts_dir()..sp_pin_tex_name)
		txt_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
		sp_colour = {["r"] = 1.0,["g"] = 0.0,["b"] = 1.0,["a"] = 1.0}
	else
		sp_bg_tex_name = "chx_spc.png"
		sp_pin_tex_name = "chxs_pin_spc.png"
		sp_bg_tex = directx.create_texture(filesystem.scripts_dir()..sp_bg_tex_name) 
		sp_pin_tex = directx.create_texture(filesystem.scripts_dir()..sp_pin_tex_name)
		txt_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
		sp_colour = {["r"] = 0.9,["g"] = 0.9,["b"] = 0.9,["a"] = 1.0}
	end
	local sp_bg_tex = directx.create_texture(filesystem.scripts_dir()..sp_bg_tex_name) 
	local sp_pin_tex = directx.create_texture(filesystem.scripts_dir()..sp_pin_tex_name) 
end, false)
menu.rainbow(menu.colour(menu.my_root(), "Change speedometer accent colour", {"spc"}, "", sp_colour, true, function(colour)
	sp_colour = colour
end))
menu.colour(menu.my_root(), "Change speedometer text colour", {"sptxtc"}, "", txt_colour, true, function(colour)
	txt_colour = colour
end)
menu.divider(menu.my_root(), "Speedometer position")
menu.slider(menu.my_root(), "Speedometer pos X", {"spX"}, "", 1, 1000, 930, 1, function(x)
	sp_posX=x/1000
end)
menu.slider(menu.my_root(), "Speedometer pos Y", {"spY"}, "", 1, 1000, 888, 1, function(y)
	sp_posY=y/1000
end)
menu.action(menu.my_root(),"Default speedometer pos", {"defsp"}, "",function()
	sp_posX = 0.93
	sp_posY = 0.88
end)
end

GenerateFeatures()

while true do 
		if spo then
			--no speedometer
		else
		local veh = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false)
		
		if veh > 0 then
		
		local speed = ENTITY.GET_ENTITY_SPEED(veh);
		local kmh = math.floor((speed * 3.6));
		local rotation = 0.0
		
		if kmh <= 240 and rotation <= 0.75 then
			rotation = kmh/320
		end
		
		directx.draw_texture(		---------------------------- speedometer bg texture
		sp_bg_tex,				-- id
		0.066,				-- sizeX
		0.066,				-- sizeY
		0.5,				-- centerX
		0.5,				-- centerY
		sp_posX,				-- posX 
		sp_posY,		 		-- posY 
		0.0,				-- rotation
		sp_colour			--colour
	)
		directx.draw_texture(		---------------------------- speedometer pin texture
		sp_pin_tex,				-- id
		0.066,				-- sizeX
		0.066,				-- sizeY
		0.5,				-- centerX
		0.5,				-- centerY
		sp_posX,				-- posX  
		sp_posY,		 		-- posY 
		rotation,			-- rotation
		sp_colour 			--colour
	)
		directx.draw_text(	-------------------  small text top
		sp_posX-0.022,				-- x 
		sp_posY+0.068,				-- y 
		kmh .." KMPH",		-- text
		ALIGN_TOP_LEFT,		-- alignment
		0.6,				-- scale
		txt_colour,		-- colour
		false				
	)	
	else 
		--no veh no speedo
	end
		end	
		util.yield() 
	end			

while true do  
	util.yield()
end