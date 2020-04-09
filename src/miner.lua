print("starting")

if not turtle.detect() then
    turtle.forward()
end

turtle.turnRight()
turtle.turnRight()

while not turtle.detectDown() do
    turtle.down()
    if turtle.compare() then
        turtle.place()
    end
end


print("Staircase Built")
