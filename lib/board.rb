require 'pry'

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
    isFull = true 
    @cells.each do |cell|
      if cell == " "
        isFull = false 
      end
    end
    isFull
  end
  
  def turn_count 
    turn = 0
    @cells.each do |cell|
      if(cell == "X" || cell == "O")
        turn += 1 
      end
    end
    turn
  end
  
  def taken?(pos)
    @cells[pos.to_i-1] == "X" || @cells[pos.to_i-1] == "O"
  end
  
  def valid_move?(move)
    if move.match(/\A[1-9]\z/) != nil
      if(@cells[move.to_i - 1] == " ")
        true 
      else
        false
      end
    else
      false
    end
  end
  
  def update(move, player)
    char = ""
    if turn_count.even?
      char = "X"
    else
      char = "O"
    end
    @cells[move.to_i - 1] = char
  end
end