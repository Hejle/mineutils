print("starting")
local lastslot = 16
local error = false
turtle.select(1)

function harvest()
    local success, data = turtle.inspectDown()
    if success then
        if data.name == minecraft:water then
            turtle.turnLeft()
            turtle.place()
            turtle.suck()
            turtle.suck()
            turtle.turnRight()
            turtle.suck()
            turtle.suck()
            return true
        else
            return false
        end
    else
        return false
    end
end

function moveFarming()
    local success, data = turtle.inspectDown()
    if success then
        if data.name == minecraft:cobblestone then
            turtle.turnLeft()
        end
        if data.name = minecraft:cobblestone then
            return false
        end
    end

    if not turtle.detect() then
        turtle.forward()
    else
        turtle.turnRight()
        return moveFarming()
    end
end

function getToFarm()

end

function returnItems()

end

for i=1, 20 do
    moveFarming()
    harvest()
end