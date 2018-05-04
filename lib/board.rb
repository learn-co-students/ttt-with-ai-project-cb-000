class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def input_to_i(input)
    input.to_i
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
    @cells[input_to_i(input) - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count { |x| x == 'X' || x == 'O' }
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    (1..9).to_a.include?(input_to_i(input)) && !taken?(input_to_i(input))
  end

  def update(input, player)
    @cells[input_to_i(input) - 1] = player.token if valid_move?(input)
  end
end
