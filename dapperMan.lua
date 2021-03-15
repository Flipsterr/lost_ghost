dapperMan = {}



function dapperMan.load()
    dapperMan.texture = love.graphics.newImage("Assets/lost_ghost_dapper.png")
    dapperMan.position = {
        ["X"] = 200,
        ["Y"] = 300
    }
    dapperMan.width = 16
    dapperMan.height = 16
    dapperMan.velocity = {
        ["X"] = 0,
        ["Y"] = 0
    }
    dapperMan.onGround = false
    dapperMan.quad = love.graphics.newQuad(0, 0, dapperMan.width, dapperMan.height, dapperMan.texture:getWidth(), dapperMan.texture:getHeight())
    dapperMan.Xflip = 1
    dapperMan.rect = {
        ["X"] = 0,
        ["Y"] = 0,
        ["Width"] = 0,
        ["Height"] = 0,
    }
    
end

function dapperMan.update(dt)
    dapperMan.velocity.X = 0
    if love.keyboard.isDown("d") then 
        dapperMan.velocity.X = 100
        dapperMan.Xflip = 1
    end
    if love.keyboard.isDown("a") then 
        dapperMan.velocity.X = -100
        dapperMan.Xflip = -1
    end
    if love.keyboard.isDown("w") and dapperMan.onGround == true then 
        dapperMan.velocity.Y = -350
        dapperMan.onGround = false
    end
    dapperMan.velocity.Y = dapperMan.velocity.Y + gravity * dt

    dapperMan.position.X = dapperMan.position.X + dapperMan.velocity.X * dt
    dapperMan.position.Y = dapperMan.position.Y + dapperMan.velocity.Y * dt

    dapperMan.position.Y = math.min(dapperMan.position.Y, 200)

    if dapperMan.position.Y == 200 then 
        dapperMan.onGround = true
    end
end

function dapperMan:draw()
    love.graphics.draw(
        dapperMan.texture,
        dapperMan.quad,
        dapperMan.position.X,
        dapperMan.position.Y,
        0,
        dapperMan.Xflip,
        1,
        dapperMan.width / 2,
        dapperMan.height
)
end




return dapperMan