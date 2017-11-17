class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1=player_1
    @player_2=player_2
    @board=board
  end

  def current_player
    player = "ERROR"
    mod = @board.turn_count % 2
    player = @player_1 if mod == 0
    player = @player_2 if mod == 1
    player
  end #current_player

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |c|
      if @board.cells[c[0]] == @board.cells[c[1]] && @board.cells[c[0]] == @board.cells[c[2]]
        winner = c if @board.taken?(c[0]+1)
        return c if !winner.nil?
      end #if
    end #each
    winner
  end #won


  def over?
    over = false
    over = true if  won?
    over = true if  draw?
    over
  end #over?

  def draw?
    draw=false
    draw=true if (!self.won? && @board.full?)
    draw
  end #draw

  def winner
    return nil if self.won?.nil?
    winner_locations = self.won?
    @board.cells[winner_locations[0]]
  end #winner

  def turn
    player = current_player
    player_move=current_player.move(@board)
    if @board.valid_move?(player_move)
      @board.update(player_move, player)#update board
    else
      turn if !over?
    end #if
  end #turn2

  def play
    while !over?
      turn
      @board.display
    end
    if won?
      puts "Congratulations #{winner}!"
      # @board.display
    elsif draw?
      puts "Cat's Game!"
      # @board.display
    end
  end

end #class
