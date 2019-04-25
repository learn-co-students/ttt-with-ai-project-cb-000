class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    initialize
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all?{|cell| cell == "O" || cell == "X"}
  end

  def turn_count
    counter = 0

    self.cells.each{|cell| counter += 1 if cell == "X" || cell == "O"}
    counter
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O" ? true : false
  end

  def valid_move?(input)
    !taken?(input) && (input.to_i - 1).between?(0, 8) ? true : false
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end
end
