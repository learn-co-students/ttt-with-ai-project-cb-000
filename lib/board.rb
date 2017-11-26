
class Board

attr_accessor :cells

def initialize
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
end

def reset!
  self.cells.clear
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
end

def display
   puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
   puts "-----------"
   puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
   puts "-----------"
   puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
end

def position(input)
  case input
  when "1"
    self.cells[0]
  when "2"
    self.cells[1]
  when "3"
    self.cells[2]
  when "4"
    self.cells[3]
  when "5"
    self.cells[4]
  when "6"
    self.cells[5]
  when "7"
    self.cells[6]
  when "8"
    self.cells[7]
  when "9"
    self.cells[8]
  end
end

def full?
  !self.cells.include?(" ")
end

def turn_count
  self.cells.count {|c| c == "X" || c == "O"}
end

def taken?(input)
  move = position(input)
  move == "X" || move == "O" ? true : false
end

def valid_move?(input)
  valid_input = input.to_i.between?(1, 9)
  !taken?(input) && valid_input ? true : false
end

def update(position, player)
  position = position.to_i - 1
  self.cells[position] = player.token
end

end
