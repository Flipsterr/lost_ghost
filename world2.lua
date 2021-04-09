world2 = {}

function world2.load()
    imageInfo = love.image.newImageData("Assets/world_2.png")
    image = love.graphics.newImage(imageInfo)

    world2.tiles = {}
    for i = 1, image:getWidth() do 
        world2.tiles[i] = {}
        for j = 1, image:getHeight() do
            world2.tiles[i][j] = 0
        end
    end

    world2.texture = love.graphics.newImage("Assets/tile_map_sand.png")
    world2.quad = love.graphics.newQuad(0,0,8,8,world2.texture:getWidth(),world2.texture:getHeight())

    for x = image:getWidth() - 1, 1, -1 
    do
        for y = image:getHeight() -1, 1, -1 
        do
            local r, g, b = imageInfo:getPixel(x, y)
            if g > 0 then
                world2.tiles [y][x] = 1
            end
        end
    end
end

function world2.draw()
    for x = #world2.tiles[1], 1, -1 
    do
        for y = #world2.tiles[1], 1, -1 
        do 
            if world2.tiles [x][y] == 1 then
                love.graphics.draw(world2.texture, world2.quad, y * 8 - 8, x * 8 - 8)
            end
        end
    end
end


return world2