class Board

  attr_accessor :cells


def initialize
  @cells = Array.new(9, " ")
end

# def cells=(array)
#
#   @board = array
# end

def reset!
  @cells = Array.new(9, " ")
end

def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

def position(input)
  @cells[input.to_i - 1]
end

# def full?
#   if @cells.any? {|x| x == " "}
#     false
#   elsif won? == false && !@cells.any? {|x| x == " "}
#     true
#   end
# end

def full?
  @cells.all? { |x| x != " "} ? true : false
end

def turn_count
  @cells.count { |x| x == "X" || x == "O"}
end

def taken?(input)
  position(input) == "X" || position(input) == "O"
end

def valid_move?(input)
  (1..9) === input.to_i && !taken?(input)
end

def update(input, player)
  @cells[input.to_i - 1] = player.token
end
end
