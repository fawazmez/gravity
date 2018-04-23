-----------------------------------------------------------------------------------------
--
-- main.Lua
--
-- moving guy with gravity
--
--
-- Created by: Fawaz Mezher
-- Created on: april 2018 
-----------------------------------------------------------------------------------------
-- Gravity

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )
physics.setDrawMode( "hybrid" )   -- Shows collision engine outlines only


local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 200
dPad.id = "d-pad"


local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 310
upArrow.id = "up arrow"


local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 90
downArrow.id = "down arrow"


local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 200
leftArrow.id = "left arrow"


local theCharacter = display.newImage( "./assets/sprites/ninja.png" )
theCharacter.x = display.contentCenterX
theCharacter.y = display.contentCenterY
theCharacter.id = "the character"
theCharacter.isFixedRotation = true
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )


local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 200
rightArrow.id = "right arrow"

 local theGround = display.newImage( "./assets/sprites/land.png" )
theGround.x = display.contentCenterX -600
theGround.y = display.contentHeight -500
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local theLand = display.newImage( "./assets/sprites/ground.png" )
theLand.x = display.contentCenterX
theLand.y = display.contentHeight
theLand.id = "the land"
physics.addBody( theLand, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

function upArrow:touch( event )

    if ( event.phase == "ended" ) then

         transition.moveBy( theCharacter, { 

        	x = 0, 

        	y = -50, 

        	time = 100

        	} )

    end


    return true

end


function downArrow:touch( event )

    if ( event.phase == "ended" ) then

         transition.moveBy( theCharacter, { 

        	x = 0, 

        	y = 50, 

        	time = 100 

        	} )

    end


    return true

end


function leftArrow:touch( event )

    if ( event.phase == "ended" ) then

         transition.moveBy( theCharacter, { 

        	x = -50 , 

        	y = 0, 

        	time = 100 

        	} )

    end


    return true

end


function rightArrow:touch( event )

    if ( event.phase == "ended" ) then

         transition.moveBy( theCharacter, { 

        	x = 50, 

        	y = 0, 

        	time = 100

        	} )

    end


    return true

end


upArrow:addEventListener( "touch", upArrow )

downArrow:addEventListener( "touch", downArrow )

leftArrow:addEventListener( "touch", leftArrow )

rightArrow:addEventListener( "touch", rightArrow )
