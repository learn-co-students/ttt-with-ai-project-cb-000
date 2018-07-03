class Game
    include Players
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]]

    def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        @board.cells.count(" ").odd? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.each {|combo|
            if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[2]] != " "
                return combo
            end }
            return false
    end

    def draw?
        !won? && @board.cells.count(" ") == 0
    end

    def over?
        draw? || won?
    end

    def winner
        won? ? @board.cells[won?[0]] : nil
    end

    def turn
        puts "Enter move: "
        input = current_player.move(@board)
        @board.valid_move?(input) ? @board.position(input) : turn
    end

end
