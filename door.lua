local dapperMan = require("dapperMan")

door = {}



function drawDoor(door)
    love.graphics.draw(
      door.texture,
      love.graphics.newQuad(0, 0, door.texture:getWidth(), door.texture:getHeight(), door.texture:getWidth(), door.texture:getHeight()),
      door.X,
      door.Y,
      0,
      1,
      1,
      door.width/2,
      door.height
    )
  end
  
function loadDoor(x, y, id, dstx, dsty)
love.graphics.setDefaultFilter("nearest", "nearest")
 local door = {
        X = x,
        Y = y,
        texture = love.graphics.newImage("Assets/door.png"),
        width = love.graphics.newImage("Assets/door.png"):getWidth(),
        height = love.graphics.newImage("Assets/door.png"):getHeight(),
        id = id,
        dstx = dstx,
        dsty = dsty
    }
    return door
end

  doors =  {
    loadDoor( 10000, 200, 1, 300, 150),
    loadDoor( 300, 225, 2, 100, 200),
    loadDoor( 10000, 200, 3, 200, 100),
    loadDoor( 10000, 200, 4, 200, 100),
    loadDoor( 10000, 200, 5, 200, 100)
  }

function setDoors(d)
    local doorOffset = 10000
    if d == 1 then
        doors =  {
            loadDoor ( doorOffset, 200, 1, 100, 270),
            loadDoor( 200, 200, 2, 100, 270),
            loadDoor( 270, 200, 3, 100, 270),
            loadDoor( 350, 200, 4, 100, 270),
            loadDoor( 10000, 200, 5, 100, 270)
        }
      return doors
    end
    if d == 2 then
        doors =  {
            loadDoor( doorOffset, 200, 1, 100, 270),
            loadDoor( doorOffset, 200, 2, 100, 270),
            loadDoor( 150, 32, 3, 100, 270),
            loadDoor( doorOffset, 200, 4, 100, 270),
            loadDoor( doorOffset, 200, 5, 100, 270)
        }
        return doors
    end
    if d == 3 then
        doors =  {
            loadDoor( doorOffset, 300, 1, 100, 270),
            loadDoor( doorOffset, 200, 2, 100, 270),
            loadDoor( doorOffset, 100, 3, 100, 270),
            loadDoor( 43, 96, 4, 100, 270),
            loadDoor( doorOffset, 200, 5, 100, 270)
        }
        return doors
    end
    if d == 4 then
        doors =  {
            loadDoor( doorOffset, 240, 1, 100, 270),
            loadDoor( doorOffset, 220, 2, 100, 270),
            loadDoor( doorOffset, 100, 3, 100, 270),
            loadDoor( doorOffset, 300, 4, 100, 270),
            loadDoor( 300, 153, 5, 100, 270)
        }
        return doors
    end
    if d == 5 then
        doors =  {
            loadDoor( 300, 200, 1, 100, 270),
            loadDoor( doorOffset, 200, 2, 100, 270),
            loadDoor( doorOffset, 200, 3, 100, 270),
            loadDoor( doorOffset, 200, 4, 100, 270),
            loadDoor( doorOffset, 200, 5, 100, 270)
        }
        return doors
    end
end

function drawEnd()
    love.graphics.draw(
        love.graphics.newImage("Assets/title_end.png"),
        love.graphics.newQuad(0, 0, 673, 514, love.graphics.newImage("Assets/title_end.png"):getWidth(), love.graphics.newImage("Assets/title_end.png"):getHeight()),
        400,
        500,
        0,
        1,
        1,
        673/2,
        514
    )
end

function updateDoor()
    for i = 1, #doors
    do
        local distance = math.sqrt(math.pow(doors[i].X - dapperMan.position.X,2)+math.pow(doors[i].Y - dapperMan.position.Y,2))
        if love.keyboard.isDown("e") == true then
            if distance < 8 and doors[i].id == 1 then
                world.load(Levels[1])
                worldTiles = world.tiles
                setDoors(1)
            end
            if distance < 8 and doors[i].id == 2 then
                world.load(Levels[2])
                worldTiles = world.tiles
                dapperMan.position.Y = 155
                setDoors(2)
            end
            if distance < 8 and doors[i].id == 3 then
                world.load(Levels[3])
                worldTiles = world.tiles
                setDoors(3)
                dapperMan.position.Y = dapperMan.position.Y + 170
            end
            if distance < 8 and doors[i].id == 4 then
                world.load(Levels[4])
                worldTiles = world.tiles
                setDoors(4)
                dapperMan.position.Y = dapperMan.position.Y + 170
            end
            if distance < 8 and doors[i].id == 5 then
                Screen = 3
            end
        end
    end
end
  

return door