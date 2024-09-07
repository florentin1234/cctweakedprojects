
function actionAccepted(action)
local cmds = {"minePlatform.lua"}
    term.clear()
    term.setCursorPos(1,1)
    term.write("Action selected : ".. action)
    cursorDown()
    term.write("Fuel currently detected : ".. turtle.getFuelLevel())

    if action == 1 then
        while true do
            os.run(cmds, "minePlatform.lua")
        end
    elseif action == 2 then
        if turtle.getFuelLevel() < 2048 then
            startingGUI(3)
        else
            for i = 1, 8 do
                os.run(cmds, "minePlatform,lua")
            end
        end
    elseif action == 3 then
        if turtle.getFuelLevel() < 1024 then
            startingGUI(2)
        else
            for i = 1, 4 do
                --print(i)
                os.run(cmds, "minePlatform.lua")
            end
        end
    elseif action == 4 then
        if turtle.getFuelLevel() < 256 then
            startingGUI(2)
        else
            os.run(cmds, "minePlatform.lua")
        end
    end
end



function startingGUI(wrongMessage)
term.setCursorPos(1,1)
term.clear()
term.write("Chunk miner : Made by Florentinity")
term.setCursorPos(1,2)
term.write("How low do you want to mine?")
term.setCursorPos(1,4)

function cursorDown()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, y + 1)
end

term.write("(1) Whole chunk (Infinity blocks down)")
cursorDown()
term.write("(2) 8 Layers down")
cursorDown()
term.write("(3) 4 Layers down")
cursorDown()
term.write("(4) 1 Layer down")

    if wrongMessage == 1 then
        cursorDown()
        cursorDown()
        term.setTextColor(colors.red)
        term.write("Wrong Input!")
        term.setTextColor(colors.white)
    elseif wrongMessage == 2 then
        cursorDown()
        cursorDown()
        term.setTextColor(colors.red)
        term.write("Not enough fuel!")
        term.setTextColor(colors.white)
    end

local event, key = os.pullEvent("key")

if key >= 49 and key <= 52 then
    actionAccepted(key - 48)
else
    --term.getCursorPos(1,1)
    startingGUI(1)
end
end
startingGUI(0)
