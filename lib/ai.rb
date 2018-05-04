class AI
  DEFAULT_MOVE_VALUES = {'1'=> 1, '2'=> 0, '3'=> 1, '4'=> 0, '5'=> 5, '6'=> 0, '7'=> 1, '8'=>0, '9'=>1}
  attr_accessor :player, :board, :win_combos, :moves

  def initialize(player, board)
    @player = player
    @board = board
    @win_combos = Game::WIN_COMBINATIONS.clone
    @moves = DEFAULT_MOVE_VALUES.clone
  end

  def think
    moves.delete_if { |k, v| board.taken?(k.to_i) } #Remove invalid moves
    find_remaining_wins
    rank_moves
  end

  def find_remaining_wins
    win_combos.delete_if do |combo|
      squares = combo.collect { |i| board.cells[i] }
      squares.include?('X') && squares.include?('O')
    end
  end

  def rank_moves
    win_combos.each do |combo|
      open_moves = combo.collect { |i| i + 1 if !board.taken?(i + 1) }
      taken_cell_count = combo.count { |i| board.taken?(i + 1) }
      move_value = 10**taken_cell_count
      open_moves.each { |i| moves[i.to_s] += move_value if moves[i.to_s] }
    end
  end

  def pick_move
    moves.sort_by { |k, v| v }.reverse[0][0]
  end

end
