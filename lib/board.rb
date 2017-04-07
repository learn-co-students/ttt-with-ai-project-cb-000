class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end


  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts 
  end
end
