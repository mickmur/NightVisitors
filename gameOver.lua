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



------------------------------------------------
-- *** STORYBOARD SCENE EVENT FUNCTIONS ***
------------------------------------------------
-- Called when the scene's view does not exist:
-- Create all your display objects here.
function scene:createScene( event )
	print( "gameOver: createScene event")
	local screenGroup = self.view

	--------
	-- *** Create the background and Restart/Menu Button ***
	--------
	--Background image first...
	local bg1 = display.newImageRect( "images/gameOver.jpg", 480,320)
	bg1.x = _W*0.5; bg1.y = _H*0.5
	screenGroup:insert(bg1)
	
	--Restart/Menu button
	local function gotoGame() storyboard.gotoScene( "game", "slideLeft", 400 ) end
	local playGame = display.newRect(0,0, 280, 80)
	playGame.x = _W*0.5; playGame.y = _H*0.66; playGame.alpha = 0.01
	playGame:addEventListener("tap", gotoGame)
	screenGroup:insert(playGame)
	
	local function gotoMenu() storyboard.gotoScene( "menu", "slideRight", 400 ) end
	local menu = display.newRect(0,0, 80, 30)
	menu.x = 40; menu.y = _H-24; menu.alpha = 0.01
	menu:addEventListener("tap", gotoMenu)
	screenGroup:insert(menu)
end


-- Called immediately after scene has moved onscreen:
-- Start timers/transitions etc.
function scene:enterScene( event )
	print( "gameOver: enterScene event" )

	-- Completely remove the previous scene/all scenes.
	-- Handy in this case where we want to keep everything simple.
	storyboard.removeAll()
end

-- Called when scene is about to move offscreen:
-- Cancel Timers/Transitions and Runtime Listeners etc.
function scene:exitScene( event )
	print( "gameOver: exitScene event" )
end

--Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	print( "gameOver: destroying view" )
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
