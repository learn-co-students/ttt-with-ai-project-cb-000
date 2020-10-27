class Board

 attr_accessor :cells

  def initialize
    @cells = []
    reset!
  
  end



  def reset!
    @cells = Array.new(9, " ")
  end

  def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

  def position(input)
    index = input_to_index(input)
    cell_position = @cells[index]
    cell_position
  end

  def update(input, current_player)
    @cells[input.to_i - 1] = current_player.token
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    count = @cells.count{ |space| space == "X" || space == "O"}
    count

  end

  def taken?(input)
    cell_position = position(input)
    if cell_position != " "
      return true
    else false
    end
  end

  def valid_move?(input)
    input_to_index(input).between?(0,10) && !taken?(input)
  end

  def input_to_index(input)
    index = input.to_i - 1
  end


end
