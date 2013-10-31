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

--Start off by requiring storyboard and creating a scene.
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


--Variables etc we needs
local _W = display.contentWidth --Width and height parameters
local _H = display.contentHeight 
local amountOfLevels = 15 --Max number of sqaures to make
local amountPerRow = 5 --Contorls placement.
local levelScores = {} --Holds are level information


--Set up some of the sounds we want to use....
local tapChannel, tapSound




------------------------------------------------
-- *** STORYBOARD SCENE EVENT FUNCTIONS ***
------------------------------------------------
-- Called when the scene's view does not exist:
-- Create all your display objects here.
function scene:createScene( event )
	print( "levelSelect: createScene event")
	local screenGroup = self.view

	--Load sound.
	tapSound = audio.loadSound("sounds/tapsound.wav")


	--------
	-- *** Create the background and Play Button ***
	-------
	--Background images first...
	local bg1 = display.newImageRect( "images/levelSelect.jpg", 480,320)
	bg1.x = _W*0.5; bg1.y = _H*0.5
	screenGroup:insert(bg1)
	

	--------------------------------
	-- *** Load all the level scores/amount of levels.. ***
	--------------------------------
	--Each level score is placed in the levelScores array. 
	local dbPath = system.pathForFile("levelScores.db3", system.DocumentsDirectory)
	local db = sqlite3.open( dbPath ); 

	--Loop through each row and assign the score to our levelScores array.
	local rowInt = 1
	for row in db:nrows("SELECT * FROM scores") do   
		levelScores[rowInt] = row.highscore
		rowInt = rowInt + 1
	end
	db:close()


	------------------------------------------------
	-- *** Create all of the level buttons. Only activate the ones in the levelScores array. ***
	------------------------------------------------
	--Level sqaure clicked...
	local function levelTouched(event)
		--Play the sound
		tapChannel = audio.play( tapSound )

		--Set our global level variable to the id of the block we just touched.
		currentLevel = event.target.id

		--Now change to our game. Which will use the above variable to create the level.
		storyboard.gotoScene( "game", "slideLeft", 400 )
	end


	--Now look through our "amountOfLevels" var creating the blocks.
	--Question mark blocks can't be clicked as we don't have those levels. The ones we
	--actually have in the database are loaded as a normal block, which we can click.
	local rowControl = 0
	local yControl = 0
	local xStart, xOffset = 80, 80 --Controls the spacing/placement
	local yStart, yOffset = 100, 80 --Controls the spacing/placement

	local i 
	for i=1, amountOfLevels do
		if i <= #levelScores then  --l#levelScores = length of levelScores table
			--First the sqaure
			local sqaure = display.newImageRect(screenGroup, "images/levelActive.png", 50, 50)
			sqaure.x = xStart + (rowControl*xOffset)
			sqaure.y = yStart + (yControl*yOffset); sqaure.id = i
			sqaure:addEventListener("tap", levelTouched)

			--Then the number/score text.
			local number = display.newText(screenGroup, i, 0,0, native.sytemFontBold, 18)
			number.x = sqaure.x; number.y = sqaure.y-10
			local score = display.newText(screenGroup, levelScores[i], 0,0, native.sytemFontBold, 17)
			score.x = sqaure.x; score.y = number.y+24
		else
			local sqaure = display.newImageRect(screenGroup, "images/levelUnactive.png", 50, 50)
			sqaure.x = xStart + (rowControl*xOffset)
			sqaure.y = yStart + (yControl*yOffset)
		end

		--Control variables.
		rowControl = rowControl + 1
		if rowControl == amountPerRow then 
			yControl = yControl + 1
			rowControl = 0 
		end
	end
end


-- Called immediately after scene has moved onscreen:
-- Start timers/transitions etc.
function scene:enterScene( event )
	print( "levelSelect: enterScene event" )

	-- Completely remove the previous scene/all scenes.
	-- Handy in this case where we want to keep everything simple.
	storyboard.removeAll()
end

-- Called when scene is about to move offscreen:
-- Cancel Timers/Transitions and Runtime Listeners etc.
function scene:exitScene( event )
	print( "levelSelect: exitScene event" )
end

--Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	print( "levelSelect: destroying view" )
	audio.dispose( tapSound ); tapSound = nil;
end



-----------------------------------------------
-- Add the story board event listeners
-----------------------------------------------
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )



--Return the scene to storyboard.
return scene