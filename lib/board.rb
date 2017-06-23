class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    return @cells[input_to_index(num)]
  end

  def input_to_index(x)
    a=x.to_i - 1
  end

  def full?
    @cells.all? do |code|
      (code == "X" || code == "O")
    end
  end

  def turn_count
    counter = 0
    @cells.each do |a|
      counter += 1 if (a == "X" || a == "O")
    end
    counter
  end

  def taken?(num)
    !(self.position(num).nil? || self.position(num) == " ")
  end

  def valid_move?(index)
    if index.between?("1","9")
      if !(taken?(index))
        return true
      end
    end
    return false
  end

  def update(index, player)
    if valid_move?(index)
      @cells[input_to_index(index)] = player.token
    end
  end
end
