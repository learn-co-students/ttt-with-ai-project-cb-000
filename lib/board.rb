class Board
  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def reset!
    for i in 0..8
      @cells[i] = " "
    end
  end


  def display
    count = 0
    puts " #{@cells[count]} | #{@cells[count+1]} | #{@cells[count+2]} "
    puts bar
    count = 3
    puts " #{@cells[count]} | #{@cells[count+1]} | #{@cells[count+2]} "
    puts bar
    count = 6
    puts " #{@cells[count]} | #{@cells[count+1]} | #{@cells[count+2]} "
  end

  def position(value)
    return @cells[value.to_i-1]
  end

def update(pos,player)
  @cells[pos.to_i-1] = player.token
end

def full?
  return turn_count == 9
end

def turn_count
  count = 0
  for i in 0..8
    count += 1 if @cells[i] == "X" || @cells[i] == "O"
  end
  return count
end

def taken?(pos)
  value = pos.to_i-1
  return @cells[value] == "X" || @cells[value] == "O"
end

def valid_move?(pos)
  value = pos.to_i-1
  return false if value < 0
  return false if value > 8
  return !taken?(pos)
end

  def bar
    return "-----------"
  end
end
