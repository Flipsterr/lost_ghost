local dapperMan = require("dapperMan")

local door = {}

function makeDoor(x, y, level, dstx, dsty)
    local door = {
        texture = love.graphics.newImage("Assets/door.png"),
        X = x,
        Y = y,
        rotation = 0,
        update = updateDoor,
        level = level,
        dstx = dstx,
        dsty = dsty
    }
    return door
end

function updateDoor(door)
    local distance = math.sqrt(math.pow(door.X - dapperMan.position.X,2)+math.pow(door.Y - dapperMan.position.Y,2))
    if distance < 8 and love.keyboard.isDown("e") then
        loadLevel(door.level)
        dapperMan.position.X = door.dstx*8
        dapperMan.position.Y = door.dsty*8
    end
end

return door