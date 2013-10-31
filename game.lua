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


--Require physics
local physics = require("physics")	
physics.start();
--physics.setDrawMode( "hybrid" )

--Activate multitouch
system.activate("multitouch")
--Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--We also require the section definitions.
--These controls positions etc of the Stars and platforms.
local level = require("levels.level"..currentLevel)

--Maths
local _W = display.contentWidth
local _H = display.contentHeight
local mR = math.random --random number in the range [0,1]
local mF = math.floor   --get the largest integer which is smaller than x

--Groups
local firstGroup, treeGroup, alertGroup, objectGroup, extraGroup

--Sounds
local overSound, winSound, beamSound, thrustSound
local beamChannel, thrustChannel, overChannel, winChannel = 2,3,4,5 --Channel vars, used to play sounds, these values change when they are used.

--Game Control Variables
local moveSide = "right" --Changes when we touch the buttons.
local moving = false --Keeps track of us moving or not.
local floorHit = false --Controls animation
local gameOverCalled = false --Just incase an extra game over call is made.
local distChange, distChange2 = 0, 0 --Keeps track of how far we've gone in regards to the contentBounds.
local gameIsActive = true  --Set to true to start scrolling etc.
local score = 0  --Points for killing enemies etc.
local sectionInt = 1 --Controls the sections being made
levelScore = 0 --Reset the levelScore just incase it is still set.
local abductionValue = 50 --How much each successful abduction scores
local alertValue = -30 --How much each raised alert scores
local numLives = 3 --Maximum lives per level


--BG and display variables.
local bgSky, bgCelestials1, bgCelestials2, ground1, ground2 --extra1, extra2,  ->  trees
local scoreText --Displays our score
local alertsText --Dispays alerts raised

--Functions Pre-declared
--This is done so runtime listeners can be easily removed/added 
local onCollision, gameLoop

--UFO, beam and alert vars.
local ufo, beam, ufoBeamJoint
local levelspeed = 0 --Will increase when we start running.
local runSpeed = 10 --How fast the background will move when your running top speed.
local movementAllowed = true
local landed = true --Boolean to hold if ufo is currently landed
local landing = false 
local beamActive = false --beam can only activate when there is an abductee in range
local endZone = false --flag to indicate if the UFO is in the endzone
local crashThresh = 3 --the force threshold value in a collision, anything over this and the UFO crashes/explodes
--NOTE: on Corona SDK (Windows PC) a crashThrest of 1 works well,
--on Android (Nexus 4) a crashThresh of 5 must be used for the same gameplay.
--these figures might vary on different machines??
local alert = false --flag to indicate if UFO is currenlty in an alert zone
local alertCount = 0 --count how many alerts have been raised

--Timers and transitions
local moveTimer
local thrustTimer --timer to apply continuous upwards thrust force
local alertTimer --timer to trigger an alert

--Debug text ouput to screen
--local debugBox1 = display.newText("Collision force: ", _W/2,10,native.systemFont,16) --debugLine
--local debugBox2 = display.newText("Crash force: ", _W/2,30,native.systemFont,16)  --debugLine



--------------------------------------------
-- ***SPRITESHEET SETUP***
-- Animations for the ufo/enemies
--------------------------------------------

--Setup SpriteSheets
local spriteSheetInfo = require("spritesheet")
local mySpriteSheet = graphics.newImageSheet( "spritesheet.png", spriteSheetInfo:getSheet() )
local ufoSheetInfo = require("spritesheet_ufo")
local ufoSpriteSheet = graphics.newImageSheet( "spritesheet_ufo.png", ufoSheetInfo:getSheet() )

--Load PhysicsData
local physicsData = (require "shapedefs").physicsData(1.0) --physics properties have a scaling of one

--UFO sequence data
local ufoSequenceData = {
	{name="beamActive", start=1, count=11, time=1000, loopCount=0},  --loop indefinitely
	{name="normal", start=12, count=1, time=400, loopCount=1}, 
	{name="landingGearUp", start=15, count=3, time=1000, loopCount=1},
	{name="landingGearDown", start=13, count=3, time=1000, loopCount=1},
	{name="landed", start=15, count=1, time=400, loopCount=1},
	{name="lightUp", start=18, count=3, time=500, loopCount=1, direction="bounce" },
	{name="landingLights", start=18, count=3, time=1000, loopCount=0, direction="bounce" },
	{name="explode", start=21, count=17, time=1000, loopCount=1 },
	{name="levelCleared", start=1, count=11, time=500, loopCount=3, direction="bounce"},
}

--Sequence data for the controls (from normal to active )
local thrustSequenceData = {
	{name="normal", start=spriteSheetInfo:getFrameIndex("controls_thrust"), count=1, time=400, loopCount=1},
	{name="active", start=spriteSheetInfo:getFrameIndex("controls_thrustActive"), count=1, time=400, loopCount=1}
}
local leftSequenceData = {
	{name="normal", start=spriteSheetInfo:getFrameIndex("controls_left"), count=1, time=400, loopCount=1},
	{name="active", start=spriteSheetInfo:getFrameIndex("controls_leftActive"), count=1, time=400, loopCount=1}
}
local rightSequenceData = {
	{name="normal", start=spriteSheetInfo:getFrameIndex("controls_right"), count=1, time=400, loopCount=1},
	{name="active", start=spriteSheetInfo:getFrameIndex("controls_rightActive"), count=1, time=400, loopCount=1}
}
local beamSequenceData = {
	{name="normal", start=spriteSheetInfo:getFrameIndex("controls_beam"), count=1, time=400, loopCount=1},
	{name="active", start=spriteSheetInfo:getFrameIndex("controls_beamActive"), count=1, time=400, loopCount=1}
}
local landingGearSequenceData = {
	{name="normal", start=spriteSheetInfo:getFrameIndex("controls_landingGear"), count=1, time=400, loopCount=1},
	{name="active", start=spriteSheetInfo:getFrameIndex("controls_landingGearActive"), count=1, time=400, loopCount=1}
}

--a function to implement a follow-up sequence with defined delay
local function followupSequence(spriteObj, delay, seqName)
	local function swapSeq()
		spriteObj:setSequence( seqName )
		spriteObj:play()
	end
	timer.performWithDelay( delay, swapSeq )
end


------------------------------------------------
-- *** STORYBOARD SCENE EVENT FUNCTIONS ***
------------------------------------------------
-- Called when the scene's view does not exist:
-- Create all your intial display objects here.
function scene:createScene( event )
	print( "Game: createScene event")
	local screenGroup = self.view
	

	--Create the groups..
	firstGroup = display.newGroup()
	alertGroup = display.newGroup()
	treeGroup = display.newGroup(); treeGroup.alpha=0.8
	objectGroup = display.newGroup()
	extraGroup = display.newGroup()
	screenGroup:insert(firstGroup); screenGroup:insert(alertGroup);
	screenGroup:insert(treeGroup); screenGroup:insert(objectGroup); 
	 screenGroup:insert(extraGroup); 

	--Load the sounds.
	beamSound = audio.loadSound("sounds/beam.mp3")
	overSound = audio.loadSound("sounds/failedAttempt.wav")
	winSound = audio.loadSound("sounds/LevelComplete.mp3")
	thrustSound = audio.loadSound("sounds/thruster.wav")


	--------------------------------------------
	-- ***HUD SETUP***
	-- Creates the HUD Bar, Score Text
	--------------------------------------------
	local hudBar = display.newImageRect(extraGroup, "images/clearheader.png", 480,36)
	hudBar.x = _W*0.5; hudBar.y = 14; hudBar.alpha = 0.5

	scoreText = display.newText(extraGroup, "Score: "..score,0,0,"Arial",17)
	scoreText:setReferencePoint(display.CenterLeftReferencePoint); scoreText:setTextColor(50)
	scoreText.x = 6; scoreText.y = 14
	
	alertsText = display.newText(extraGroup, "Alerts Raised: "..alertCount,0,0,"Arial",17)
	alertsText:setReferencePoint(display.CenterRightReferencePoint); alertsText:setTextColor(50)
	alertsText.x = _W-6; alertsText.y = 14 


	--------------------------------------------
	-- ***CREATE GAME FUNCTION.***
	--Create the scenery and the UFO functions
	--------------------------------------------

	--Function to take up the UFO's landingGear
	local function ufoLandingGearUp()
		ufo:setSequence("landingGearUp"); ufo:play()
		landed = false
		landing = false
		followupSequence(ufo, 1000, "normal")
	end
	
	--Function to apply an upward thrust force, called by thrustControl below
	local function applyThrust()
		--set standard thrust force
		local thrustForce = -45
		local vertNow = ufo.y
		
		--if ufo is flying above top of screen display.. apply no thrust
		if (vertNow<=0) then
			thrustForce = 0
		--if ufo is heading upwards use limited thrust function
		elseif (vertNow<ufo.vertPosition) then
			--vary force determined by UFO distance from screen top
			--thrustForce = thrustForce * (vertNow / _H)
			--thrustForce = thrustForce * math.sqrt (math.sqrt( vertNow / _H )) --exponential
			thrustForce = thrustForce * ( vertNow / _H ) ^ .25 --exponential
			--possibly a very CPU intensive loop to be performing every 50 milliseconds!
		--more efficient method to implement a 'quadratic/cubic/exp ease out' type acceleration/thrust control might be available
		end
		--update UFO's vertical position and apply thrust force
		ufo:applyForce(0,thrustForce,ufo.x,ufo.y)
		ufo.vertPosition = ufo.y
		
	end
	
	--Thrust function with some control vars.
	local function thrustControl( event )
		--provide handle to event target and current stage
		local target = event.target
		local stage = display.getCurrentStage()

		--Only allow this to occur if we haven't died etc.
		if movementAllowed then
			--if thrust button is pressed
			if event.phase == "began" then
				--set focus
				stage:setFocus( target, event.id ); target.isFocus = true
				target:setSequence("active"); target:play()
				--note UFO's current vertical position
				ufo.vertPosition = ufo.y
				--apply force using thrustTimer
				thrustTimer = timer.performWithDelay(50,applyThrust,0)
				print("thrust audio..") --debugLine
				thrustChannel = audio.play(thrustSound)
				--if ufo is landed
				if landed == true then
					ufoLandingGearUp()
				end
			--else if button released or cancelled
			elseif event.phase == "ended" or event.phase == "cancelled" then
				--remove focus
				target:setSequence("normal"); target:play()
				stage:setFocus( target, nil ); target.isFocus = false
				--cancel thrustTimer
				if thrustTimer then 
					timer.cancel(thrustTimer); thrustTimer = nil
				end
				--stop thrust audio
				audio.stop(thrustChannel)
			end --end if event.phase

		--If we aren't allowed to move we need to stop the focus.
		--If you dont there is a risk of a crash as the scene changes (if your still pressing the button)
		elseif stage and t then --sometimes crashes as stage is a nil value, introducing a check to ensure stage exists before removing the focus
			stage():setFocus( t, nil )
		end
		return true
	end

	--Create Section function.. Create platforms and enemies etc
	--Using the required level file at the top to create each screen in turn.
	local function createSection()
		local xOffset = 480

		--Get the section we want to create now.
		--Loop through creating everything with the right properties.
		local i
		for i=1, #level[sectionInt]["structures"] do
			local object = level[sectionInt]["structures"][i]
			local structure = display.newImage(objectGroup, mySpriteSheet, spriteSheetInfo:getFrameIndex( object["label"] ) )
			structure.x = object["position"][1]+xOffset; structure.y = object["position"][2]; 
			structure.name = "structure"; structure.label = object["label"]
			physics.addBody( structure, "static", physicsData:get( object["label"] ) );
		end
		for i=1, #level[sectionInt]["animals"] do
			local object = level[sectionInt]["animals"][i]
			local animal = display.newImage(objectGroup, mySpriteSheet, spriteSheetInfo:getFrameIndex( object["label"] ) )
			animal.x = object["position"][1]+xOffset; 
			animal.y = object["position"][2]; 
			animal.name = "animal"; animal.label = object["label"]
			--add physics for all animals with category bits and maskbits assigned to ensure collisions with the beam sensor
			physics.addBody( animal, "dynamic", { density=1, friction=0.3, bounce=0.2, filter = { categoryBits = 4, maskBits = 54, groupIndex = 0 } } );
			print("Section: "..sectionInt.. " Animal: "..animal.label) --debugLine
		end
		for i=1, #level[sectionInt]["extras"] do
			local object = level[sectionInt]["extras"][i]
			local extra = display.newImage(treeGroup, mySpriteSheet, spriteSheetInfo:getFrameIndex( object["label"] ) )
			--add offset to the x position due to the levelspeed*0.5 parallax movement of the treeGroup
			--(avoids trees 'popping' up mid scene)
			extra.x = object["position"][1] + xOffset+ (sectionInt-1)*xOffset/2 ; 
			extra.y = object["position"][2]; 
			extra.name = "extra"; extra.label = object["label"]
			print("Section: "..sectionInt.. " Extra: "..extra.label) --debugLine
		end
		for i=1, #level[sectionInt]["alerts"] do
			local object = level[sectionInt]["alerts"][i] 
			local alert = display.newRect(alertGroup, 0, 0, object["widthHeight"][1], object["widthHeight"][2]);
			alert:setReferencePoint(display.BottomCenterReferencePoint);
			alert.x = object["position"][1] + xOffset; alert.y = object["position"][2];
			alert.name = "alert"; alert.label=object["label"]
			--if alert is a window, colour yellow
			if ( string.sub( object["label"], 1,6) == "window") then 	
				alert:setFillColor(255,255,0)
				alert.alpha = 1.0
				print("Alert: "..alert.label.." ready") --debugLine
				--provide access to the window from the alertGroup using a key
				alertGroup[alert.label] = alert
			else
				physics.addBody( alert, "static", { isSensor = true, filter={ categoryBits=64, maskBits=1, groupIndex=0 } } );
				print("Section: "..sectionInt.. " Alert: "..alert.label) --debugLine
			end
			--hide sensors and windows until alert is triggered
			alert.isVisible = false
			--alert.alpha=0.7 --debugLine
		end
		for i=1, #level[sectionInt]["clearing"] do
			local object = level[sectionInt]["clearing"][i]
			local tempx = object["position"][1]+xOffset; 
			local tempy = object["position"][2];
			local clearing = display.newRect(objectGroup, tempx,  tempy, object["widthHeight"][1], object["widthHeight"][2]); 
			clearing.name = "clearing"; clearing.label = object["label"]
			clearing.isVisible = false
			--clearing.alpha=0.3 --debugLine
			physics.addBody( clearing, "static", { isSensor = true, filter={ categoryBits=64, maskBits=1, groupIndex=0 } } ); --only collides with UFO
			print("Section: "..sectionInt.. " Clearing: "..clearing.label) --debugLine
		end
	end

	--CreateGame makes all the backgrounds etc.
	--This is also called when we reset the game.
	local function createGame()
		--Background and floor and extras
		--fixed position
		bgSky = display.newImageRect(firstGroup, "images/sky.png", 480, 380)
		bgSky:setReferencePoint(display.BottomLeftReferencePoint); bgSky.x = 0; bgSky.y = 320
		--parallax stars/moon
		bgCelestials1 = display.newImageRect(firstGroup, "images/celestials1.png", 480, 320)
		bgCelestials1:setReferencePoint(display.TopLeftReferencePoint); bgCelestials1.x = 0; bgCelestials1.y = -40
		bgCelestials2 = display.newImageRect(firstGroup, "images/celestials2.png", 480, 320)
		bgCelestials2:setReferencePoint(display.TopLeftReferencePoint); bgCelestials2.x = 480; bgCelestials2.y = -40

--		extra1 = display.newImageRect(firstGroup, "images/extra.png", 480, 90)
--		extra1:setReferencePoint(display.BottomLeftReferencePoint); extra1.x = 0; extra1.y = _H-40
--		extra2 = display.newImageRect(firstGroup, "images/extra2.png", 480, 90)
--		extra2:setReferencePoint(display.BottomLeftReferencePoint); extra2.x = 480; extra2.y = _H-40

		--Create UFO sprite
		ufo = display.newSprite(ufoSpriteSheet, ufoSequenceData)
		ufo:setReferencePoint(display.BottomCenterReferencePoint)
		ufo.x = _W/2; ufo.y = _H-22; ufo.name = "ufo";
		ufo:setSequence("landed"); ufo:play()
		extraGroup:insert(ufo);
		--add UFO physics
		physics.addBody( ufo, "dynamic", physicsData:get("ufo12") )
		ufo.isFixedRotation = true --To stop it rotating when ufoing etc
		ufo.isSleepingAllowed = false --To force it to be alert and update 
		
		--create beam
		beam = display.newImage( objectGroup, mySpriteSheet, spriteSheetInfo:getFrameIndex("beam") )
		beam:setReferencePoint( display.TopCenterReferencePoint ) 
		beam.x = ufo.x; beam.y = ufo.y; beam.name ="beam"
		physics.addBody( beam, "dynamic", physicsData:get("beam") )
		--create joint between ufo and beam
		ufoBeamJoint = physics.newJoint("weld", ufo, beam, ufo.x, ufo.y-20)
		--hide beam but allow sensor to receive collisions
		beam.isVisible = false; beam.isHitTestable = true
		--beam.isSleepingAllowed = false --To force it to be alert and update 

		-- Create ground (x2)
		ground1 = display.newImage(extraGroup, mySpriteSheet , spriteSheetInfo:getFrameIndex("ground") )
		ground1:setReferencePoint(display.BottomLeftReferencePoint); ground1.x = 0; ground1.y = _H+1; ground1.name = "floor"
		physics.addBody( ground1, "static", physicsData:get("ground") )
		ground2 = display.newImage(extraGroup, mySpriteSheet , spriteSheetInfo:getFrameIndex("ground") )
		ground2:setReferencePoint(display.BottomLeftReferencePoint); ground2.x = 480; ground2.y = _H+1; ground2.name = "floor"
		physics.addBody( ground2, "static", physicsData:get("ground") )
		
		
		--Create a section straight away..
		createSection()
	end
	createGame()



	--------------------------------------------
	-- *** D-PAD Setup ***
	-- Allows you to move and jump, also scrolls the background along.
	--------------------------------------------
	--Move everything function. Moves the level etc.
	local function moveEverything()
		--Check sides and change the level speed accordingly.
		if moveSide == "left" then 
			levelspeed = levelspeed +1
			if levelspeed > runSpeed then levelspeed = runSpeed end
		else
			levelspeed = levelspeed -1
			if levelspeed < -runSpeed then levelspeed = -runSpeed end
		end

	
		--Move backgrounds, called from the checks below this function.
		local function moveBackgrounds()
			--Move the other items and platforms. 
			--If they are far left of the screen we remove them.
			local i
			for i = objectGroup.numChildren,1,-1 do --count down from objectGroup.numChildren to 1
				local object = objectGroup[i]
				if object ~= nil and object.y ~= nil then
					object:translate( levelspeed, 0)
					if object.x < -480 then  
						display.remove(object); object = nil; 
					end
				end
			end
			--Now move the enemies
			for i = alertGroup.numChildren,1,-1 do
				local alert = alertGroup[i]
				if alert ~= nil and alert.y ~= nil then
					alert:translate( levelspeed, 0)
					if alert.x < -480 then 
						display.remove(alert); alert = nil; 
					end
				end
			end

			--Move the backgrounds...
			--We then check to see if they need to be replaced.
			bgCelestials1:translate(levelspeed*0.1,0) 
			bgCelestials2:translate(levelspeed*0.1,0) 
			ground1:translate(levelspeed,0)
			ground2:translate(levelspeed,0) 
			treeGroup:translate(levelspeed*0.5,0)
			distChange = distChange - levelspeed --Holds the distance moved.
			distChange2 = distChange2 - levelspeed
			
			if ground1.x <= -480 then ground1.x = ground1.x + 960; --extra1.x = extra1.x + 960
			elseif ground1.x >= 480 then ground1.x = ground1.x - 960; end --extra1.x = extra1.x - 960 
			if ground2.x <= -480 then ground2.x = ground2.x + 960; --extra2.x = extra2.x + 960
			elseif ground2.x >= 480 then ground2.x = ground2.x - 960; end --extra2.x = extra2.x - 960 
			if bgCelestials1.x <= -480 then bgCelestials1.x = bgCelestials1.x + 960 
			elseif bgCelestials1.x >= 480 then bgCelestials1.x = bgCelestials1.x - 960 end
			if bgCelestials2.x <= -480 then bgCelestials2.x = bgCelestials2.x + 960 
			elseif bgCelestials2.x >= 480 then bgCelestials2.x = bgCelestials2.x - 960 end

			--If distChange2 is over 480 then create a new section.
			--We dont create them in the opposite direction.
			if distChange2 > 480 then
				sectionInt = sectionInt + 1
				if sectionInt <= #level then createSection() end
				distChange2 = 0
			end
		end


		--Now move everything, but only if its within the level bounds!!
		--If it isn't we only move the player up to the boundary. We also stop the screen
		--from going left. Forcing the player to advance through the game.
		if moveSide == "right" then
			if ufo.x < _W*0.5 then
				ufo:translate(-levelspeed,0) 
			elseif distChange >= level.screenBounds[2] then
				if ufo.x >= _W then ufo.x = _W
				elseif ufo.x <= (_W*0.5)-1 then  ufo.x = _W*0.5; moveBackgrounds()
				else ufo:translate(-levelspeed,0) end
			else
				moveBackgrounds()
			end

		elseif moveSide == "left" then
			if ufo.x <= 0 then ufo.x = 0
			elseif ufo.x >= _W then ufo.x = _W-1
			else ufo:translate(-levelspeed,0) end
		end
	end --End of moveEverything

	--Button function. Called from the left and right buttons
	local function moveButton(event)
		local t = event.target 

		--Only allow this to occur if we haven't died etc. and are airborne
		if movementAllowed and landed == false then 
			if event.phase == "began" and moving == false then
				display.getCurrentStage():setFocus( t, event.id )
				t.isFocus = true; --t.alpha = 0.6
				t:setSequence("active"); t:play()
				moving = true

				moveSide = t.dir --Set the side variable.
				moveTimer = timer.performWithDelay(1, moveEverything, 0) --Timer for forcing movement

				--Change the sprite animation depending on the direction.
--				ufo:setSequence("normal"); ufo:play()
				if t.dir == "right" then ufo.xScale = 1
				else ufo.xScale = -1 end

			elseif t.isFocus and moving == true then
				if event.phase == "ended" or event.phase == "cancelled" then
					display.getCurrentStage():setFocus( t, nil )
					t.isFocus = false; --t.alpha = 1
					t:setSequence("normal"); t:play()
					moving = false

					--Cancel the timer/reset vars
					if moveTimer then timer.cancel(moveTimer); moveTimer=nil; end
--					ufo:setSequence("normal"); ufo:play() --Reset the sprite to standing as well.
					levelspeed = 0
				end
			end

		--If we aren't allowed to move we need to stop the focus.
		--If you dont there is a risk of a crash as the scene changes (if your still pressing the button)
		else
			display.getCurrentStage():setFocus( t, nil )
		end
		return true
	end
	
	--Button function to control the landingGear
	local function landingGear(event)
		local t = event.target 

		--Only allow this to occur if we haven't died etc. and ufo is airborne
		if movementAllowed and landed == false then 
			--only drop landing gear when UFO is close to the ground in the endzone
			if event.phase == "began" and endZone==true  then
				--set focus
				display.getCurrentStage():setFocus( t, event.id )
				t.isFocus = true; t:setSequence("active"); t:play()
				--deploy the landing gear
				ufo:setSequence("landingGearDown"); ufo:play()
				landing=true
				
			elseif event.phase == "ended" or event.phase == "cancelled" then
				--remove focus
				display.getCurrentStage():setFocus( t, nil )
				t.isFocus = false; t:setSequence("normal"); t:play()
				--lift the landing gear
				if landing then
					ufo:setSequence("landingGearUp"); ufo:play()
					landing=false
				end
			end

		--If we aren't allowed to move we need to stop the focus.
		--If you dont there is a risk of a crash as the scene changes (if your still pressing the button)
		else
			display.getCurrentStage():setFocus( t, nil )
		end
		return true
	end
	
	--Change Score function.
	local function updateScore(amount)
		if amount ~= nil then
			score = score + amount
			scoreText.text = "Score: "..score
			scoreText:setReferencePoint(display.CenterLeftReferencePoint)
			scoreText.x = 6
		end
	end
	
	--Function to deal with a successful abduction
	local abductionSuccessful = function(obj)
		if obj then 
			print("Abducted: "..obj.label ) --debugLine
			ufo:setSequence("lightUp"); ufo:play()
			followupSequence(ufo, 505, "normal")
			updateScore(abductionValue)
			obj:removeSelf(); obj=nil
		else
			print("Error: Abduction attempt failed - no object")
		end
	end
	
	--Functiion to attempt an abduction. Called by the activateBeam button function
	local function attemptAbduction()
		--Function to abduct a target. 
		local function abduct()
			--if game is still active
			if gameIsActive==true then
				--if beam is still active and a target exists
				if beamActive==true and beam.isVisible and beam.target then
					print("Attempting abduction: "..beam.target.label) --debugLine
					transition.to(beam.target, {time=300, alpha=0, x=ufo.x, y=ufo.y, transition=easing.outQuad, onComplete=abductionSuccessful } )
				end
			end
		end
		--attempt abduction with delay
		timer.performWithDelay(700, abduct, 1)
	end
	
	--Button function to control the beam
	local function activateBeam(event)
		local t = event.target 

		--Only allow this to occur if we haven't died etc.  and are airborne
		if movementAllowed and (landing==false or landed==false) then 
			--if we are trying to turn the beam on, check if there is an abductee in range
			if event.phase == "began" and beamActive==true  then
				--set focus and start button animation
				display.getCurrentStage():setFocus( t, event.id )
				t.isFocus = true; t:setSequence("active"); t:play()
				--turn on beam
				beam.isVisible = true
				beamChannel = audio.play(beamSound)
				attemptAbduction()
							
				elseif event.phase == "ended" or event.phase == "cancelled" then
					display.getCurrentStage():setFocus( t, nil )
					t.isFocus = false; t:setSequence("normal"); t:play()
					--turn off beam
					beam.isVisible = false
					ufo:setSequence("normal"); ufo:play()
					audio.stop(beamChannel)
			end

		--If we aren't allowed to move we need to stop the focus.
		--If you dont there is a risk of a crash as the scene changes (if your still pressing the button)
		else
			display.getCurrentStage():setFocus( t, nil )
		end
		return true
	end

	--Create the control buttons
	local control_thrust = display.newSprite(mySpriteSheet, thrustSequenceData)
	control_thrust.x=439; control_thrust.y=251;
	control_thrust:setSequence("normal"); control_thrust:play()
	extraGroup:insert(control_thrust);
	control_thrust:addEventListener("touch", thrustControl)

	local control_left = display.newSprite(mySpriteSheet, leftSequenceData)
	control_left.x=43; control_left.y=247; control_left.dir = "left"
	control_left:setSequence("normal"); control_left:play()
	extraGroup:insert(control_left);
	control_left:addEventListener("touch",moveButton)

	local control_right = display.newSprite(mySpriteSheet, rightSequenceData)
	control_right.x=106; control_right.y=247; control_right.dir = "right"
	control_right:setSequence("normal"); control_right:play()
	extraGroup:insert(control_right);
	control_right:addEventListener("touch",moveButton)

	local control_beam = display.newSprite(mySpriteSheet, beamSequenceData)
	control_beam.x=74; control_beam.y=208;
	control_beam:setSequence("normal"); control_beam:play()
	extraGroup:insert(control_beam);
	control_beam:addEventListener("touch",activateBeam)

	local control_landingGear = display.newSprite(mySpriteSheet, landingGearSequenceData)
	control_landingGear.x=74; control_landingGear.y=286;
	control_landingGear:setSequence("normal"); control_landingGear:play()
	extraGroup:insert(control_landingGear);
	control_landingGear:addEventListener("touch",landingGear)

end


 
-- Called immediately after scene has moved onscreen:
-- Start timers/transitions etc.
function scene:enterScene( event )
	print( "Game: enterScene event" )


	-- Completely remove the previous scene/all scenes.
	-- Handy in this case where we want to keep everything simple.
	storyboard.removeAll()

	

	--------------------------------------------
	-- ***COLLISION FUNCTIONS AND START/STOP***
	--What happens when we get hit essentially
	--------------------------------------------
	--Game over and we died...
	local function gameOver()
		--Play the sound..
		overChannel = audio.play(overSound)

		--Stop the gameloop/collision
		gameIsActive = false
		gameOverCalled = true
		movementAllowed = false --Stops the movement buttons from working.
		if moveTimer then timer.cancel(moveTimer); moveTimer = nil; end
		if thrustTimer then timer.cancel(thrustTimer); moveTimer = nil; end

		--Stop the ufo and play the explode sequence
		beam:removeSelf()
		ufo:setSequence("explode"); ufo:play()
		ufo.isFixedRotation=false
		if landing then print("landing: true") else print("landing: false") end --debugLine
		if landed then print("landed: true") else print("landed: false") end --debugLine
		--Delay then show the gameOver screen
		timer.performWithDelay(1400, function() storyboard.gotoScene( "gameOver", "slideLeft", 400 )  end, 1) --debugLine
		--timer.performWithDelay(3000, function() debugBox1:removeSelf();debugBox2:removeSelf(); end, 1) --debugLine
	end
	
	--Game won as we landed successfully in the end zone!!
	local function gameWon()
		--Play the sound..
		winChannel = audio.play(winSound)

		--Stop the gameloop/collision
		gameIsActive = false
		gameOverCalled = true
		movementAllowed = false --Stops the movement buttons from working.
		if moveTimer then timer.cancel(moveTimer); moveTimer = nil; end

		--Do the victory dance!!!
		local function victoryDance()
			--Change the ufos animation to flashing lights
			ufo:setSequence("levelCleared"); ufo:play()
			physics.stop()
			transition.to(ufo, {time=100,  y=ufo.y-100} )
			local function spin()
				timer.performWithDelay(10, function() ufo:rotate(30) end, 12)
			end
			timer.performWithDelay(200, spin, 1 )
			transition.to(ufo, {time=200, x = ufo.x+100, y = -100, transition=easing.inQuad, delay=1200 } )
		end
		timer.performWithDelay(500, victoryDance, 1)
		--Set the global score variable to what we just got...
		levelScore = score

		--Delay the level change
		timer.performWithDelay(2500, function() storyboard.gotoScene( "gameWon", "slideLeft", 400 )  end, 1)
	end
	--gameWon() --call now to preview gameWon behaviour
	
	--function to update alerts
	local function updateAlerts()
		--increment the number of alerts raised
		alertCount = alertCount + 1
		--update the HUD display
		alertsText.text = "Alerts Raised: "..alertCount
		alertsText:setReferencePoint(display.CenterRightReferencePoint)
		alertsText.x = _W-6; 
		--if max number of lives reached, game over
		if alertCount >= numLives then
			gameOver()
		end
	end
	
	--function to handle an alert being triggered
	local function triggerAlert()
		--if alert is not currently triggered
		if alert == false then
			alert = true
			local function checkAlert()
				--if UFO is still in alert zone
				if alert == true then
					--turn on the window
					ufo.triggeredWindow.isVisible = true
					--remove the triggered alert zone to avoid repeat alerts from same zone
					ufo.alertZone:removeSelf()
					--update alerts raised
					updateAlerts()
					--update the score
					score = score + alertValue
					scoreText.text = "Score: "..score
					scoreText:setReferencePoint(display.CenterLeftReferencePoint)
					scoreText.x = 6
				end
			end
			alertTimer = timer.performWithDelay(3000, checkAlert, 1)
		end
	end
	
	--function to handle the UFO leaving an alert zone
	local function endAlert()
		--if alert is currently triggered, cancel
		if alert == true then 
			alert = false
		end
		--cancel any currently running alert timer
		if alertTimer then
			timer.cancel(alertTimer); alertTimer = nil
		end
	end

	--Collision functon. Controls hitting the blocks and coins etc. Also resets the jumping
	function onCollision(event)
		if event.phase == "began" and gameIsActive == true and gameOverCalled == false then
			local name1 = event.object1.name
			local name2 = event.object2.name 
			
			--Beam/Animal collision event started
			if name1 == "beam" or  name2 == "beam" then --beam only collides with animals
				print("Collision began:".." 1. "..name1 .."  2. " ..name2 ) --debugLine
				if event.object2.label then --debugline
					print("Label: " ..event.object2.label) --debugLine
				else print("Error: "..name2.. " has no label")
				end --debugline
				
				--activate the ufo's 'beamActive' seq
				beamActive = true
				ufo:setSequence("beamActive"); ufo:play()
				--give beam a reference to its target
				if name2=="animal" then
					beam.target = event.object2
				else 
					beam.target = event.object1
				end
			end
			
			--UFO enters an alert zone
			if name1 == "alert" or name2 == "alert" then
				--avoid repeat collisions with UFO physics body segments
				if alert == false then
					ufo.triggeredWindow = alertGroup["window"..event.object2.label]
					ufo.alertZone = event.object2
					triggerAlert()
					print("Alert triggered: "..event.object2.label) --debugLine
					print("Alert group: "..alertGroup["window"..event.object2.label].label ) --debugline
				end
			end
			
			--UFO enters clearing.. UFO/Clearing collision
			if name1 == "clearing" or name2 == "clearing" then
				--avoid repeat collisions with UFO physics body segments
				if endZone==false then
					print("Collision began:".." 1. "..name1 .."  2. " ..name2) --debugLine
					ufo:setSequence("landingLights"); ufo:play();
					endZone=true
				end
			end
			
		end
		
		if event.phase == "ended" and gameIsActive == true and gameOverCalled == false then
			local name1 = event.object1.name
			local name2 = event.object2.name
			
			--Beam/Animal collision event ended
			if name1 == "beam" or  name2 == "beam" then
				print("Collision ended:".." 1. "..name1 .."  2. " ..name2) --debugLine
				--deactivate the ufo's 'beamActive' seq
				local deactivateBeam = function()
					beamActive = false
					beam.isVisible = false
					ufo:setSequence("normal"); ufo:play()
				end
				timer.performWithDelay( 1, deactivateBeam, 1)
				--remove beam's target
				local removeTarget = function()
					beam.target=nil
				end
				timer.performWithDelay( 1, removeTarget, 1)
			end
			
			--UFO exits alert zone
			if name1 == "alert" or name2 == "alert" then
				if alert == true then
					ufo.triggeredWindow = nil
					ufo.alertZone = nil
					endAlert()
					print("Alert ended: "..event.object2.label) --debugLine
				end
			end
			
			--UFO/Clearing collision ended
			if name1 == "clearing" or name2 == "clearing" then
				if endZone==true then
					print("Collision ended:".." 1. "..name1 .."  2. " ..name2) --debugLine
					ufo:setSequence("normal"); ufo:play();
					landing=false
					endZone=false
				end
			end
		end	
	end
	Runtime:addEventListener("collision",onCollision)

	
	--Function to handle postCollision events, to monitor collision magnitudes
	local function onPostCollision( event )
		--if game is still active
		if gameIsActive == true and gameOverCalled == false then
			--if ufo is involved in the collision
			if event.object1.name=="ufo" or event.object2.name=="ufo" then
				
				if (event.force > 1) then --debugLine
--					debugBox1.text = "Collision force: " ..event.force --debugLine
--					debugBox1:setReferencePoint(display.CenterReferencePoint) --debugLine
--					debugBox1.x=_W/2 --debugLine
				end --debugLine
				
				--omit initial collision when game starts
				if landed==false then
					--if UFO is attempting to land
					if landing==true then
						--if landing too fast, crash
						if (event.force > crashThresh*3) then
							gameOver()
						else gameWon()
						end
					--for all other collisions above the threshold, crash
					elseif (event.force > crashThresh) then
--						debugBox2.text="Crash force: " ..event.force --debugLine
--						debugBox2:setReferencePoint(display.CenterReferencePoint) --debugLine
--						debugBox2.x=_W/2 --debugLine
						gameOver()
					end
				end
			end
		end
	end
	Runtime:addEventListener( "postCollision", onPostCollision )

end


-- Called when scene is about to move offscreen:
-- Cancel Timers/Transitions and Runtime Listeners etc.
function scene:exitScene( event )
	print( "Game: exitScene event" )
	
	--Stop our timer
	if moveTimer then timer.cancel(moveTimer); moveTimer = nil; end
	if alertTimer then timer.cancel(alertTimer); alertTimer = nil; end
	if thrustTimer then timer.cancel(thrustTimer); thrustTimer=nil; end

	--Stop any loops/listeners from running
	Runtime:removeEventListener( "collision", onCollision )
--	Runtime:removeEventListener("enterFrame", gameLoop)

	--Stop any sounds.
	audio.stop(overChannel)
	audio.stop(beamChannel)
	audio.stop(thrustChannel)
	audio.stop(winChannel)
end



--Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	print( "Game: destroying view" )
	audio.dispose(winSound); winSound=nil
	audio.dispose(overSound); overSound=nil
	audio.dispose(beamSound); beamSound=nil
	audio.dispose(thrustSound); thrustSound=nil
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