class Board

  attr_accessor :cells
  attr_reader


  def initialize
    self.cells = Array.new(9," ")
  end

  def reset!
    self.cells = Array.new(9," ")

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
    !self.cells.any? {|value| value == " "}
  end

  def turn_count
    self.cells.count {|value| value != " "}
  end

  def taken?(i)
    val = self.cells[i.to_i - 1]
    if val == "X" || val == "O"
      return true
    else
      return false
    end
  end

  def full?
  cells.all?{|token| token == "X" || token == "O"}
  end

  def valid_move?(i)
    i = i.to_i
    if i >= 1 && i <= 9
      !taken?(i)
    else
      false
    end
  end

  def update(spot, player)
    self.cells[spot.to_i - 1] = player.token
  end

end
