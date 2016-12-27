class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    if !@cells.include?(" ")
      true
    else
      false
    end
  end

  def turn_count
    i = 0
    @cells.each do |cell|
      if cell != " "
        i += 1
      end
    end
    i
  end

  def taken?(input)
    if self.position(input) != " "
      true
    else
      false
    end
  end

  def valid_move?(input)
    if self.taken?(input) || input.length > 1
      false
    else
      true
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token if self.valid_move?(input)
  end


end
