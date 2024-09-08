local fuelNeeded = 256
local chunkLaneSize = 16

if fuelNeeded > turtle.getFuelLevel() then
    error("You must have at least ".. fuelNeeded.. " fuel!")
end

function moveLane(mine, turner)
    for i = 1, chunkLaneSize do
        if mine == true then
        turtle.digDown()
        end
        --print(i)
        if i <= chunkLaneSize-1 then
        turtle.forward()
        else
        if turner < chunkLaneSize then
            if turner % 2 == 0 then
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
            else
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
            end
        --turtle.turnRight()
        --turtle.forward()
        --turtle.turnRight()
        else
            turtle.turnRight()
            for i = 1, 15 do
                turtle.forward()
            end
            turtle.turnRight()
        end
        end
     end
     if mine == true then
         turtle.down()
     end
end

for i = 1, chunkLaneSize do
moveLane(true, i)
end
