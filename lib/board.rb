class Board
  
  attr_accessor :cells
  def initialize
    reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(user_input)
    @cells[user_input.to_i - 1]
  end
  
  def full?
    counter = 0
    @cells.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    counter == 9
  end
  
  def turn_count
    counter = 0
    @cells.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    counter
  end
  
  def taken?(user_input)
    if( position(user_input) == " " || position(user_input) == "" || position(user_input) == nil)
    return false
  else
    return true
  end
  end
  
  def valid_move?(user_input)
  if(user_input.to_i < 0 || user_input.to_i > 9 || user_input == "invalid")
    return false
  elsif((user_input.to_i >= 1 || user_input.to_i < 10) && !(taken?(user_input)))
    return true
  end
  end
  
  def update(user_input, player)
    @cells[user_input.to_i - 1] = player.token
    
  end
  
  
  
  
  
  
end