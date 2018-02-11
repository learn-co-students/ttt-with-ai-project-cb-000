# uninitialized constant Board
class Board
  # Board #cells has an attribute to store the cells of the board
  attr_accessor :cells
end



# Board #reset! can reset the state of the cells in the board

# Board #reset! sets the cells of the board to a 9 element array of " "

# Board #initialize sets the cells of the board to a 9 element array of " "

# Board #display prints the board

# Board #position takes in user input and returns the value of the board cell

# Board #full? returns true for a full board

# Board #full? returns false for an in-progress game

# Board #turn_count returns the amount of turns based on cell value

# Board #taken? returns true if the position is X or O

# Board #taken? returns false if the position is empty or blank

# Board #valid_move? returns true for user input between 1-9 that is not taken

# Board #update updates the cells in the board with the player token according to the input
