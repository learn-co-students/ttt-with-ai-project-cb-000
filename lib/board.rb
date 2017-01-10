require 'pry'

class Board
  attr_accessor :cells
  attr_reader :position

  def initialize
    @cells = Array.new(9," ")
  end

  def display
    puts "\n\t\t #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "\t\t-----------"
    puts "\t\t #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "\t\t-----------"
    puts "\t\t #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} \n\n"
  end

  def display_help
    puts "\n\t\t 1 | 2 | 3 "
    puts "\t\t-----------"
    puts "\t\t 4 | 5 | 6 "
    puts "\t\t-----------"
    puts "\t\t 7 | 8 | 9 \n\n"
  end

  def position(cell)
    self.cells[cell.to_i - 1]
  end

  def turn_count
    self.cells.count {|c| !c.strip.empty?}
  end

  def taken?(location)
    self.position(location.to_i).strip != ""
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !self.taken?(index)
  end

  def update(move, player)
    self.cells[move.to_i - 1] = player.token
  end

  #Help method for Minimax
  def undo_move(move)
    self.cells[move.to_i - 1] = " "
  end

  def full?
    self.cells.all? {|c| !c.strip.empty?}
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def empty?
    self.cells.all? {|c| c.strip.empty?}
  end

end
