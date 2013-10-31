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
			{
				label="house",
				position={325,242},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="pitbull",
				position={200,288},
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
			{ --trigger
				label="pitbull",
				widthHeight={150,180},
				position={200,320},
			},
			{ --window
				label="windowpitbull",
				widthHeight={20,30},
				position={300,262},
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
				label="school",
				position={145,227},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="cat",
				position={368,286},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
			{
			 --trigger
				label="cat",
				widthHeight={150,180},
				position={368,320},
			},
			{ --window
				label="windowcat",
				widthHeight={20,30},
				position={228,250},
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
				label="tower",
				position={87,187},
			},
			{
				label="block",
				position={318,211},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="crow",
				position={190,120},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
			{
			 --trigger
				label="crow",
				widthHeight={150,100},
				position={190,140},
			},
			{ --window
				label="windowcrow",
				widthHeight={30,30},
				position={218,185},
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
				label="towers_inc",
				position={62,178},
			},
			{
				label="block",
				position={300,214},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="pigeon",
				position={400,110},
			},
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
			
			{
				label="tree4",
				position={ 240, 179 },
			},
		},
		--Create the alert zones which trigger a potential sighting.
		alerts = {
			{
			 --trigger
				label="pigeon",
				widthHeight={150,100},
				position={400,140},
			},
			{ --window
				label="windowpigeon",
				widthHeight={30,30},
				position={420,185},
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
				label="towers_dec",
				position={74,174},
			},
				{
				label="tower",
				position={210,188},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="squirrel",
				position={372,281},
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
			{
			 --trigger
				label="squirrel",
				widthHeight={150,180},
				position={372,320},
			},
			{ --window
				label="windowsquirrel",
				widthHeight={30,30},
				position={225,206},
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
				label="house",
				position={315,242},
			},
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
			{
				label="dog",
				position={405,280},
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
				position={405,320},
			},
			{ --window
				label="windowdog",
				widthHeight={25,30},
				position={358,300},
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
		},
		--Create the animals for this screen. Leave blank for none.
		animals = {
		},
		--Create the clouds, trees for this screen. Leave blank for none.
		extras = {
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

