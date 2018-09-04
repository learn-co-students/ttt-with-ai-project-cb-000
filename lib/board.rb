require 'pry'

class Board
  attr_accessor :cells
  @cells = []

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n"
    puts "-----------\n"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
    puts "-----------\n"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
  end

  def position(input)
    adj_input = input.to_i - 1
    @cells[adj_input]
  end

  def full?
    @cells.all? {|token| token == "X" || token == "O"}
  end

  def turn_count
    @count = 0
    @cells.each do |i|
      @count +=1 if i != " "
    end
    @count
  end

  def taken?(index)
    index = index.to_i - 1
    !(@cells[index].nil? || @cells[index] == " ")
  end

  def valid_move?(index)
    index = index.to_i - 1
    index.between?(0,8) && !taken?(index + 1)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
