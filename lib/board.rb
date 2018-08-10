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
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
 end
end