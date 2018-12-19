class Board

  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    self.reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def full?
    @cells.all?{|cell| cell != " "}
  end

  def turn_count
    @cells.select{|cell| cell != " "}.count
  end

  def taken?(pos)
    !(@cells[pos.to_i-1] == " ")
  end

  def valid_move?(pos)
    (1..9).include?(pos.to_i) && !self.taken?(pos)
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end

end
