class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts ""
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts ""
  end

  def position(spot)
    self.cells[spot.to_i - 1]
  end

  def full?
    !self.cells.detect{|spot| spot == " "}
  end

  def turn_count
    self.cells.count{|spot| spot != " "}
  end

  def taken?(spot)
    self.position(spot) != " "
  end

  def valid_move?(spot)
    (1..9).to_a.include?(spot.to_i) && !self.taken?(spot)
  end

  def update(spot, player)
    if valid_move?(spot)
      self.cells[spot.to_i - 1] = player.token
    end
  end

end