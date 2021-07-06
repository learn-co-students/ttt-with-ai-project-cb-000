class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n------------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n------------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i - 1]
  end

  def full?
    @cells.all?{|cell| cell != " "}
  end

  def turn_count
    @cells.select{|cell| cell == " "}.length / 2
  end

  def taken?(pos)
    @cells[pos.to_i - 1] == "X" || @cells[pos.to_i - 1] == "O"
  end

  def valid_move?(pos)
    pos = pos.to_i
    pos >= 1 && pos <= 9 && @cells[pos - 1] == " "
  end

  def update(pos, player)
    if valid_move?(pos)
      @cells[pos.to_i - 1] = player.token
    end
  end

end
