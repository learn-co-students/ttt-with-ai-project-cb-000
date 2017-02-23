class Board
  attr_accessor :cells
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    cells.all?{|x| x == "X" || x == "O"}
    # if all the cells are filled with either "X" of "O" return true, else return false
  end

# or more concise
  # def full?
  # 	cells.all?{|c| taken?(c)}
  # end
# that way you don't repeat logic that is the same twice

  # def turn_count
  #   y = []
  #   cells.each do |i|
  #     if i == "X" || i == "O"
  #       y << i
  #     end
  #   end
  #   y.count
  # end
  # a more elloquent way to do turn_count would be:
  def turn_count
    cells.count{|x| x == "X" || x == "O"}
  end

  # def taken?(move)
  #   x = move.to_i - 1
  #   if @cells[x] == "X" || @cells[x] == "O"
  #     true
  #   else
  #     false
  #   end
  # end
  def taken?(move)
    x = move.to_i - 1
    @cells[x] == "X" || @cells[x] == "O"
  end

  # def valid_move?(move)
  #   if move.to_i >= 1 && move.to_i <= 9 && !taken?(move)
  #     true
  #   end
  # end
  # more terse alt:
  def valid_move?(move)
    move.to_i.between?(1,9) && !taken?(move)
  end

  def update(move, player)
    @cells[move.to_i - 1] = player.token
  end

end
