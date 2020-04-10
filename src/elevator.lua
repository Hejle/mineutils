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
    end
end

function moveToBottom() {
    while not turtle.detectDown()
        turtle.down()
    end
}


while true do
    if rs.getInput("front") then
        moveToTop()
        os.sleep(5)
        moveToBottom()
    end
    os.sleep(2