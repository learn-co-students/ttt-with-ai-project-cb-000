require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def get_player_number
    puts "How many players? (0, 1 or 2)"
    input = gets.chomp
      if input != 0 
        puts "Please enter a valid number of players"
      end
    end


  def self.board
    board.cells
  end

  def player_1=(person)
    @player_1 = person
  end

  def player_1
    @player_1
  end

  def player_2=(person)
    @player_2 = person
  end

  def player_2
    @player_2
  end

  def current_player
    if board.turn_count.odd?
      player_2
    else
      player_1
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3  =="X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3  =="O"
          return win_combination
        end
      end
      return false
    end

  def draw?
    if won? != false
      return false
    else
      board.cells.all? {|token| token == "X" || token == "O"}
    end
  end

  def over?
    if won? != false
      return true
    elsif draw? == true
      return true
    end
  end

  def winner
    if over? == true
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
