class Game
  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [  [0,1,2], [3,4,5], [6,7,8],
[0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if self.board.turn_count.even?
      player_1
    else
     player_2
    end
  end

  def won?
     WIN_COMBINATIONS.detect do |combo|
       combo.all? {|index| self.board.cells[index] == self.board.cells[combo[0]] && self.board.taken?(index+1)}
     end
   end


   def draw?
     true if self.board.full? && self.won?.nil?
   end

   def over?
     true if self.draw? || self.won?
   end

   def winner
     if won?
       self.board.cells[won?[0]]
     end
   end

   def turn
     self.board.display
     puts "Please enter 1-9, player #{self.current_player.token}"
     move = self.current_player.move(self.board)
     if self.board.valid_move?(move)
       self.board.update(move, self.current_player)
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

      elsif draw?
        self.board.display
        puts "Cat's Game!"
      end
   end

   def start_game
     puts "Hello Playuhs, time for Tic Tac Toe!"
     puts "Want to play 0, 1, or 2 player game?"
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
     end
   end


end
