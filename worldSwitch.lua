local dapperMan = require("dapperMan")

worldSwitch = {}
function goToWorld1 ()
    if door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and door.position.Y -1 < dapperMan.position.Y and dapperMan.position.Y < door.position.Y +1 and love.keyboard.isDown ("e") then
        drawWorld = world1.draw
        worldTiles = world1.tiles
        dapperMan.position.X = 70
        door.position.X = 100
        door2.position.Y = 1000
        print (worldTiles)
    end
end

function goToWorld2 ()
    if door2.position.X -8 < dapperMan.position.X and dapperMan.position.X < door2.position.X + 8 and door2.position.Y -1 < dapperMan.position.Y and dapperMan.position.Y < door2.position.Y +1 and love.keyboard.isDown ("e") then
        drawWorld = world2.draw
        worldTiles = world2.tiles
        dapperMan.position.X = 70
        door.position.Y = 1000
    end
end

function goBackFromWorld1()
    if worldTiles == world1.tiles and door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and door.position.Y -1 < dapperMan.position.Y and dapperMan.position.Y < door.position.Y +1 and love.keyboard.isDown ("e") then
        drawWorld = world.draw
        worldTiles = world.tiles
        door2.position.Y = 200
        print("it should work :/")
        door.position.X = 200
    end
end


return worldSwitch