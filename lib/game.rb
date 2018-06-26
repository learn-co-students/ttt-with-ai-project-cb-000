require 'pry'


class Game

  attr_accessor :board, :player_1, :player_2, :cells
  attr_reader :token

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [2,4,6], [0,4,8], [0,3,6], [1,4,7], [2,5,8]]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          # win_combination # return the win_combination indexes that won.
          true
        end
      end
  end

  def draw?
  !won? && board.full?
end

def over?
  won? || draw?
end

def winner
   if won?
     WIN_COMBINATIONS.find do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
       position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
       position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

         if (position_1 == "X" && position_2 == "X" && position_3 == "X")
           return "X"
         elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
           return "O"
         end
       end
    end
end

def turn
		player = self.current_player

		position = self.current_player.move(self.board)
    while !self.board.valid_move?(position) do
      position = player.move(self.board)
    end
    self.board.update(position, player)
    self.board.display
	end

  def play
    until over? do
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end


end
