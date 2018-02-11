# uninitialized constant Board
class Board
  # Board #cells has an attribute to store the cells of the board
  attr_accessor :cells

  # Board #initialize sets the cells of the board to a 9 element array of " "
  def initialize()
    reset!
  end

  # Board #reset! sets the cells of the board to a 9 element array of " "
  # Board #reset! can reset the state of the cells in the board
  def reset!
    @cells = Array.new(9, " ")
  end

  # Board #display prints the board
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  # Board #position takes in user input and returns the value of the board cell
  def position(input)
    cells[input.to_i-1]
  end

  # Board #full? returns true for a full board
  # Board #full? returns false for an in-progress game
  def full?
    cells.all? {|value| value == "X" || value == "O"}
  end
end









# Board #turn_count returns the amount of turns based on cell value

# Board #taken? returns true if the position is X or O

# Board #taken? returns false if the position is empty or blank

# Board #valid_move? returns true for user input between 1-9 that is not taken

# Board #update updates the cells in the board with the player token according to the input
