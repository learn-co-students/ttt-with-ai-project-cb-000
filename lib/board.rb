class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(num)
    self.cells[num.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select { |cell| cell != " " }.size
  end

  def taken?(num)
    return true if position(num) == "X" || position(num) == "O"
    false
  end

  def valid_move?(num)
    return true if num.to_i.between?(1,9) && !taken?(num)
  end

  def update(num, player)
    self.cells[num.to_i - 1] = player.token
  end
end
