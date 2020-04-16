print("starting")
-- Made by Hejle
local lastslot = 16
local error = false
local turned = false
local harvesting = true
local turningItemsIn = false
local storageFull = false
turtle.select(1)

function harvest()
    local success, data = turtle.inspectDown()
    if success then
        if data.name == "minecraft:water" then
            turtle.turnLeft()
            turtle.place()
            turtle.suck()
            turtle.suck()
            turtle.turnRight()
            turtle.suck()
            turtle.suck()
        end
    end
end

function moveFarming()
    local success, data = turtle.inspectDown()
    if success then
        if data.name == "minecraft:cobblestone" then
            turtle.turnLeft()
        end
        if data.name == "minecraft:smooth_stone" then
            turningItemsIn = true
            harvesting = false
            return
        end
    end

    if not turtle.detect() then
        if turned then
            harvest()
            turned = false
        end
        turtle.forward()
    else
        turtle.turnRight()
        turned = true
        return moveFarming()
    end
end

function returnItems()
    turtle.up()
    turtle.forward()
    turtle.forward()
    turtle.turnleft()
    turtle.forward()
    turtle.forward()
    for i=1, 6 do
        turtle.forward()
    end
    for i=2, 16 do
        print("Dropping")
        if not storageFull then
            turtle.select(i)
            if turtle.getItemCount() > 0 then
                local success = turtle.dropDown()
                print(success)
                if not success then
                    storageFull = true
                end
            end
        end
    end
    turtle.select(1) -- Equipmentslot
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.down()
end

turtle.forward()
while true do
    if harvesting then
        moveFarming()
        harvest()
    elseif turningItemsIn then
        
        returnItems()
        if storageFull then
            print("Storage full")
            print("Turning off")
            os.shutdown()
        end
        turningItemsIn = false
        print("Going to sleep")
        print("Harvesting in 4 minuts")
        os.sleep(60)
        print("Harvesting in 3 minuts")
        os.sleep(60)
        print("Harvesting in 2 minuts")
        os.sleep(60)
        print("Harvesting in 1 minuts")
        os.sleep(60)
        harvesting = true
        turtle.forward()
    end
end