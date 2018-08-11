class Game 
attr_accessor :board, :player_1, :player_2
WIN_COMBINATIONS = [  [0, 1, 2], 
                       [3, 4, 5], 
                       [6, 7, 8], 
                       [0, 3, 6], 
                       [1, 4, 7], 
                       [2, 5, 8], 
                       [0, 4, 8], 
                       [2, 4, 6]]
                      


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      combo_num_1 = combo[0]
      combo_num_2 = combo[1]
      combo_num_3 = combo[2]
      cell_combo_1 = @board.cells[combo_num_1]
      cell_combo_2 = @board.cells[combo_num_2]
      cell_combo_3 = @board.cells[combo_num_3]

      if (cell_combo_1 == "X" && cell_combo_2 == "X" && cell_combo_3 == "X") || (cell_combo_1 == "O" && cell_combo_2 == "O" && cell_combo_3 == "O")
        return [combo_num_1, combo_num_2, combo_num_3] 
      end
    end
    false
  end

  def draw?
    if @board.full? && !won?
      true 
    else
      false
    end
  end
  
  def over? 
    if draw? || won?
      true 
    else 
      false 
    end
  end

  def winner 
    if(won?)
      @board.cells[won?[0]]
    end
  end
  
  def turn
    if(@board.turn_count.even?)
      puts "Player 1's Turn, '#{@player_1.token}'"
      move = @player_1.move(@board)
      if @board.valid_move?(move)
        @board.update(move, @player_1)
        @board.display
      end
    else
      puts "Player 2's Turn, '#{@player_2.token}'"
      move = @player_2.move(@board)
      if @board.valid_move?(move)
        @board.update(move, @player_2)
        @board.display
      end
    end
  end
  
  def play
    @board.display
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