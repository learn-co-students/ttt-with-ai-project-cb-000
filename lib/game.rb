class Game
  include Players

  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [ [0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]
                      ]

    def initialize(player_1:nil, player_2:nil, board:nil)
      (player_1 == nil)? @player_1 = Human.new("X") : @player_1 = player_1
      (player_2 == nil)? @player_2 = Human.new("O") : @player_2 = player_2
      (board == nil)? @board = Board.new : @board = board
    end

    def current_player
      (self.board.turn_count.even?)? self.player_1 : self.player_2
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        if self.board.cells[combo[0]] != " " && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
          return combo
        end
      end
      false
    end

    def draw?
      if self.won?
        false
      elsif self.board.cells.detect{|cell| cell == " "}
        false
      else
        true
      end
    end

    def over?
      if self.won?
        true
      elsif self.draw?
        true
      else
        false
      end
    end

    def winner
      if self.won?
        if self.board.cells[self.won?[0]] == "X"
          "X"
        else
          "O"
        end
      else
        nil
      end
    end

    def turn
      index = self.current_player.move(self.board)
        if self.board.valid_move?(index)
          self.board.update(index, self.current_player)
          self.board.display
        else
          puts "That is not a valid move."
          self.turn
        end
     end

    def play
      self.turn until self.over?
          puts (self.winner)? "Congratulations #{self.winner}!" : "Cat's Game!"
    end

    def self.start
      puts "Welcome to Tic-Tac-Toe!"
      puts "Ctrl-C allows you to exit anytime."
      puts "How many players? 0, 1, or 2"
      h_players = gets.strip.to_i
      if h_players == 0
        player_c1 = Computer.new("X")
        player_c2 = Computer.new("O")
        Game.new(player_1:player_c1, player_2:player_c2).play
      elsif h_players == 1
        puts "Would you like to go first and be X? Yes or No"
        reply = gets.strip
        if reply == "Yes"
          player_c = Computer.new("O")
          Game.new(player_2:player_c).play
        elsif reply == "No"
          player_c = Computer.new("X")
          Game.new(player_1:player_c).play
        else
          puts "That is not a valid response."
          self.start
        end
      elsif h_players == 2
        puts "The first player will be X"
        Game.new.play
      else
        puts "That is not a valid response."
        self.start
      end
    end

end
