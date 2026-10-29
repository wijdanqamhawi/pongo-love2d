
function love.load()
    love.window.setMode(800, 600)
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)

    player1 = {
        x = 30,
        y = 250,
        width = 20,
        height = 100,
        speed = 300
    }

  
    player2 = {
        x = 750,
        y = 250,
        width = 20,
        height = 100,
        speed = 300
    }
end

function love.update(dt)

   
    if love.keyboard.isDown("w") then
        player1.y = player1.y - player1.speed * dt
    end

    if love.keyboard.isDown("s") then
        player1.y = player1.y + player1.speed * dt
    end

    
    if love.keyboard.isDown("up") then
        player2.y = player2.y - player2.speed * dt
    end

    if love.keyboard.isDown("down") then
        player2.y = player2.y + player2.speed * dt
    end

   
    player1.y = math.max(
        0,
        math.min(player1.y, 600 - player1.height)
    )


    player2.y = math.max(
        0,
        math.min(player2.y, 600 - player2.height)
    )

end

function love.draw()
    love.graphics.setColor(1, 1, 1)

  
    love.graphics.rectangle(
        "fill",
        player1.x,
        player1.y,
        player1.width,
        player1.height
    )

   
    love.graphics.rectangle(
        "fill",
        player2.x,
        player2.y,
        player2.width,
        player2.height
    )
end
