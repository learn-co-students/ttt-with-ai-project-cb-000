require 'pry'

class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    inside = "-" * 11
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts inside
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts inside
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
  end

  def position(num)
    @cells[num.to_i-1]
  end

  def full?
    @cells.none? { |x| x == " " }
  end

  def turn_count
    9 - @cells.count {|x| x == " "}
  end

  def taken?(num)
    !(self.cells[num.to_i - 1] == " ")
  end

  def valid_move?(num)
    num.to_i > 0 && !self.taken?(num)
  end

  def update(num, player)
    @cells[num.to_i - 1] = player.token
  end
end
