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
				label="rabbit",
				position={200,286},
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
				position={ 400, 223 },
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
				label="house",
				position={145,242},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="goat",
				position={290,285},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
			{ --trigger
				label="goat",
				widthHeight={150,180},
				position={250,320},
			},
			{ --window
				label="windowgoat",
				widthHeight={30,30},
				position={190,300},
			},
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
				position={54,276},
			},
			{
				label="house",
				position={145,242},
			},
			{
				label="fence",
				position={236,276},
			},
			{
				label="fence",
				position={292,276},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
		
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
				label="school",
				position={145,227},
			},			
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="pigeon",
				position={180,140}
			}
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
			{
			 --trigger
				label="pigeon",
				widthHeight={150,100},
				position={180,170},
			},
			{ --window
				label="windowpigeon",
				widthHeight={30,30},
				position={200,200},
			},
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
			{
				label="fence",
				position={-10,276},
			},
			{
				label="house",
				position={70,242},
			},
			{
				label="fence",
				position={160,276},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			
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
				label="barn",
				position={180,220},
			},	
			{
				label="fence",
				position={291,276},
			},
			{
				label="fence",
				position={347,276},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="dog",
				position={50,280},
			},
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
			{ --trigger
				label="dog",
				widthHeight={150,180},
				position={50,320},
			},
			{ --window
				label="windowdog",
				widthHeight={40,50},
				position={160,210},
			},
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
			{
				label="scarecrow",
				position={50,258},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="rooster",
				position={220,220},
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

