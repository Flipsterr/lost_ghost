world1 = {}
function world1.load()
    imageInfo = love.image.newImageData("Assets/world_1.png")
    image = love.graphics.newImage(imageInfo)

    world1.tiles = {}
    for i = 1, image:getWidth() do 
        world1.tiles[i] = {}
        for j = 1, image:getHeight() do
            world1.tiles[i][j] = 0
        end
    end

    world1.texture = love.graphics.newImage("Assets/tile_map_sand.png")
    world1.quad = love.graphics.newQuad(0,0,8,8,world1.texture:getWidth(),world1.texture:getHeight())

    for x = image:getWidth() - 1, 1, -1 
    do
        for y = image:getHeight() -1, 1, -1 
        do
            local r, g, b = imageInfo:getPixel(x, y)
            if g > 0 then
                world1.tiles [y][x] = 1
            end
        end
    end
end

function world1.draw()
    for x = #world1.tiles[1], 1, -1 
    do
        for y = #world1.tiles[1], 1, -1 
        do 
            if world1.tiles [x][y] == 1 then
                love.graphics.draw(world1.texture, world1.quad, y * 8 - 8, x * 8 - 8)
            end
        end
    end
end


return world1