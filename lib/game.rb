class Game

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  @@x_wins = []
  @@o_wins = []
  attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      self.player_1 = player_1
      self.player_2 = player_2
      self.board = board
    end

    def current_player
     self.board.turn_count.even? ? self.player_1 : self.player_2
    end

    def won?
      WIN_COMBINATIONS.find do |combo|
      combo.all? {|s| self.board.cells[s] == self.board.cells[combo[0]] && self.board.taken?(s + 1)}
      end
    end

    def draw?
      !won? && self.board.full?
    end

    def over?
      won? || draw?
    end

    def winner
       if won?
         self.board.cells[won?[0]]
       end
    end

    def turn
      self.board.display
      puts "Please enter 1-9, player #{self.current_player.token}"
      spot = self.current_player.move(self.board)
       if self.board.valid_move?(spot)
         self.board.update(spot, self.current_player)
       else
         puts 'Invalid Input or spot taken! Enter again!'
         self.turn
      end
    end

    def play
      until over?
        self.turn
      end
      if won?
        self.board.display
        puts "Congratulations #{self.winner}!"
        if self.winner == "X"
          @@x_wins << self.winner
        elsif self.winner == "O"
          @@o_wins << self.winner
        end

      elsif draw?
        self.board.display
        puts "Cat's Game!"
      end
    end

    def start_game
  puts "Hello Playuhs, time for Tic Tac Toe!"
  puts "Want to play 0, 1, or 2 player game orr type wargames for something crazy?"
  choice = gets.strip
  if choice == "0"
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    game.play
  elsif choice == "1"
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    game.play
  elsif choice == "2"
    game = Game.new
    game.play
  elsif choice == "wargames"
    100.times do
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.play
    end
    puts "X Won #{@@x_wins.length} times!"
    puts "O Won #{@@o_wins.length} times!"
  end
end


end
