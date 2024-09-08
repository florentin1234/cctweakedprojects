local pallete = {colors.yellow, colors.cyan, colors.green}
term.setBackgroundColor(pallete[2])
term.clear()

local bird = {5,5}
local velocity = {0,0}
local pipes = {8,12}
local pipesX = 50

local score = 0

function physics()
    bird[2] = bird[2] + velocity[2]
    velocity[2] = velocity[2] + 0.1
    
    if velocity[2] > 1 then
        velocity[2] = 1
    elseif velocity[2] < -1 then
        velocity[2] = -1
    end
    
    term.setBackgroundColor(pallete[3])
    
    for i = -pipes[1], 0 do
        term.setCursorPos(pipesX, pipes[1]+i)
        term.write(" ")
    end
    
    for i = pipes[2], 20 do
        term.setCursorPos(pipesX, i)
        term.write(" ")
    end
    
    pipesX = pipesX - 1
    
    if pipesX <= 0 then
        pipesX = 50
        pipes[1] = math.random(2,13)
        pipes[2] = pipes[1]+3
    end
    
    if bird[1] == pipesX and bird[2] < pipes[1] or bird[1] == pipesX and bird[2] > pipes[2] then
        term.setBackgroundColor(colors.black)
        term.clear()
        term.setCursorPos(1,1)
        term.write("Score : ".. score)
        term.setCursorPos(1,5)
        error("Game over!")
    end
    
    if bird[1] == pipesX + 1 then
        score = score + 1
    end
    
    sleep(0)
end

function drawScreen()
    term.setBackgroundColor(pallete[2])
    term.clear()
    term.setCursorPos(20, 1)
    term.write("Score : ".. score)
    term.setCursorPos(bird[1],bird[2])
    term.setBackgroundColor(pallete[1])
    term.write(" ")
    sleep(0)
end

function controller()
    os.pullEventRaw('key')
    velocity[2] = -1
    sleep(0)
end

while true do
    --sleep(0)
    --drawScreen()
    --controller()
    --physics()
    parallel.waitForAny(drawScreen, physics, controller)
end
