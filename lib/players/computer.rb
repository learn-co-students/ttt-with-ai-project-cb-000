require 'pry'
module Players 
  class Computer < Player 
    
  WIN_COMBINATIONS = [  [0, 1, 2], 
                       [3, 4, 5], 
                       [6, 7, 8], 
                       [0, 3, 6], 
                       [1, 4, 7], 
                       [2, 5, 8], 
                       [0, 4, 8], 
                       [2, 4, 6]]
                       
    def move(board)
      # Algorithm from https://stackoverflow.com/questions/125557/what-algorithm-for-a-tic-tac-toe-game-can-i-use-to-determine-the-best-move-for
      move = check_win(board)
      move == nil ?  move = check_block(board) : move
      # check_fork
      # check_opponent_fork
      # check_center
      # check_opposite_corner
      # check_empty_corner
      # check_empty_side
      move == nil ?  move = choose_valid_move(board) : move
      
    end
    
    # passes test
    def check_win(board)
      move = nil
      WIN_COMBINATIONS.each do |combo|
        combo_num_1 = combo[0]
        combo_num_2 = combo[1]
        combo_num_3 = combo[2]
        cell_combo_1 = board.cells[combo_num_1]
        cell_combo_2 = board.cells[combo_num_2]
        cell_combo_3 = board.cells[combo_num_3]
        
        if cell_combo_1 == self.token && cell_combo_2 == self.token && board.valid_move?((combo_num_3 + 1).to_s)
          move = (combo_num_3 + 1).to_s
        elsif cell_combo_2 == self.token && cell_combo_3 == self.token && board.valid_move?((combo_num_1 + 1).to_s)
          move = (combo_num_1 + 1).to_s
        elsif cell_combo_1 == self.token && cell_combo_3 == self.token && board.valid_move?((combo_num_2 + 1).to_s)
          move = (combo_num_2 + 1).to_s
        end
      end
      move
    end
    
    # passes test
     def check_block(board)
      move = nil
      WIN_COMBINATIONS.each do |combo|
        combo_num_1 = combo[0]
        combo_num_2 = combo[1]
        combo_num_3 = combo[2]
        cell_combo_1 = board.cells[combo_num_1]
        cell_combo_2 = board.cells[combo_num_2]
        cell_combo_3 = board.cells[combo_num_3]
        
        other_token = "X"
        if(self.token == "X")
          other_token = "O"
        end
        
        if cell_combo_1 == other_token && cell_combo_2 == other_token && board.valid_move?((combo_num_3 + 1).to_s)
          move = (combo_num_3 + 1).to_s
        elsif cell_combo_2 == other_token && cell_combo_3 == other_token && board.valid_move?((combo_num_1 + 1).to_s)
          move = (combo_num_1 + 1).to_s
        elsif cell_combo_1 == other_token && cell_combo_3 == other_token && board.valid_move?((combo_num_2 + 1).to_s)
          move = (combo_num_2 + 1).to_s
        end
      end
      move
    end
    
    def choose_valid_move(board)
      9.times do |i|
        if(board.valid_move?(i.to_s))
          return i.to_s
        end
      end
    end
  end
end