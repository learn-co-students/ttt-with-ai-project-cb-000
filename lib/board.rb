require 'pry'
class Board
  attr_accessor :cells

  def initialize
    # @cells = Array.new(9, " ")
    self.reset!
  end


  def reset!
    @cells = Array.new(9, " ")

  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(str) ##input strings 1-9
    #returns value of cell
    # @cells[str.to_i-1]
    @cells[str.to_i-1]
  end

  def full?
    # binding.pry
    !(@cells.include? (" "))
  end

  def turn_count
    #look at cell values, and count all X and O
    # binding.pry
    moves = @cells.find_all {|i| i == "O" || i == "X"}
    moves.size
  end

  def taken?(pos)
    position(pos) == "X" || position(pos) == "O"
  end

  def valid_move?(pos)
    pos.to_i > 0 && position(pos) == " "
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end


end
