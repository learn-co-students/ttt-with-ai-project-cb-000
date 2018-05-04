class Board
  attr_accessor :cells

  def initialize()
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.position(1)} | #{self.position(2)} | #{self.position(3)} "
    puts "-----------"
    puts " #{self.position(4)} | #{self.position(5)} | #{self.position(6)} "
    puts "-----------"
    puts " #{self.position(7)} | #{self.position(8)} | #{self.position(9)} "
  end

  def position(selection, symbol = nil)
    i = selection.to_i - 1
    self.cells[i] = symbol if symbol
    self.cells[i]
  end

  def update(selection, player)
    self.position(selection, player.token)
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select {|cell| cell != " " }.size
  end

  def taken?(selection)
    symbol = self.position(selection)
    symbol == "X" || symbol == "O"
  end

  def valid_move?(selection)
    selection.to_i.between?(1,9) && !self.taken?(selection)
  end

end
