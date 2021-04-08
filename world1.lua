world1 = {}
function world1.load()
    imageInfo = love.image.newImageData("Assets/world_1.png")
    image = love.graphics.newImage(imageInfo)

    world.tiles1 = {}
    for i = 1, image:getWidth() do 
        world.tiles1[i] = {}
        for j = 1, image:getHeight() do
            world.tiles1[i][j] = 0
        end
    end

    world.texture1 = love.graphics.newImage("Assets/tile_map_sand.png")
    world.quad1 = love.graphics.newQuad(0,0,8,8,world.texture1:getWidth(),world.texture1:getHeight())

    for x = image:getWidth() - 1, 1, -1 
    do
        for y = image:getHeight() -1, 1, -1 
        do
            local r, g, b = imageInfo:getPixel(x, y)
            if g > 0 then
                world.tiles1 [y][x] = 1
            end
        end
    end
end

function world1.draw()
    for x = #world.tiles1[1], 1, -1 
    do
        for y = #world.tiles1[1], 1, -1 
        do 
            if world.tiles1 [x][y] == 1 then
                love.graphics.draw(world.texture1, world.quad1, y * 8 - 8, x * 8 - 8)
            end
        end
    end
end


return world1