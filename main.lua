-- initialize empty 3x3 table and player
Game_table = {{" "," "," "},{" "," "," "},{" "," "," "}}
local current_player = " "

-- game loop for tic tac toe
function Game_loop()
    -- game loop ends when true
    local end_game = false
    local turn = 1
    while not end_game do
        -- change player each turn
        current_player = Change_player(current_player)
        -- player moves
        Player_move(current_player)
        -- only check for a victory condition after 5 turns
        if turn > 4 then
            end_game = Check_victory()
        end
        -- if its turn 9 and no victory happened the game ends in a tie
        if turn == 9 then
            Print_Game_table()
            print("Tie!")
            return
        end
        turn = turn + 1
    end
    Print_Game_table()
    print("Player "..current_player.." Won!")
end

-- check each victory condition
function Check_victory()
    -- first row
    if Game_table[1][1] == Game_table[1][2] and Game_table[1][1] == Game_table[1][3]then
        return true
    end
    -- second row
    if Game_table[2][1] == Game_table[2][2] and Game_table[2][1] == Game_table[2][3]then
        return true
    end
    -- third row
    if Game_table[3][1] == Game_table[3][2] and Game_table[3][1] == Game_table[3][3]then
        return true
    end
    -- first column
    if Game_table[1][1] == Game_table[2][1] and Game_table[1][1] == Game_table[3][1]then
        return true
    end
    -- second column
    if Game_table[1][2] == Game_table[2][2] and Game_table[1][2] == Game_table[3][2]then
        return true
    end
    -- third column
    if Game_table[1][3] == Game_table[2][3] and Game_table[1][3] == Game_table[3][3]then
        return true
    end
    -- diagonals
    if Game_table[1][1] == Game_table[2][2] and Game_table[1][1] == Game_table[3][3]then
        return true
    end
    if Game_table[3][1] == Game_table[2][2] and Game_table[3][1] == Game_table[1][3]then
        return true
    end
    return false
end

-- change current player
function Change_player(current_player)
    -- changes between both players
    -- default first player is X
    if current_player == "O" or current_player == " " then
        return "X"
    end
    if current_player == "X" then
        return "O"
    end
end

-- make a player choose a valid position to play
function Player_move(current_player)
    -- moviment loop ends when true
    local end_moviment = false
    Print_Game_table()
    while not end_moviment do
        print("Enter the row you want to place the symbol "..current_player..":")
        local row = Enter_valid_slot()
        print("Enter the col you want to place the symbol "..current_player..":")
        local col = Enter_valid_slot()
        -- check if slot is available
        if Game_table[row][col] == " " then
            Game_table[row][col] = current_player
            end_moviment = true
        else
            print("Invalid! Please select an empty position.")
        end
    end
end

-- check if the player entered a valid posiiton in the table
function Enter_valid_slot()
    local slot = 0
    -- the player is stuck until a valid position is entered
    while (slot < 1 or slot > 3) do
        slot = io.read("*n")
        if (slot < 1 or slot > 3) then
            print("Not valid slot, choose a valid position!")
        end
    end
    return slot
end

-- Print the game table and each slot value
function Print_Game_table()
    print("   1  2  3 \n1 ["..Game_table[1][1].."]["..Game_table[1][2].."]["..Game_table[1][3].."]\n2 ["..Game_table[2][1].."]["..Game_table[2][2].."]["..Game_table[2][3].."]\n3 ["..Game_table[3][1].."]["..Game_table[3][2].."]["..Game_table[3][3].."]")
end

-- Game Start
Game_loop()