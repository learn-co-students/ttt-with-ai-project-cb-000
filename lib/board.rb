
class Board
  @@empty_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  def empty_board
    @@empty_board
  end
  attr_accessor :cells
  def initialize
    @cells = @@empty_board
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(num)
    @cells[num.to_i - 1]
  end
  def full?
    !@cells.include?(" ")
  end
  def turn_count
    @cells.select {|a| a != " "}.size
  end
  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end
  def reset!
    @cells = empty_board
  end
  def taken?(pos)
    @cells[pos.to_i - 1] != " "
  end
  def valid_move?(pos)
    if pos.to_i < 1 || pos.to_i > 9
      return false
    elsif @cells[pos.to_i - 1] != " "
      return false
    else
      return true
    end
  end

end
