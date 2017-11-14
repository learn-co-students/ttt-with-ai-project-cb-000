require "pry"
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

  def position(user_input)
    user_input = user_input.to_i - 1
    @cells[user_input]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    @cells.length - @cells.count(" ")
  end

  def taken?(input)
    taken = position(input)
    taken == "X" || taken == "O" ? true : false
  end

  def valid_input(input)
    input = input.to_i
    input.between?(1,9)
  end

  def valid_move?(input)
    valid_input(input) && !taken?(input) ? true : false
  end

  def update(position, player)
    position = position.to_i - 1
    @cells[position] = player.token
  end

end
