print("starting")

if not turtle.detect() do
    turtle.forward()
end

turtle.turnRight()
turtle.turnRight()

while not turtle.detectDown() do
    turtle.down()
    if turtle.compare() do
        turtle.place()
    end
end


print("Staircase Built")
