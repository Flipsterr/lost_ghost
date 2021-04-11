local menu = {}

function loadMenu()
      title = {
        texture = love.graphics.newImage("Assets/title.png"),
        X = 600,
        Y = 500,
        width = 673,
        height = 514,
      }
      title.quad = love.graphics.newQuad(0, 0, title.width, title.height, title.texture:getWidth(), title.texture:getHeight())
    
      playButton = {
        texture = love.graphics.newImage("Assets/play_button.png"),
        X = 500,
        Y = 700,
        width = 295,
        height = 133,
      }
      playButton.quad = love.graphics.newQuad(0, 0, playButton.width, playButton.height, playButton.texture:getWidth(), playButton.texture:getHeight())
  
      tutorialButton = {
        texture = love.graphics.newImage("Assets/tutorial_button.png"),
        X = 600,
        Y = 900,
        width = 631,
        height = 136,
      }
      tutorialButton.quad = love.graphics.newQuad(0, 0, tutorialButton.width, tutorialButton.height, tutorialButton.texture:getWidth(), tutorialButton.texture:getHeight())
  

end
  
  
  
  function updateMenu()
    mx = love.mouse.getX()
    my = love.mouse.getY()
    if mx+150 > playButton.X*0.6 and mx+150 < playButton.X*0.6 + playButton.width and my+100 > playButton.Y*0.6 and my+100 < playButton.Y*0.6 + playButton.height*0.6 and love.mouse.isDown(1) == true then
      screen = 1
    end
    if mx+150 > tutorialButton.X*0.6 and mx+150 < tutorialButton.X*0.6 + tutorialButton.width and my+100 > tutorialButton.Y*0.6 and my+100 < tutorialButton.Y*0.6 + tutorialButton.height*0.6 and love.mouse.isDown(1) == true then
      screen = 2
    end
  end
  
function drawMenu()
    if screen == 0 then
      love.graphics.scale(0.6, 0.6)
      love.graphics.draw(title.texture,
      title.quad,
      title.X,
      title.Y,
      0,
      1,
      1,
      title.width/2,
      title.height
      )
  
      love.graphics.draw(
        playButton.texture,
        playButton.quad,
        playButton.X,
        playButton.Y,
        0,
        1,
        1,
        playButton.width/2,
        playButton.height
      )
  
      love.graphics.draw(
        tutorialButton.texture,
        tutorialButton.quad,
        tutorialButton.X,
        tutorialButton.Y,
        0,
        1,
        1,
        tutorialButton.width/2,
        tutorialButton.height
      )
    end
end

function loadTutorialScreen()
    tutorialScreen = {
        texture = love.graphics.newImage("Assets/tutorial_screen.png"),
        X = 0,
        Y = 0
    }
    tutorialScreen.width = tutorialScreen.texture:getWidth()
    tutorialScreen.height = tutorialScreen.texture:getHeight()
    tutorialScreen.quad = love.graphics.newQuad(0, 0, tutorialScreen.width, tutorialScreen.height, tutorialScreen.texture:getWidth(), tutorialScreen.texture:getHeight())
end

function updateTutorialScreen()
    if mx+150 > playButton.X*0.6 and mx+150 < playButton.X*0.6 + playButton.width and my+100 > playButton.Y*0.6 and my+100 < playButton.Y*0.6 + playButton.height*0.6 and love.mouse.isDown(1) == true then
        screen = 1
    end
end

function drawTutorialScreen()
    love.graphics.scale(0.6, 0.6)
    love.graphics.draw(
    tutorialScreen.texture,
    tutorialScreen.quad,
    tutorialScreen.X,
    tutorialScreen.Y,
      0,
      1,
      1,
      0,
      0
    )
    love.graphics.draw(
        playButton.texture,
        playButton.quad,
        playButton.X,
        playButton.Y,
        0,
        1,
        1,
        playButton.width/2,
        playButton.height
      )
end

  
  

return menu