collision = {}

function collider.update()
    dapperMan.collider = {
        ["X"] = 0,
        ["Y"] = 0,
        ["Width"] = 8,
        ["Height"] = 8,
    
    }

    cowman.Collider.X = cowman.Position.X
    cowman.Collider.Y = cowman.Position.Y
end




return collision