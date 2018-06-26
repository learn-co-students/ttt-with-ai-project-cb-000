=begin

Board methods:

  #initialize   - call #reset
  #cells        -
  #reset!       - clear board, 9 * ' '
  #display      - print boards current state
  #position     - arg '1' to '9', look up state in array and return value
  #update       - update board state - takes 2 * args - position(1st) and player instance(2nd)
                - calls #token to update the cells state
  #token        - player method - returns 'X' or 'O'
  #full?        - check if board full
  #turn_count   - number of turns taken
  #taken?       - returns true if postion is 'X' or 'O'
  #valid_move?  - ensure input is > 0

=end

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    print " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} \n"
    print "------------\n"
    print " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} \n"
    print "------------\n"
    print " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} \n"
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    !self.cells.any? {|value| value == ' '}
  end

  def turn_count
    count = 0
    self.cells.each {|value| count += 1 if value == 'X' || value == 'O'}
    count
  end

  def taken?(input)
    # self.cells[position.to_i - 1] == 'X' || self.cells[position.to_i - 1] == 'O'
    position(input) == 'X' || position(input) == 'O'
  end

  def valid_move?(position)
    (position.to_i > 0)? !self.taken?(position) : false
  end

  def update(position, player)
    if(valid_move?(position))
      self.cells[position.to_i - 1] = player.token
    end
  end

end
