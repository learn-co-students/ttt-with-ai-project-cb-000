class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "

  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(place)
    !(@cells[place.to_i - 1] == " ")
  end

  def valid_move?(place)
    !full? && !taken?(place) && (1..9).include?(place.to_i)
  end

  def update(place, player)
    (@cells[place.to_i - 1] = player.token) if valid_move?(place)
  end

end
