print("starting")
local lastslot = 16
local startpos = 0
local notReturning = true
function checkselectedslot()
    local slot = turtle.getSelectedSlot()
    if turtle.getItemCount() > 0 then
        return true
    else
        if slot == lastslot then
            return false
        else
            slot++
            turtle.select(slot)
            return checkselectedslot()
        end

    end
end


if not turtle.detect() then
    turtle.forward()
    turtle.forward()
end

turtle.turnRight()
turtle.turnRight()

while not turtle.detectDown() and notReturning do
    if checkselectedslot() then
        turtle.down()
        turtle.place()
        startpos--
    else
        notReturning = false
    end
end

for i=startpos, 0 do
    turtle.up()
end

turtle.forward()
turtle.forward()
turtle.turnRight()
turtle.turnRight()

print("Staircase Built")
