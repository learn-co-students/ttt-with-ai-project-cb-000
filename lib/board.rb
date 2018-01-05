class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(n)
    @cells[n.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @cells.select {|cell| cell != " "}.size
  end

  def taken?(n)
    self.position(n) != " "
  end

  def valid_move?(n)
    n = n.to_i
    return false if n == 0
    n.between?(1, 9) && !taken?(n)
  end

  def update(n, player)
    @cells[n.to_i - 1] = player.token
  end

end
