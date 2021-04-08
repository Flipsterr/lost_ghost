-- local dapperMan = require("dapperMan")
-- local world = require("world")
-- local door = require("door")
-- local world1 = require("world1")

-- gravity = 1100
-- print()
-- function love.load()
--     love.graphics.setDefaultFilter("nearest", "nearest")
--     world.load()
--     door.load()
--     dapperMan.load()
--     -- if door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and key == ("w") then
--     --     print("it worked!")
--     --     world1.load()
--     -- end
-- end

-- function love.update(dt)
--     dapperMan.update(dt)
--     if door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and key == ("e") then
--         print("it worked!")
--         collision.collideWithWorld(dapperMan, dt, world.tiles1)
--     end

-- end

-- function love.draw (dt)
--     love.graphics.scale(2, 2)
--     world.draw()
--     dapperMan.draw()
--     door.draw()
--     -- if door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and key == ("w") then
--     --     print("it worked!")
--     --     world1.draw()
--     -- end
-- end

-- if door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and key == "e" then
--     print("it worked!")
    
-- end

function test()
    print("Hey")
end

function test2()
    print("Heeey")
end

functions = {
   ["test"] = test()
}

function love.load ()
print(functions.test)
end