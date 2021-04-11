 world = {}

Levels = {
    "Assets/test_level.png",
    "Assets/world_1.png",
    "Assets/world_2.png",
    "Assets/world_3.png",
}

function world.load(level)
    imageInfo = love.image.newImageData(level)
    image = love.graphics.newImage(imageInfo)

    world.tiles = {}
    for i = 1, image:getWidth() do 
        world.tiles[i] = {}
        for j = 1, image:getHeight() do
            world.tiles[i][j] = 0
        end
    end

    world.texture = love.graphics.newImage("Assets/lost_ghost_tilemap.png")


    for x = image:getWidth() - 1, 1, -1 
    do
        for y = image:getHeight() -1, 1, -1 
        do
            local r, g, b, a = imageInfo:getPixel(x, y) 
            if g > 0 then
                world.tiles [y][x] = 1
            end                
        end
    end
end

function world.draw()
    for x = #world.tiles[1], 1, -1 
    do
        for y = #world.tiles[1], 1, -1 
        do 
            if world.tiles [x][y] == 1 then
                local right = world.tiles [x][y-1] == 1
                local left = world.tiles [x][y+1] == 1
                local up = world.tiles [x-1][y] == 1
                local down = world.tiles [x+1][y] == 1
                local tileQuad = love.graphics.newQuad(0, 0, 8, 8, 40, 32)
                if right == true and left == false and up == false and down == true then
                    tileQuad = love.graphics.newQuad(0, 0, 8, 8, 40, 32)
                end
                if right == true and left == true and up == false and down == true then
                    tileQuad = love.graphics.newQuad(8, 0, 8, 8, 40, 32)
                end
                if right == true and left == false and up == false and down == true then
                    tileQuad = love.graphics.newQuad(16, 0, 8, 8, 40, 32)
                end
                if right == false and left == false and up == false and down == true then
                    tileQuad = love.graphics.newQuad(24, 0, 8, 8, 40, 32)
                end
                if right == false and left == false and up == false and down == false then
                    tileQuad = love.graphics.newQuad(32, 0, 8, 8, 40, 32)
                end
                
                if right == true and left == false and up == true and down == true then
                    tileQuad = love.graphics.newQuad(0, 8, 8, 8, 40, 32)
                end
                if right == true and left == true and up == true and down == true then
                    tileQuad = love.graphics.newQuad(8, 8, 8, 8, 40, 32)
                end
                if right == false and left == true and up == true and down == true then
                    tileQuad = love.graphics.newQuad(16, 8, 8, 8, 40, 32)
                end
                if right == false and left == false and up == true and down == true then
                    tileQuad = love.graphics.newQuad(24, 8, 8, 8, 40, 32)
                end
                if right == false and left == false and up == false and down == false then
                    tileQuad = love.graphics.newQuad(32, 8, 8, 8, 40, 32)
                end
                if right == false and left == true and up == true and down == false then
                    tileQuad = love.graphics.newQuad(0, 16, 8, 8, 40, 32)
                end
                if right == true and left == true and up == true and down == false then
                    tileQuad = love.graphics.newQuad(8, 16, 8, 8, 40, 32)
                end
                if right == true and left == false and up == true and down == false then
                    tileQuad = love.graphics.newQuad(16, 16, 8, 8, 40, 32)
                end
                if right == false and left == false and up == true and down == false then
                    tileQuad = love.graphics.newQuad(24, 16, 8, 8, 40, 32)
                end
                if right == false and left == false and up == false and down == false then
                    tileQuad = love.graphics.newQuad(32, 16, 8, 8, 40, 32)
                end
                
                if right == false and left == true and up == false and down == false then
                    tileQuad = love.graphics.newQuad(0, 24, 8, 8, 40, 32)
                end
                if right == true and left == true and up == false and down == false then
                    tileQuad = love.graphics.newQuad(8, 24, 8, 8, 40, 32)
                end
                if right == true and left == false and up == false and down == false then
                    tileQuad = love.graphics.newQuad(16, 24, 8, 8, 40, 32)
                end
                if right == false and left == false and up == false and down == false then
                    tileQuad = love.graphics.newQuad(24, 24, 8, 8, 40, 32)
                end
                if right == false and left == false and up == false and down == false then
                    tileQuad = love.graphics.newQuad(32, 24, 8, 8, 40, 32)
                end
                love.graphics.draw(world.texture, tileQuad, y * 8 - 8, x * 8 - 8)
            end
        end
    end
end


return world