

class Board
  attr_writer :cells

  def initialize
    self.reset!
  end


  def cells
    @cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "-----------"
  end

  def position(num)
    return self.cells[num.to_i - 1]
  end

  def full?
    unless self.cells.include?(" ")
      return true
    end
  end

  def turn_count
    i = 0
    self.cells.each do |cell|
      if cell != " "
        i += 1
      end
    end
    i
  end

  def taken?(num)
    if self.cells[num.to_i - 1] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(num)
    if num.to_i >=1 && num.to_i <= 9
      if self.taken?(num)
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def update(position, player)
    i = position.to_i
    self.cells[i-1] = player.token
  end
end
