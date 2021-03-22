 world = {}

function world.load()
    imageInfo = love.image.newImageData("Assets/test_level.png")
    image = love.graphics.newImage(imageInfo)

    world.tiles = {}
    for i = 1, image:getWidth() do 
        world.tiles[i] = {}
        for j = 1, image:getHeight() do
            world.tiles[i][j] = 0
        end
    end

    world.texture = love.graphics.newImage("Assets/tile_map_sand.png")
    world.quad = love.graphics.newQuad(0,0,8,8,world.texture:getWidth(),world.texture:getHeight())

    for x = image:getWidth() - 1, 1, -1 
    do
        for y = image:getHeight() -1, 1, -1 
        do
            local r, g, b = imageInfo:getPixel(x, y)
            if g > 0 then
                world.tiles [y][x] = 1
            end
        end
    end
end

function world.draw()
    for x = tablelength(world.tiles[1]), 1, -1 
    do
        for y = tablelength(world.tiles[1]), 1, -1 
        do 
            if world.tiles [x][y] == 1 then
                love.graphics.draw(world.texture, world.quad, y * 8 - 8, x * 8 - 8)
            end
        end
    end
end

function tablelength(T)
    local count = 0
    for _ in ipairs(T) do count = count + 1 end
    return count
end

return world