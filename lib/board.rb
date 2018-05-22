class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    self.cells[i2i(input)]
  end

  def full?
    self.cells.all? do |space|
     space != " "
    end
  end

  def turn_count
    count = []
    self.cells.each do |space|
       count << space if space != " "
    end
    count.length
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if i2i(input).between?(0,8) && !taken?(input)
      true
    else
      false
    end
  end

  def update(input, token)
      self.cells[i2i(input)] = token.token
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  def i2i(input)
    input.to_i - 1
  end


end
