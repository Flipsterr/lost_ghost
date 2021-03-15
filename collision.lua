collision = {}

function collider.update()
    dapperMan.collider = {
        ["X"] = 0,
        ["Y"] = 0,
        ["Width"] = 8,
        ["Height"] = 8,
    
    }

    dapperMan.Collider.X = dapperMan.Position.X
    dapperMAn.Collider.Y = dapperMAn.Position.Y
end

function collideWithWorld()
    for x = tablelength(world.tiles), 1, -1
    do
        if world.tiles[x][y] == 1 then
            tile = dapperMan.rect
            
    end
    
end


return collision