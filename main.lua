local dapperMan = require("dapperMan")
local world = require("world")
local door = require("door")
local world1 = require("world1")

gravity = 1100
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    world.load()
    door.load()
    dapperMan.load()
    world1.load()
    
end

function love.update(dt)
    dapperMan.update(dt)
    if door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and love.keyboard.isDown ("e") then
        drawWorld = world1.draw
        worldTiles = world.tiles1
    end
end

drawWorld = world.draw

function love.draw (dt)
    love.graphics.scale(2, 2)
    drawWorld()
    dapperMan.draw()
    door.draw()
end
