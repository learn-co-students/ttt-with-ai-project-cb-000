class Board
  attr_accessor :cells

  def initialize(board = nil)
    if board == nil
      @cells = Array.new(9, " ")
    else
      @cells = board.cells
    end

  end

  def reset!
    i = 0
    while i < 9
      @cells[i] = " "
      i += 1
    end
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(input)
    @cells[input_to_index(input)]
  end

  def update(input, player)
    @cells[input_to_index(input)] = player.token
  end

  def full?
    !@cells.find { |position| (position == " " || position.nil?) }
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    i = input_to_index(input)
    !(@cells[i].nil? || @cells[i] == " ")
  end

  def valid_move?(input)
    input_to_index(input).between?(0,8) && !taken?(input)
  end
end
