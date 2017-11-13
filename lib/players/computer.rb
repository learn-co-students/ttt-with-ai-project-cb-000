require "pry"
module Players
  class Computer < Player

    WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

    def initialize(token)
      super
      @opponent = @token == "X" ? "O" : "X" #Set Opposite
    end

    def move(board)
      if false && my_move = win_move?(board,@token) #Take te win
        (my_move+1).to_s
      elsif false && my_move = win_move?(board,@opponent) #Block opponent's win
        (my_move+1).to_s
      else
        (valid_moves(board).sample+1).to_s #Convert to Human understandable positions
      end
    end

    def valid_moves(board) #Returns Array indexes of valid moves
      #binding.pry
      board.cells.collect.with_index {|c, i|  i if c == " "}.compact
    end

    def win_move?(board, token)
      temp_cells = board.cells
      valid_moves(board).detect do |indx|
        temp_cells[indx] = "#{token}"
        WIN_COMBINATIONS.detect {|line| line.all? {|i| temp_cells[i] == token}}
        temp_cells[indx] = " "
      end
    end

  end
end
