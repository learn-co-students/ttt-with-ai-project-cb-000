require_relative '.\players\human.rb'

class Game
    WIN_COMBINATIONS =  [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def board
        @board
    end

    def current_player
        turn = self.board.turn_count
        if turn % 2 == 0
            player_1
        else
            player_2
        end
    end

    def won?
        win = false
        WIN_COMBINATIONS.each do |winArray|
            index1 = winArray[0]
            index2 = winArray[1]
            index3 = winArray[2]

            position1 = self.board.cells[index1]
            position2 = self.board.cells[index2]
            position3 = self.board.cells[index3]

            if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
                win = winArray
            end
        end #end of WIN_COMBINATIONS.each
        win
    end


    def draw?
        if won? != false
            false
        else
            full? && !won?
        end
    end

    def over?
        won? || draw? || full?
    end

    def full?
        self.board.full?
    end

    def winner

        if won? != false

            winComb = won?
            winner = self.board.cells[winComb[0]]
              if winner == self.player_1.token
                self.player_1.token
              else
                self.player_2.token
              end
        end

    end

    def turn
      move = self.current_player.move(self.board)
      while !self.board.valid_move?(move)
        move = self.current_player.move(self.board)
      end
      self.board.update(move,self.current_player)
      self.board.display





    end



end #end of Class
