class Board

  attr_accessor :cells

def initialize
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def reset!
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
  puts  " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
  puts "-----------"
  puts  " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
  puts "-----------"
  puts  " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
end

def position(move)
  case move
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
  self.cells.each do |inq|
    if inq == " "
      return false
    elsif inq == "X" || "O"
      true
    end
  end
end

def turn_count
  count = 0
  self.cells.each do |inq|
    if inq != " "
      count +=1
    end
  end
    count
end

def taken?(place)
  if position(place) != " "
    return true
  else
    return false
  end
end

def valid_move?(input)
  validity = input
  if validity.between?("0", "9") && taken?(input) != true
    return true
  else
    return false
  end
end

def update(pos, player)
if valid_move?(pos)
 self.cells[pos.to_i - 1] = player.token
 end
end

end
