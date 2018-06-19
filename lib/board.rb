class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    index = position.to_i - 1
    cells[index]
  end

  def full?
    true if cells.all? { |cell| cell != " " }
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(position)
    index = position.to_i - 1
    if cells[index] != " "
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position.to_i >= 1 && position.to_i <= 9 && !taken?(position)
      true
    else
      false
    end
  end

  def update(position, player)
    index = position.to_i - 1
    cells[index] = player.token
    cells
  end
end
