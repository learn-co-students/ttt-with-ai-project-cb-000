class Board
  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def reset!
    @cells.clear
    9.times do
      @cells << " "
    end
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    index = input_to_index(pos)
    @cells[index]
  end

  def taken?(position)
    index = input_to_index(position)
    !(@cells[index].nil? || @cells[index] == " ")
  end

  def full?  ## Checks for full board
    @cells.all? do |item|
      item == "X" || item == "O"
    end
  end

  def turn_count
    count = 0
    @cells.each do |occupied|
      if (occupied == "X" || occupied =="O")
        count += 1
      end
    end
    count
  end

  def valid_move?(input)
    index = input_to_index(input)
    if index.between?(0, 8) &&
      (@cells[index] == " " || @cells[index] == "" || @cells[index] == nil)
      return true
    else
      return false
    end
  end

  def update(move, player)
      @cells[move.to_i - 1] = player.token
  end

  def input_to_index(input)
    input.to_i - 1
  end

end
