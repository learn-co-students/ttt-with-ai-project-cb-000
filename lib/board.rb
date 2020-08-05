class Board
  attr_accessor :cells

def initialize
  @cells= [" "," "," "," "," "," "," "," "," "]
end

def reset!
  @cells = [" "," "," "," "," "," "," "," "," "]

end


def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def full?
    self.cells.all? { |x| x=="O" || x == "X"  }


  end



  def turn_count
    counter = 0
    self.cells.each do |play|
      if play == "X" || play == "O"
        counter += 1
      end
    end
    return  counter
  end

  def input_to_index(user_input)
    number= user_input.to_i
    index = number-1
  end


  def taken?(index)
    index = input_to_index(index)
      if self.cells[index] == " " || self.cells[index] == "" || self.cells[index] == nil
         return false
      elsif self.cells[index] == "X" || self.cells[index] =="O"
         return true
      end
    end


  def  valid_move?(index)
    index = index.to_i
  if taken?(index) == false && index.between?(1,9)
    return true
  elsif taken?(index) == true && index.between?(1,9)
      return false

  end
end


    def position(index)
      index = input_to_index(index)
      return self.cells[index]
    end


    def update(position,player)
      self.cells[input_to_index(position)] = player.token
    end




end
