local world = {}

function loadLevel (levelNumber)
    imageInfo = love.image.newImageData(Levels[levelNumber])
    image = love.graphics.newImage(imageInfo)

    Tiles = {}
    Sprites = {}
    for i = 1, image:getWidth() do 
        Tiles[i] = {}
        for j = 1, image:getHeight() do
            Tiles[i][j] = 0
        end
    end

    for x = image:getWidth() - 1, 1, -1 do

        for y = image:getHeight() -1, 1, -1 do
            local r, g, b, a = imageInfo:getPixel(x, y)
            r, g, b, a = math.floor(r*256), math.floor(g*256), math.floor(b*256), math.floor(a*256)
            if r == 1 then
                Tiles [y][x] = 1
            end
            if r == 2 then 
                Sprites[#Sprites + 1] = makeDoor(x*8, y*8, g, b, a)
            end
        end
    end
end

function drawTiles()
    for x = #Tiles, 1, -1 
    do
        for y = #Tiles[1], 1, -1 
        do 
            if Tiles [x][y] == 1 then
                love.graphics.draw(tileTexture, tileQuad, y * 8 - 8, x * 8 - 8)
            end
        end
    end
end

function drawSprite (sprite)
    love.graphics.draw(
        sprite.texture,
        love.graphics.newQuad(0, 0, sprite.texture:getWidth(), sprite.texture:getHeight(), sprite.texture:getWidth(), sprite.texture:getHeight()),
        sprite.X,
        sprite.Y,
        0,
        sprite.Xflip or 1,
        1,
        sprite.texture:getWidth() / 2,
        sprite.texture:getHeight()
    )
end

return world