Game_table = {{" "," "," "},{" "," "," "},{" "," "," "}}
local current_player = " "

function Game_loop()
    local end_game = false
    local turn = 1
    while not end_game do
        current_player = Change_player(current_player)
        Player_move(current_player)
        if turn > 4 then
            end_game = Check_victory()
        end
        turn = turn + 1
    end
    Print_Game_table()
    print("Player "..current_player.." Won!")
end

function Check_victory()
    if Game_table[1][1] == Game_table[1][2] and Game_table[1][1] == Game_table[1][3]then
        return true
    end
    if Game_table[2][1] == Game_table[2][2] and Game_table[2][1] == Game_table[2][3]then
        return true
    end
    if Game_table[3][1] == Game_table[3][2] and Game_table[3][1] == Game_table[3][3]then
        return true
    end
    if Game_table[1][1] == Game_table[2][1] and Game_table[1][1] == Game_table[3][1]then
        return true
    end
    if Game_table[1][2] == Game_table[2][2] and Game_table[1][2] == Game_table[3][2]then
        return true
    end
    if Game_table[1][3] == Game_table[2][3] and Game_table[1][3] == Game_table[3][3]then
        return true
    end
    if Game_table[1][1] == Game_table[2][2] and Game_table[1][1] == Game_table[3][3]then
        return true
    end
    if Game_table[3][1] == Game_table[2][2] and Game_table[3][1] == Game_table[1][3]then
        return true
    end
    return false
end

function Change_player(current_player)
    if current_player == "O" or current_player == " " then
        return "X"
    end
    if current_player == "X" then
        return "O"
    end
end

function Player_move(current_player)
    local end_moviment = false
    Print_Game_table()
    while not end_moviment do
        print("Enter the row you want to place the symbol "..current_player)
        local row = Enter_valid_slot()
        print("Enter the col you want to place the symbol "..current_player)
        local col = Enter_valid_slot()
        if Game_table[row][col] == " " then
            Game_table[row][col] = current_player
            end_moviment = true
        else
            print("Unavailable slot, currently occupied!")
        end
    end
end

function Enter_valid_slot()
    local slot = 0
    while (slot < 1 or slot > 3) do
        slot = io.read("*n")
        if (slot < 1 or slot > 3) then
            print("Not valid slot, choose a valid position!")
        end
    end
    return slot
end

function Print_Game_table()
    print("   1  2  3 \n1 ["..Game_table[1][1].."]["..Game_table[1][2].."]["..Game_table[1][3].."]\n2 ["..Game_table[2][1].."]["..Game_table[2][2].."]["..Game_table[2][3].."]\n3 ["..Game_table[3][1].."]["..Game_table[3][2].."]["..Game_table[3][3].."]")
end

Game_loop()