
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

  
    ball = {
        x = 390,
        y = 290,
        width = 20,
        height = 20,
        dx = 40,
        dy = 150
    }
end


function checkCollision(a, b)
    return a.x < b.x + b.width
       and a.x + a.width > b.x
       and a.y < b.y + b.height
       and a.y + a.height > b.y
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

   
    ball.x = ball.x + ball.dx * dt
    ball.y = ball.y + ball.dy * dt

  
    if ball.y <= 0 then
        ball.y = 0
        ball.dy = -ball.dy
    end

   
    if ball.y + ball.height >= 600 then
        ball.y = 600 - ball.height
        ball.dy = -ball.dy
    end

  
    if ball.dx < 0 and checkCollision(ball, player1) then
        ball.x = player1.x + player1.width
        ball.dx = -ball.dx
    end

   
    if ball.dx > 0 and checkCollision(ball, player2) then
        ball.x = player2.x - ball.width
        ball.dx = -ball.dx
    end
end

function love.draw()

   
    love.graphics.setColor(0, 0.5, 1)
    love.graphics.rectangle(
        "fill",
        player1.x,
        player1.y,
        player1.width,
        player1.height
    )

    love.graphics.setColor(1, 0.2, 0.2)
    love.graphics.rectangle(
        "fill",
        player2.x,
        player2.y,
        player2.width,
        player2.height
    )

 
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle(
        "fill",
        ball.x,
        ball.y,
        ball.width,
        ball.height
    )
end
