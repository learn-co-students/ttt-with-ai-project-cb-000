class Board
  attr_accessor :cells

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(space)
    position = space.to_i-1
    @cells[position]
  end

  def full?
    @cells.all? {|c| c == "X" || c == "O"}
  end

  def turn_count
    count = 0
    @cells.each do |c|
      if c == "X" || c == "O"
        count += 1
      end
    end
      count
  end

  def taken?(space)
    space = space.to_i
    space -= 1
    @cells[space] == "X" || @cells[space] == "O" ? true : false
  end

  def valid_move?(move)
    move = move.to_i
    if move.between?(1,9)
      @cells[move-1] == "X" || @cells[move-1] == "O" ? false : true
    else
      false
    end
  end

  def update(space, player)
    @cells[(space.to_i)-1] = player.token
  end

end

# require_relative './config/environment'
# board = Board.new
# board.cells = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
# board.display
