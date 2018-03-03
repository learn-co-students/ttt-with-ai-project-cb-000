class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, ' ')
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts '-----------'
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts '-----------'
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(cell)
    raise ArgumentError unless (1..9).cover?(cell.to_i)
    self.cells[cell.to_i - 1]
  end

  def full?
    ! self.cells.include?(' ')
  end

  def turn_count
    self.cells.count('X') + self.cells.count('O')
  end

  def taken?(cell)
    self.cells[cell.to_i - 1] == 'X' || self.cells[cell.to_i - 1] == 'O'
  end

  def valid_move?(cell)
    return false unless (1..9).cover?(cell.to_i)
    self.cells[cell.to_i - 1] == ' '
  end

  def update(cell, player)
    self.cells[cell.to_i - 1] = player.token if valid_move?(cell)
  end
end
