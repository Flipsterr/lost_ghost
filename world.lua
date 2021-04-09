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

    -- r = id på spriten
    -- r = 1: tile
    -- r = 2: dörr
    -- r = 3: (fiende wip)

    for x = image:getWidth() - 1, 1, -1 
    do
        for y = image:getHeight() -1, 1, -1 
        do
            local r, g, b, a = imageInfo:getPixel(x, y) 
            if g == 0 then
                world.tiles [y][x] = 1
            else if g > 0 then
                
        end
    end
end

function world.draw()
    for x = #world.tiles[1], 1, -1 
    do
        for y = #world.tiles[1], 1, -1 
        do 
            if world.tiles [x][y] == 1 then
                love.graphics.draw(world.texture, world.quad, y * 8 - 8, x * 8 - 8)
            end
        end
    end
end


return world