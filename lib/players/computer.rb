require 'pry-byebug.rb'

module Players
  class Computer < Player

    attr_accessor :token

    W = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

    X='X'

    #board[3] = X
    #board[4] = X
    #board[5] = X
    #board[0] = X
    #board[6] = X


    def move (board)
      desired_move = nil
      two_in_a_combo = count_of_a_combo?(token, board, 2)
      if two_in_a_combo
          combo = W[two_in_a_combo]
          combo.each do |index|
            if board.cells[index] == " "
              desired_move = index
            end
          end
      else
       one_in_a_combo = count_of_a_combo?(token, board, 1)
       if one_in_a_combo == 1
         combo = W[one_in_a_combo]
         combo.each do |index|
           if board.cells[index] == " "
             desired_move = index
             break
           end
         end
       end
       if desired_move == nil
          desired_move = rand(9) + 1
       end
      end
      desired_move.to_s
  end

    def count_in_combo(token, board)
      W.each do |combo|
        combo.each do |index|
          if board.cells[index] == token
          end
        end
      end
    end

    def build_combo_board(token, board)
      combo_board = Hash.new(8)
      W.each_with_index do |combo, outer_index|
          combo_board[outer_index] = [ board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]] 
      end
      combo_board
    end

    def count_of_a_combo?(token, board,desired_count)
       combo_board = build_combo_board(token, board)
       final = false
       combo_board.each do |index, spaces|
         count = spaces.count(X)
         if count == desired_count
           final =  index
           break
         end
       end
       final
      end
    end
  end
