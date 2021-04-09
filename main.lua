local dapperMan = require("dapperMan")
local door = require("door")
local world = require("world")

 Levels = {
    "Assets/test_level.png",
    "Assets/world_2.png"
}

Sprites = {}

Tiles = {}

Gravity = 1110

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    dapperMan.load()
    tileTexture = love.graphics.newImage("Assets/tile_map_sand.png")
    tileQuad = love.graphics.newQuad(0,0,8,8,tileTexture:getWidth(),tileTexture:getHeight())
    loadLevel(1)
end

function love.update(dt)
    dapperMan.update(dt)
    for i = 1, #Sprites do
        Sprites[i].update(Sprites[i])
    end
end


function love.draw (dt)
    love.graphics.scale(2, 2)
    for i = 1, #Sprites do
        drawSprite(Sprites[i])
    end
    drawTiles()
    dapperMan.draw()
end
