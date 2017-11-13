 class Board

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end

  attr_accessor :cells

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count{|token| token != " "}
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def taken?(pos)
    @cells[input_to_index(pos)] != " "
  end

  def valid_move?(pos)
    pos.to_i.between?(1,9) && !taken?(pos)
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def update(pos, current_player)
    @cells[input_to_index(pos)] = current_player.token
    display
  end

  def position(pos)
    @cells[input_to_index(pos)]
  end

  def reset!
    @cells = Array.new(9, " ")
  end

end
