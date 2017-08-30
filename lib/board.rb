class Board

  attr_accessor :cells

  def initialize
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def position(pos)
    pos_sanitized = pos.to_i - 1
    cells[pos_sanitized]
  end

  def full?
    return true unless cells.any? { |pos| pos == ' ' }
  end

  def turn_count
    used_cells = cells.find_all { |pos| pos != ' ' }
    used_cells.length
  end

  def taken?(pos)
    pos_sanitized = pos.to_i - 1
    if cells[pos_sanitized] != ' '
      true
    else
      false
    end
  end

  def valid_move?(pos)
    pos_sanitized = pos.to_i - 1
    if pos_sanitized.between?(0, 8) && !taken?(pos)
      true
    else
      false
    end
  end

  def update(pos, player)
    # binding.pry

    pos_sanitized = pos.to_i - 1
    cells[pos_sanitized] = player.token
  end
end