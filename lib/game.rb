class Game
    attr_accessor :player_1, :player_2, :board

    WIN_COMBINATIONS = [
        # Horizontal wins
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        # Up/down wins
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        # Diagonal wins
        [0, 4, 8],
        [8, 4, 0],
        [2, 4, 6],
        [6, 4, 2]
    ]

    CORNERS = [0, 2, 6, 8]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.turn_count.odd? ? player_2 : player_1
    end

    def over?
        won? || draw?
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[1]] == board.cells[win_combo[2]] && board.taken?(win_combo[0] + 1)
        end
    end

    def draw?
        !board.cells.include?(" ") && !won?
    end

    def winner
        board.cells[won?[0]] if won?
    end

    def turn
        input = current_player.move(board)

        if !board.valid_move?(input)
            puts "\nInvalid move. Try again."
            turn
        else
            board.update(input, current_player)
            board.display
            puts "\n \n"
        end
    end

    def wargame_turn 
        input = current_player.move(board)

        board.update(input, current_player)
    end

    def play
        while !over? && !won?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

    def wargames
        while !over? && !won?
            wargame_turn
        end
    end
end