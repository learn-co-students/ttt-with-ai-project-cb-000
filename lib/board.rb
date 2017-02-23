require 'pry'
class Board
  attr_accessor :cells

  @cells = []

  def initialize
    self.reset! #=> Stars a new game with a fresh board.
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input) #=> Returns the correct position in the array. ("X"||"O"| " ")
    cells[input.to_i-1]
  end

  def full? #=> Returns true/false.
    !cells.include?(" ")
  end

  def turn_count #=> Returns_an_i of the total moves so far in the game.
    cells.count{|x| x == "X" || x == "O"}
  end

  def taken?(position) #=> Returns true/false.
    self.position(position) == "X" || self.position(position) == "O"
  end

  def valid_move?(move) #=> Returns true/false.
    move.to_i.between?(1,9) && !taken?(move)
  end

  def update(move, player)
    cells[move.to_i - 1] = player.token
  end

end
