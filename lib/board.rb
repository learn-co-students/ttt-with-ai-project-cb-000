class Board 
  attr_accessor :cells
  def initialize 
   @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
 
  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
 
  def display 
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(pos)
    @cells[pos.to_i-1]
  end
  
  def full?
  
  end
end