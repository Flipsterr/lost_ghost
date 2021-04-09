local dapperMan = require("dapperMan")
local world = require("world")
local door = require("door")
local door2 = require("door_2")
local world1 = require("world1")
local world2 = require("world2")
local worldSwitch = require("worldSwitch")

gravity = 1110
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    world.load()
    door.load()
    door2.load()
    dapperMan.load()
    world1.load()
    world2.load()
    print(worldTiles)
    print(world1.tiles)
end

drawWorld = world.draw

function love.update(dt)
    dapperMan.update(dt)
    goToWorld1()
    goToWorld2()
    goBackFromWorld1()
end


function love.draw (dt)
    love.graphics.scale(2, 2)
    drawWorld()
    door.draw()
    door2.draw()
    dapperMan.draw()
end
