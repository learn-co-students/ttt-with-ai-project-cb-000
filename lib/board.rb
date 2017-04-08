class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end


  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} " "|" " #{@cells[1]} " "|" " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " "|" " #{@cells[4]} " "|" " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " "|" " #{@cells[7]} " "|" " #{@cells[8]} "
  end


  def position(input)
      input = input.to_i
      @cells[input-1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
     count = 0
     @cells.each do |space|
       if  space == "X" || space == "O"
              count += 1
            end
          end
          count
  end

  def taken?(index)
    index = index.to_i
    @cells[index - 1] == "X" || @cells[index - 1] == "O"
   end


   def valid_move?(index)
     index = index.to_i
     (index >= 1 && index <= 9) && (!taken?(index))
   end

   def update(index, player)
       index = index.to_i
       @cells[index-1] = player.token
   end



end
