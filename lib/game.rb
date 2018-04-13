class Game
  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [2, 5, 8],
                      [1, 4, 7],
                      [0, 4, 8],
                      [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    player_1.token == board.token ? player_1 : player_2
  end

  def over?
    board.full? ? true : false
  end

  def won?
      WIN_COMBINATIONS.any? do |combo|
        #binding.pry
#        if board.taken?(combo[0]-1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        if @board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
          return [combo[0],combo[1],combo[2]]
        end
      end
      return nil
  end

  def draw?
    board.full? && !won?
  end

  def winner
    #binding.pry
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter a number (1-9):"
    ui = gets.strip
  end

end










#index = input_to_index(ui)
#if valid_move?(index)
#  token = current_player
#  move(index, token)
#else
#  turn
#end
#display_board
