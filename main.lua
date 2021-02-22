rectangle = {
    ["x"] = 300,
    ["y"] = 400,
    ["width"] = 20,
    ["height"] = 20,
    ["velocity"] = 10
}

gravity = 0.4

function love.load()
    
end

function love.update()
    if love.keyboard.isDown("d") then 
        rectangle.x = rectangle.x + 10
    end
    if love.keyboard.isDown("a") then 
        rectangle.x = rectangle.x - 10
    end
    if love.keyboard.isDown("w") then 
        rectangle.y = rectangle.y - 10
    end
    if rectangle.y < 400 then 
        rectangle.velocity = gravity + rectangle.velocity
        rectangle.y = rectangle.velocity
    end

end

function love.draw (dt)
    love.graphics.rectangle( "fill", rectangle.x, rectangle.y, rectangle.width, rectangle.height)
end