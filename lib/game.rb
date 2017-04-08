class Game

  attr_accessor :player_1, :player_2, :board
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"),
                 player_2 = Players::Human.new("O"),
                 board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @winner = nil
  end
  
  
  def current_player
    if @board.turn_count.even? 
      player_1
    elsif @board.turn_count.odd?
      player_2
    end
  end

  def over?
    if self.draw? || self.won?
      return true
    elsif !self.draw?
      return false
    end
    
  end

  def draw?
    if !self.won? && @board.full?
      true
    elsif self.won? && @board.full? 
      false
    elsif !@board.full?
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |wc| 
      test_pos = []
      test_pos << @board.cells[wc[0]]
      test_pos << @board.cells[wc[1]]
      test_pos << @board.cells[wc[2]]
      if test_pos.all? {|pos| pos == test_pos[0] && pos != " "}
        @winner = @board.cells[wc[0]]
        return true 
      end
    end
    return false
  end

  def winner
    return @winner if self.won?
  end

  def turn
    puts "Please enter a number (1-9): "
    input = self.current_player.move(@board)
    if !@board.valid_move?(input)
      self.turn
    else
      @board.update(input, self.current_player.token)
      @board.display
    end
  end

  def play
    
    
    while !self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat\'s Game!"
    end
    
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "Choose game mode (0,1,2) players: "
    input = gets.chomp
    
    until (0..2).include?(input.to_i) do
      puts "Please enter 0,1 or 3 to start:"
      input = gets.chomp
    end
    
    case input
    when "0"
      game = self.new(Players::Computer.new("X"),
                      Players::Computer.new("O"))
      game.play
      
    when "1"
      puts "who should play first you (1) or computer (2)? "
      choice_input = gets.chomp

      until (1..2).include?(choice_input.to_i) do
        puts "Please enter 2 or 1 :"
        choice_input = gets.chomp
      end

      case choice_input

      when "1"
        game = self.new(Players::Human.new("X"),
                        Players::Computer.new("O"))
        game.play
      when "2"
        game = self.new(Players::Computer.new("X"),
                        Players::Human.new("O"))
        game.play
      end
        
    when "2"
      game = self.new
      game.play
    end
    
    @board.display
  end
  
  
end
