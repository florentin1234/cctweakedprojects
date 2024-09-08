local distanceDown = arg[1]

if tonumber(distanceDown) == nil then
    error("An argument is required!")
end

local fuelNeeded = distanceDown*256
print("More than ".. fuelNeeded.. " fuel will be used for this action, are you sure? (Y/N)")
term.setCursorPos(1,4)
term.write(">")

function lane()
    for i = 1, distanceDown do
        turtle.digDown()
        if i < distanceDown then
        turtle.down()
        end
    end
    for i = 1, distanceDown-1 do
        turtle.up()
    end
end

function mine()
    for i = 0, 16 do
        for i = 0, 15 do
            lane()
            turtle.forward()
        end
        if i % 2 == 1 then
            lane()
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
        else
            lane()
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
        end
    end
    term.clear()
    term.setCursorPos(1,1)
    term.write("Application terminated; Succesfully finished mining.")
    term.setCursorPos(1,2)
end

while true do
    local event, k = os.pullEvent("key")
    term.write(keys.getName(k))
    if k == keys.y then
        mine()
        break
    elseif k == keys.n then
        term.clear()
        term.setCursorPos(1,1)
        term.write("Application Terminated...")
        term.setCursorPos(1,2)
        break
    else
        term.write("               ")
        term.setCursorPos(15,4)
        term.write("(Invalid Input)")
        term.setCursorPos(2,4)
    end
end
