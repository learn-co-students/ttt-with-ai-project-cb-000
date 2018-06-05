class Board

  attr_accessor :cells

  def initialize
    @cells = cells
    self.cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

  def position(input)
    cells[convert(input)]
  end

  def full?
    cells.all? do |s|
      s != " "
    end
  end

  def turn_count
    cells.select do |c|
      c != " "
    end.length
  end

  def taken?(input)
    self.position(input) != " "
  end

  def valid_move?(input)
    !self.taken?(input) && input.to_i >= 1 && input.to_i <= 9
  end

  def update(input, player)
      cells[convert(input)] = player.token
  end

  def convert(input)
    input.to_i - 1
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

end
