class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(index)
    self.cells[index.to_i - 1]
  end

  def full?
    self.turn_count == 9
  end

  def turn_count
    self.cells.select {|value| value != " "}.count
  end

  def taken?(index)
    self.position(index) != " "
  end

  def valid_move?(input)
    input_i = input.to_i
    input_i >= 1 && input_i <= 9 && !taken?(input)
  end

  def update(input, player)
    index = input.to_i - 1
    self.cells[index] = player.token
  end
end
