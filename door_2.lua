door2 = {}
function door2.load()
    door2.texture = love.graphics.newImage("Assets/door.png")
    door2.position = {
        ["X"] = 100,
        ["Y"] = 200
    }
    door2.width = 16
    door2.height = 16

    door2.quad = love.graphics.newQuad(0, 0, door2.width, door2.height, door2.texture:getWidth(), door2.texture:getHeight())
end

function door2.draw()
    love.graphics.draw(
        door2.texture,
        door2.quad,
        door2.position.X,
        door2.position.Y,
        0,
        1,
        1,
        door2.width / 2,
        door2.height
    )
end

return door2