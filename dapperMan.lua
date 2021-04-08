
local collision = require ("collision")
local door = require ("door")
local world1 = require ("world1")

dapperMan = {}

function dapperMan.load()
    dapperMan.texture = love.graphics.newImage("Assets/lost_ghost_dapper.png")
    dapperMan.position = {
        ["X"] = 100,
        ["Y"] = 100
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
    dapperMan.collider = {
        ["X"] = 0,
        ["Y"] = 0,
        ["Width"] = 8,
        ["Height"] = 14
    
    }

    dapperMan.colliderOffset = -5.3

end

function worldCollision(world)
    collision.collideWithWorld(dapperMan, dt, world)
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

    dapperMan.collider.X = dapperMan.position.X
    dapperMan.collider.Y = dapperMan.position.Y + dapperMan.colliderOffset

    collision.collideWithWorld(dapperMan, dt, world.tiles)

    dapperMan.position.X = dapperMan.position.X + dapperMan.velocity.X * dt
    dapperMan.position.Y = dapperMan.position.Y + dapperMan.velocity.Y * dt

    if door.position.X -8 < dapperMan.position.X and dapperMan.position.X < door.position.X + 8 and key == "e" then
        print("it worked!")
        world1.load()
        world1.draw()
        collision.collideWithWorld(dapperMan, dt, world.tiles1)
    end



end

function dapperMan.draw()
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