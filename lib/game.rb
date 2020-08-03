require 'pry'

class Game
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(board=Board.new)
    @board = board
    start
  end

  def current_player
    if board.cells.count(player_1.token) == board.cells.count(player_2.token)
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      combo.all? { |square| board.cells[square] == player_1.token } ||
      combo.all? { |square| board.cells[square] == player_2.token }
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if !won?
      nil
    elsif won?.all? { |square| board.cells[square] == 'X'}
      'X'
    elsif won?.all? { |square| board.cells[square] == 'O'}
      'O'
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{board.turn_count}"
      board.display
      board.update(current_move, player)
      board.display
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

  def select_players
    puts "How many human players do you want to play this game? (enter number)"
    puts "(1) 0 human players (Computer vs Computer)"
    puts "(2) 1 human player (Human vs Computer)"
    puts "(3) 2 human players (Human vs Human)"

    selection = gets.chomp

    first_player = nil
    if selection == '2'
      puts "Who do you want to go first?"
      puts "(1) Human"
      puts "(2) Computer"
      first_player = gets.chomp
    end

    if selection == '1'
      @player_1 = Players::Computer.new('X')
      @player_2 = Players::Computer.new('O')
    elsif selection == '2' && first_player == '1'
      @player_1 = Players::Human.new('X')
      @player_2 = Players::Computer.new('O')
    elsif selection == '2' && first_player == '2'
      @player_1 = Players::Computer.new('X')
      @player_2 = Players::Human.new('O')
    elsif selection == '3'
      @player_1 = Players::Human.new('X')
      @player_2 = Players::Human.new('O')
    end
  end

  def start
    select_players
    play
  end

end
