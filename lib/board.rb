 class Board

  def initialize(cells = nil)
    @cells = cells || Array.new(9, " ")
    puts "Welcome to TicTacToe!"
    display
  end

  attr_accessor :cells

  def full?
    !@cells.include?(" ")
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def taken?(pos)
    !(@cells[input_to_index(pos)].nil? || @cells[input_to_index(pos)] == " ")
  end


  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def update(pos, current_player)
    @cells[input_to_index(pos)] = current_player.token
  end

  def valid_move?(pos)
    pos.to_i.between?(1,9) && !taken?(pos)
  end

  def position(pos)
    @cells[input_to_index(pos)]
#    if valid_move?(index)
#      update(index, current_player)
#      display
#    else
#      position
#    end
  end

  def reset!
    @cells = Array.new(9, " ")
  end

end
