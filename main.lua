local dapperMan = require("dapperMan")
local world = require("world")
local door = require("door")
local menu = require("menu")

Screen = 0
gravity = 1110
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    loadMenu()
    loadTutorialScreen()
    world.load(Levels[1])
    loadDoor()
    dapperMan.load()
end


function love.update(dt)
    if Screen == 0 then
    updateMenu()
    end
    if Screen == 1 then
        dapperMan.update(dt)
        updateDoor()
    end
    if Screen == 2 then
        updateTutorialScreen()
    end
end


function love.draw (dt)
    drawMenu()
    if Screen == 1 then
        love.graphics.scale(2, 2)
        love.graphics.setBackgroundColor( 66/256, 202/256, 253/256, 1)
        world.draw()
        for i = 1, #doors
        do
            drawDoor(doors[i])
        end
        dapperMan.draw()
    end
    if Screen == 2 then
        drawTutorialScreen()
    end
    if Screen == 3 then 
        drawEnd()
    end
end
