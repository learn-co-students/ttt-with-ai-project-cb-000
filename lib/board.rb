class Board
  attr_accessor :cells

  def initialize()
    self.reset!
  end

  def reset!()
    @cells = Array.new(9, " ")
  end

  TAB = "    "
  ROW_SEPARATOR = TAB + "-----------"

  def display()
    puts "** CURRENT BOARD **"
    row_index = 0
    while row_index < 3
      if (row_index > 0)
        puts ROW_SEPARATOR
      end
      display_row(cells[(row_index * 3), 3])
      row_index += 1
    end
    puts ""
  end

  def display_row(row)
    print TAB
    cell_index = 0
    while cell_index < 3
      if (cell_index > 0)
        print "|"
      end
      print (" #{row[cell_index]} ")
      cell_index += 1
    end
    print "\n"
  end

  def position(cell_position)
    return self.cells[cell_position.to_i - 1]
  end

  def full?()
    return !self.cells.include?(" ")
  end

  def turn_count()
    self.cells.count { |cell| cell != " " }
  end

  def taken?(position)
    index = position.to_i - 1
    return !(self.cells[index] == " ")
  end

  def valid_move?(position)
    if (position.to_i.between?(1, self.cells.size) && !taken?(position))
       return true
     else
       return false
     end
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token if valid_move?(position)
  end
end
