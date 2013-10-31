-------------------------------------------------------------------------
--Night Visitors
--a murmic production!!
--Created by Micheal Murray

--This game is based on the Platformer Storyboard template provided by
--T and G Apps Ltd., Created by Jamie Trinder
--www.tandgapps.co.uk

--CoronaSDK version 2013.1135 was used to build the Night Visitors android app.

--The silhouettes in this game were sourced from all-silhouettes.com
--The explosion animation is sourced from http://april-young.com/home/wp-content/uploads/2012/04/Explosion1spritesheet.png
--All other artwork and design was created by Micheal Murray
-------------------------------------------------------------------------
-- config.lua

application =
{
    content =
    {
            width = 320,
            height = 480,
            scale = "letterbox",	--zoomEven ? "zoomStretch" ?
			--yAlign = "top",
			
			
			imageSuffix =
			{
				["@2x"] = 1.5,			-- 2?
				["@4x"] = 4,
			},
			
    },
	--[[
	LevelDirectorSettings = 
	{
		imagesSubFolder = "images",
		levelsSubFolder = "levels",
	},
	--]]
}


