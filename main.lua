local dapperMan = require("dapperMan")
local world = require("world")

gravity = 1100

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    dapperMan.load()
    world.load()
end

function love.update(dt)
    dapperMan.update(dt)

end

function love.draw (dt)
    love.graphics.scale(2, 2)
    world.draw()
    dapperMan.draw()
end

