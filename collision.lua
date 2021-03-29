collision = {}

require ("world")


function left(rect)
    return rect.X
end
function right(rect)
    return rect.X + rect.Width
end
function top(rect)
    return rect.Y
end
function bottom(rect)
    return rect.Y + rect.Height
end

function collision.update()
    dapperMan.collider = {
        ["X"] = 0,
        ["Y"] = 0,
        ["Width"] = 8,
        ["Height"] = 8,
    
    }

    dapperMan.collider.X = dapperMan.X
    dapperMan.collider.Y = dapperMan.Y
end

function collideWithWorld()
    for x = tablelength(world.tiles), 1, -1
    do
        if world.tiles [x] [y] == 1 then 
            rect = rectangle
            rect.x = y * 8 -4
            rect.y = x * 8 -8
            rect.width = 8
            rect.height = 8
            solveCollision(rect)
        end
    end
end

function IsTouchingLeft(rect)
    return left(dapperMan.collider) + dapperMan.velocity.X < right(rect) and 
    right(dapperMan.collider) > right(rect) and
    bottom(dapperMan.collider) > top(rect) and
    top(dapperMan.collider) < bottom(rect)
end

function IsTouchingRight(rect)
    return right(dapperMan.collider) + dapperMan.velocity.X > right(rect) and 
    left(dapperMan.collider) < left(rect) and
    bottom(dapperMan.collider) > top(rect) and
    top(cowman.collider) < bottom(rect)
end

function IsTouchingTop(rect)
    return top(dapperMan.collider) + dapperMan.velocity.y < bottom(rect) and 
    bottom(dapperMan.collider) > bottom(rect) and
    right(dapperMan.collider) > left(rect) and
    left(dapperMan.collider) < right(rect)
end

function IsTouchingBottom(rect)
    return bottom(dapperMan.collider) + dapperMan.velocity.y > top(rect) and 
    top(dapperMan.collider) < top(rect) and
    right(dapperMan.collider) > left(rect) and
    left(cowman.collider) < right(rect)
end

function solveCollision(rect)

    if touchesLeft(rect) == true then
        dapperMan.velocity.X = right(rect) - left(dapperMan.collider)
    end
    if IsTouchingRight(rect) == true then
        dapperMan.velocity.X = left(rect) - right(dapperMan.Collider)
    end
    if IsTouchingTop(rect) == true then
        dapperMan.velocity.Y = bottom(rect) - top(cowman.Collider)
    end
    if IsTouchingBottom(rect) == true then
        dapperMan.velocity.Y = top(rect) - bottom(dapperMan.Collider)

        cowman.OnGround = true;
    end
        
end


return collision