local dapperMan = require("dapperMan")
local door = require("door")
local world = require("world")
local menu = require("menu")

 Levels = {
    "Assets/test_level.png",
    "Assets/world_1.png",
    "Assets/world_2.png"
}

Sprites = {}

Tiles = {}

Gravity = 1100

screen = 0

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    loadMenu()
    loadTutorialScreen()
    dapperMan.load()
    tileTexture = love.graphics.newImage("Assets/lost_ghost_tilemap.png")
    tileQuad = love.graphics.newQuad(0,0,8,8,tileTexture:getWidth(),tileTexture:getHeight())
    loadLevel(1)
end

function love.update(dt)
    updateMenu()
    if screen == 1 then
     for i = 1, #Sprites do
            if Sprites[i] ~= nil then
            Sprites[i].update(Sprites[i])
            end
     end
    dapperMan.update(dt)
    end
    if screen == 2 then
        updateTutorialScreen()
    end
    
end


function love.draw (dt)
    drawMenu()
    if screen == 1 then 
        love.graphics.scale(2, 2)
        love.graphics.setBackgroundColor( 66/256, 202/256, 253/256, 1)
        for i = 1, #Sprites do
           drawSprite(Sprites[i])
        end
        drawTiles()
        dapperMan.draw()
    end
    if screen == 2 then
        drawTutorialScreen()
    end
end
