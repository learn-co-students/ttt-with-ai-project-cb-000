class Board

  def initialize
    @cells = Array.new(9, " ")
  end
  
  def cells
    @cells
  end

  def cells=(cells)
    @cells = cells if cells.is_a?(Array)
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
    input_no = input.to_i - 1
    if (0..8).include?(input_no)
      @cells[input_no]
    end
  end

  def full?
    !@cells.include?(" ") 
  end

  def turn_count
    occupied_pos = @cells.find_all {|cell| cell == "X" || cell == "O"}
    occupied_pos.count
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move?(input)
     return !taken?(input) if (1..9).include?(input.to_i)
  end

  def update(input, player_token)
    if valid_move?(input)
      self.turn_count.even? ?  @cells[input.to_i - 1] = "X" : @cells[input.to_i - 1] = "O"

    end
  end
  
end
