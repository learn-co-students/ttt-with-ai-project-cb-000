require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    system "clear"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.none? { |cell| cell == " "}
  end

  def turn_count
    cells.count { |cell| cell != " "}
  end

  def taken?(input)
    cells[input.to_i-1] == "X" || cells[input.to_i-1] == "O"
  end

  def valid_move?(input)
    (1..9).to_a.include?(input.to_i) && !taken?(input.to_i)
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end

end
