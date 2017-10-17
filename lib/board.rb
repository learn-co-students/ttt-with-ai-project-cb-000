class Board

  attr_accessor :cells
  @cells = []

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def display
    top_row = " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    middle_row = " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    bottom_row = " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    divider = "-----------"
    puts top_row
    puts divider
    puts middle_row
    puts divider
    puts bottom_row
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.count { |c| c == "X" || c == "O"}
  end

  def taken?(input)
    cell = self.cells[input.to_i - 1]
    cell != " "
  end

  def valid_move?(input)
    if input.to_s.to_i >= 1 && input.to_s.to_i <= 9
      !taken?(input)
    else
      false
    end
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[input.to_i - 1] = "#{player.token}"
    end
  end
end
