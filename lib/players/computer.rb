module Players
  class Computer < Player

    def move(board)
      # First round: starting by placing the computer token strategically in the middle of the board
      # if the spot is available. Will either way start or block the game at the best spot
      if !board.taken?("5")
        "5"
      else
        priority(board) + 1
      end
    end

    def priority(board)
      win(board) || block(board) || best_random(board) || random
    end

      # In the priority order,we want to fill up a winning pair of ours to win
      def win(board)
         winning_pair = pair_win?(board, self.token)
           if winning_pair && winning_pair.count{|index| board.position(index+1) == self.token} == 2
           winning_pair.detect{|index| !board.taken?(index + 1)}
           end
       end

      # If no one shot win is possible, we want to block a potential win from the opponent.
      def block(board)
       winning_pair = pair_win?(board, self.opponent_token)
         if winning_pair && winning_pair.count{|index| board.position(index+1) == self.opponent_token} == 2
         winning_pair.detect{|index| !board.taken?(index + 1)}
         end
      end

      # Otherwise, we want to place our token next to another one of ours where the third spot of the winning combinaison is still available
      def best_random(board)
        winning_single = single_win?(board, self.token)
          if winning_single && winning_single.count{|index| board.position(index+1) == self.token} == 1
          winning_single.detect{|index| !board.taken?(index+1)}
          end
      end

      # In the case where no strategic move is possible, choose a random spot
      def random
        random_position = rand(9)
      end

#-------------- methods supporting the main ones-----------------

    # let us know what token the opponent is using
    def opponent_token
         self.token == "X" ? "O" : "X"
    end

    # brings up a pair of the same token that are a part of a winning combinaison.
    # This is used for both the block method (where we need to detect 2 consecutive opponent tokens)
    # and in the win method (where we need to detect 2 of our own tokens already set)
    def pair_win?(board, token)
      Game::WIN_COMBINATIONS.detect do |combinaison|
        (board.cells[combinaison[0]] == token && board.cells[combinaison[1]] == token &&
         board.cells[combinaison[2]] == " ") ||
        (board.cells[combinaison[1]] == token && board.cells[combinaison[2]] == token &&
         board.cells[combinaison[0]] == " ") ||
        (board.cells[combinaison[0]] == token && board.cells[combinaison[2]] == token &&
         board.cells[combinaison[1]] == " ")
       end
     end

     def single_win?(board, token)
       Game::WIN_COMBINATIONS.detect do |combinaison|
        (board.cells[combinaison[0]] == token && board.cells[combinaison[1]] == " " &&
         board.cells[combinaison[2]] == " ") ||
        (board.cells[combinaison[1]] == token && board.cells[combinaison[2]] == " " &&
         board.cells[combinaison[0]] == " ") ||
        (board.cells[combinaison[0]] == token && board.cells[combinaison[2]] == " " &&
         board.cells[combinaison[1]] == " ")
        end
      end

  end
end
