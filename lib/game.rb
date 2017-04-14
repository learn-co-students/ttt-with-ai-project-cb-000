require_relative './players/human.rb'

class Game
    WIN_COMBINATIONS =  [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    CORNERS = ["1","3","7","9"]
    EDGES = ["2","4","6","8"]
    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
        @player = []
        @computer = []
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
      if self.current_player.is_a?(Players::Human)
          move = self.current_player.move(self.board)
          if move == "reset"
            self.board.reset!
          else
            while !self.board.valid_move?(move)
              move = self.current_player.move(self.board)
            end
            self.board.update(move,self.current_player)
            self.board.display
            @player << move
            length = @player.length

          end
        elsif self.current_player.is_a?(Players::Computer)
=begin
                if @computer.length == 0
                  num = rand(1..10)
                   while num == 2 || num == 4 || num == 6 || num == 8 || num == 5 || num == 0 || num == 10
                     num = rand(1..10)
                   end
                   move = num
                elsif @computer.length == 1 && @player.last == "5"

                  if @computer.last == 1
                    move = 9
                  elsif @computer.last == 3
                      move = 7
                  elsif @computer.last == 7
                      move = 3
                  elsif @computer.last == 9
                      move = 1
                  end

                elsif (@computer.length == 1) && (@player.last == "1" || @player.last == "3" || @player.last == "7" || @player.last == "9")
                  num = rand(1..10)
                   while (num == 2 || num == 4 || num == 6 || num == 8 || num == 5 || num == 0 || num == 10) && !self.board.valid_move?(num)

                     num = rand(1..10)
                   end
                   move = num

                elsif (@computer.length == 1) && (@player.last == "2" || @player.last == "4" || @player.last == "6" || @player.last == "8")
                  num = rand(1..10)
                   while (num == 2 || num == 4 || num == 6 || num == 8 || num == 5 || num == 0 || num == 10) && !self.board.valid_move?(num)

                     num = rand(1..10)
                   end
                   move = num

                elsif @computer.length == 2
                  num = rand(1..10)
                   while (num == 2 || num == 4 || num == 6 || num == 8 || num == 5 || num == 0 || num == 10) && !self.board.valid_move?(num)

                     num = rand(1..10)
                   end
                   move = num
=end
                if @player.include?("1") && @player.include?("3") && self.board.valid_move?(2)
                    move = 2
                elsif @player.include?("1") && @player.include?("7") && self.board.valid_move?(4)
                  move = 4
                elsif @player.include?("7") && @player.include?("9") && self.board.valid_move?(8)
                  move = 8
                elsif @player.include?("3") && @player.include?("9") && self.board.valid_move?(6)
                  move = 6
                elsif @player.include?("1") && @player.include?("9") && self.board.valid_move?(5)
                  move = 5
                elsif @player.include?("3") && @player.include?("7") && self.board.valid_move?(5)
                  move = 5
                elsif @player.include?("2") && @player.include?("5") && self.board.valid_move?(8)
                  move = 8
                elsif @player.include?("8") && @player.include?("5") && self.board.valid_move?(2)
                  move = 2
                elsif @player.include?("3") && @player.include?("6") && self.board.valid_move?(9)
                  move = 9
                elsif @player.include?("6") && @player.include?("9") && self.board.valid_move?(3)
                  move = 3
                elsif @player.include?("1") && @player.include?("4") && self.board.valid_move?(7)
                  move = 7
                elsif @player.include?("4") && @player.include?("7") && self.board.valid_move?(1)
                  move = 1
                elsif @player.include?("1") && @player.include?("2") && self.board.valid_move?(3)
                  move = 3
                elsif @player.include?("2") && @player.include?("3") && self.board.valid_move?(1)
                  move = 1
                elsif @player.include?("3") && @player.include?("5") && self.board.valid_move?(7)
                  move = 7
                else


                move = self.current_player.move(self.board)
                while !self.board.valid_move?(move)
                  move = self.current_player.move(self.board)
                end
                  end






               self.board.update(move, self.current_player)
               self.board.display
               @computer << move.to_i


=begin
             else
               move = self.current_player.move(self.board)
               while !self.board.valid_move?(move)
                 move = self.current_player.move(self.board)
               end
               self.board.update(move,self.current_player)
               self.board.display
             end
=end
=begin
          if move == "reset"
            self.board.reset!
          else
            while !self.board.valid_move?(move)
              move = self.current_player.move(self.board)
            end
            self.board.update(move,self.current_player)
            self.board.display
          end
=end

        end
    end


    def play

      while !self.over?
        self.turn
      end
       if self.draw?
         puts "Cat's Game!"
       else
      puts "Congratulations #{self.winner}!"
       end
    end




end #end of Class
