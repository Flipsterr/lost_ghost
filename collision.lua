local world = require ("world")

collision = {}


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


function collision.collideWithWorld(entity, dt, w)
    for x = #w, 1, -1
    do
        for  y = #w[1], 1, -1
        do
            if w [x] [y] == 1 then 
                rect = {}
                rect.X = y * 8 -4
                rect.Y = x * 8 
                rect.Width = 8
                rect.Height = 8
                solveCollision(entity, rect, dt)
            end
        end
    end
end

function IsTouchingLeft(entity, rect, dt)
    return left(entity.collider) + entity.velocity.X * dt < right(rect) and 
    right(entity.collider) > right(rect) and
    bottom(entity.collider) > top(rect) and
    top(entity.collider) < bottom(rect)
end

function IsTouchingRight(entity, rect, dt)
    return right(entity.collider) + entity.velocity.X * dt > left(rect) and 
    left(entity.collider) < left(rect) and
    bottom(entity.collider) > top(rect) and
    top(entity.collider) < bottom(rect)
end

function IsTouchingTop(entity, rect, dt)
    return top(entity.collider) + entity.velocity.Y * dt < bottom(rect) and 
    bottom(entity.collider) > bottom(rect) and
    right(entity.collider) > left(rect) and
    left(entity.collider) < right(rect)
end

function IsTouchingBottom(entity, rect, dt)
    return bottom(entity.collider) + entity.velocity.Y * dt > top(rect) and 
    top(entity.collider) < top(rect) and
    right(entity.collider) > left(rect) and
    left(entity.collider) < right(rect)
end

function solveCollision(entity, rect, dt)

    if IsTouchingLeft(entity, rect, dt) == true then
        entity.velocity.X = (right(rect) - left(entity.collider))/dt
    end
    if IsTouchingRight(entity, rect, dt) == true then
        entity.velocity.X = (left(rect) - right(entity.collider))/dt
    end
    if IsTouchingTop(entity, rect, dt) == true then
        entity.velocity.Y = (bottom(rect) - top(entity.collider))/dt
    end
    if IsTouchingBottom(entity, rect, dt) == true then
        entity.velocity.Y = (top(rect) - bottom(entity.collider))/dt

        entity.onGround = true;
    end
        
end


return collision