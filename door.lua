door = {}
function door.load()
    door.texture = love.graphics.newImage("Assets/door.png")
    door.position = {
        ["X"] = 200,
        ["Y"] = 200
    }
    door.width = 16
    door.height = 16

    door.quad = love.graphics.newQuad(0, 0, door.width, door.height, door.texture:getWidth(), door.texture:getHeight())
end

function door.draw()
    love.graphics.draw(
        door.texture,
        door.quad,
        door.position.X,
        door.position.Y,
        0,
        1,
        1,
        door.width / 2,
        door.height
)
end

return door