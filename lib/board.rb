class Board
  attr_accessor :cells

  Horizontal = "-----------"
  Vertical = " | "

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    print " ", cells[0], Vertical, cells[1], Vertical, cells[2], " \n"
    puts Horizontal
    print " ", cells[3], Vertical, cells[4], Vertical, cells[5], " \n"
    puts Horizontal
    print " ", cells[6], Vertical, cells[7], Vertical, cells[8], " \n"
  end

  def valid_position? (position_of_interest)
    position_of_interest.to_i > 0 && position_of_interest.to_i < 10
  end

  def position (position_of_interest)
    if (valid_position? position_of_interest)
      @cells[position_of_interest.to_i - 1]  
    end
  end

  def full?
    @cells.all? { |cell| cell == 'X' || cell == 'O' }  
  end

  def turn_count
    @cells.count { |cell| cell == 'X' || cell == 'O' }  
  end

  def taken? (position_of_interest)
    position(position_of_interest) == 'X' || position(position_of_interest) == 'O'
  end

  def valid_move? (desired_position)
    !(position(desired_position) == 'X' || position(desired_position) == 'O') && valid_position?(desired_position)
  end

  def update(position_of_interest, player)
    if valid_move? position_of_interest  
      @cells[position_of_interest.to_i - 1] = player.token
    end
  end

end
