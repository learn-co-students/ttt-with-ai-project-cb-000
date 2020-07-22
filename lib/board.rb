class Board
  
  attr_accessor :cells, :player
  
  def initialize
  reset!
  end 

def reset!
  @cells = [" "," "," "," "," "," "," "," "," "]
end

def display
puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
puts "-----------"
puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
puts "-----------"
puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(input)
  return cells[(input.to_i - 1)]
end
  
  def full? 
      @cells.none?{|space| space == " "}
  end
  
  def turn_count
turns = 0

while turns <= 9

@cells.each do |position|
  if position == "X" || position == "O"
  turns += 1

end
end
return turns
end
end
  
  def taken?(position)
    p = position.to_i - 1
  if @cells[p] == " " 
  return @cells[p] != " "
  elsif @cells[p] == ""
  return @cells[p] != ""
  elsif @cells[p] == nil
  return @cells[p] != nil
  elsif @cells[p] == "X"
return true  
elsif @cells[p] == "O"
return true  
end
end
  
  def valid_move?(position)
     if taken?(position) != true && position.to_i <= 9 && position.to_i >= 1
   return true
end
  end
  
  def update(input, player)
    @cells[(input.to_i - 1)] = player.token
  end
  
  
end