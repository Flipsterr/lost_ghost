require("dapperMan")
require("world")
require("collision")

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
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.line(0, 200, love.graphics.getWidth(), 200)
    love.graphics.setLineWidth(0.2)
end

