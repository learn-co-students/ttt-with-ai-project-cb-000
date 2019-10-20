class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def display
    puts ""
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts ""
  end

  def position(location)
    self.cells[location.to_i - 1]
  end

  def full?
    !self.cells.find { |element| element == ' ' }
  end

  def turn_count
    self.cells.count { |location| location != ' ' }
  end

  def taken?(index)
    index = index.to_i - 1
    if ((self.cells[index] == (' ')) || (self.cells[index] == ('')))
      false
    elsif self.cells[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if !(index.to_i - 1).between?(0,8)
      false
    elsif taken?(index)
      false
    else
      true
    end
  end

  def update(index, player)
    self.cells[index.to_i - 1] = player.token
  end

  # resets board to blank
  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

end
