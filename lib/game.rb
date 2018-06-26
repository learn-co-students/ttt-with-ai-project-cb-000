class Game 
  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #diagonal
    [2, 4, 6] #diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
  end 

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2 
  end

  def over?
    won? || draw?
  end 

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

    def winner 
      if victor = won?
        @winner = @board.cells[victor.first]
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
      while !over?
        turn
      end
      if won? 
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
    end
  end
end