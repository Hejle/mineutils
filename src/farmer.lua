print("starting")
local lastslot = 16
local error = false
local turned = false
local harvesting = true
local turningItemsIn = false
local storageFull = false
turtle.select(1)

function returnItems()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    for i=1, 6 do
        turtle.forward()
    end
    for i=2, 16 do
        if not storageFull then
            local success = turtle.dropDown(i)
            if not success then
                storageFull = true
            end
        end
    end
    turtle.turnRight()
    turtle.turnRight()
    for i=1, 6 do
        turtle.forward()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
end

--turtle.forward()
harvesting = false
turningItemsIn = true
while true do
    if harvesting then
        moveFarming()
        harvest()
    else if turningItemsIn then
        
        returnItems()
        if storageFull then
            print("Storage full")
            print("Turning off")
            os.shutdown()
        end
        print("Going to sleep")
        print("Harvesting in 200 seconds")
        os.sleep(200)
        turtle.forward()
        turningItemsIn = false
        harvesting = true
    end
end