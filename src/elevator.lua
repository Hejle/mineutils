function moveToTop()
    local running = true
    while running do
        turtle.up()
        local success, data = turtle.inspect()
        if success then
            if data.name == "minecraft:stripped_spruce_log" then
                running = false
            end
        end
        os.sleep(1)
    end
end

function moveToBottom()
    while not turtle.detectDown() do
        turtle.down()
        os.sleep(1)
    end
end


while true do
    if rs.getInput("front") then
        moveToTop()
        os.sleep(5)
        moveToBottom()
    end
    os.sleep(2)
end