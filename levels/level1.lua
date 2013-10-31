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


--Localise the module. Elimates the need for module package seeall technique.
local M = {}


--This array holds each different screens information. Each screen is 480 pixels wide!
--The movement function in game.lua calls creates each of these screens in turn.
--E.g. blocks/special blocks/obstacles/stars positions...
--You can easily add your own by copying and pasting mine to make the game more interesting!
M = {
	------------------------------------------
	--Screen 1
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
			
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="sheep",
				position={260,282},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			{
				label="tree2",
				position={ -420, 195 }, --move into start screen
			},
			{
				label="tree4",
				position={ 80, 179 },
			},
			{
				label="tree1",
				position={ 200, 248 },
			},
			{
				label="tree3",
				position={ 350, 223 },
			},
			
		},
		--Create the alert zones which trigger a potential sighting 
		alerts = {
			
		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},

	------------------------------------------
	--Screen 2
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
			{
				label="fence",
				position={102,276},
			},
			{
				label="fence",
				position={158,276},
			},
			{
				label="fence",
				position={214,276},
			},
			{
				label="fence",
				position={270,276},
			},
			{
				label="barn",
				position={380,220},
			},
			{
				label="fence",
				position={491,276},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="rooster",
				position={131,220},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
			
		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},

	------------------------------------------
	--Screen 3
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
			{
				label="fence",
				position={62,276},
			},
			{
				label="fence",
				position={117,276},
			},
			{
				label="scarecrow",
				position={314,258},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="crow",
				position={335,220},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			{
				label="tree1",
				position={ 200, 248 },
			},
			{
				label="tree3",
				position={ 340, 223 },
			},
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {

		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},

	------------------------------------------
	--Screen 4
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
			{
				label="house",
				position={325,242},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {			
			{
				label="tree4",
				position={ 220, 179 },
			},
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
			
		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},

	------------------------------------------
	--Screen 5
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
	
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="cow",
				position={300,285},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			{
				label="tree3",
				position={ 180, 223 },
			},
			{
				label="tree4",
				position={ 480, 179 },
			},
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {

		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},

	------------------------------------------
	--Screen 6
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
			{
				label="fence",
				position={77,276},
			},
			{
				label="fence",
				position={133,276},
			},
			{
				label="fence",
				position={179,276},
			},
			{
				label="fence",
				position={235,276},
			},
			{
				label="house",
				position={319,242},
			},
			{
				label="fence",
				position={408,276},
			},
			{
				label="fence",
				position={465,276},
			},
			
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			{
				label="tree1",
				position={ 180, 248 },
			},
			{
				label="tree2",
				position={ 640, 195 },
			},
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
			
		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},

	------------------------------------------
	--Screen 7
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="horse",
				position={220,280},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			{
				label="tree1",
				position={ 130, 248 },
			},
			{
				label="tree3",
				position={ 240, 223 },
			},
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},
	
	
	------------------------------------------
	--Screen 8
	------------------------------------------
	{
		--There are 3 different types of block. Select which one you want per block.
		--"breakable" - Are blocks that you can smash
		--"special" - Is a block that a coin will come out of once.
		--"pushable" - A special block you can push around.
		--"plain" - Is a normal block that does nothing.
		
		--Create the buildings, windows, fences, scarecrow, etc for this screen. Leave blank for none.
		structures = {
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
--			{
--				label="tree3",
--				position={ 0, 223 },
--			},
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
		},
		--Create the level end (a clearing to land in). Should only have one of these and in the last screen you make.
		--To edit its appearance and functions you would have to edit the createSection function in the game.lua file.
		clearing = {
			{
				label="endzone",
				position={ 0, 0},
				widthHeight={400,380},
			},
		},
		--You can add more categories here. Just remember to add them into the
		--creationSections function in the game.lua file.
	},


}


--Set up the screen bounds..
--Limits you going too far left or right. The first one should ALWAYS be 0.
--The second value controls how far right in pixels you can travel. 
--480 = 1 screen, 960 = 2 screens, 1440 = 3 screens, 1920 = 4 screens, 2400 = 5 screens.
--3840 = 8 screens.
M.screenBounds = {0,3840}




--Return it all to the game.
return M

