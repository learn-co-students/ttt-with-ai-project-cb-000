class Board
attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts ""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
  end

  def full?
    (self.cells.include?(" "))? false : true
  end

  def turn_count
    self.cells.select{|cell| cell == "X" || cell == "O"}.size
  end

  def taken?(index)
    (self.cells[index.to_i - 1] == "X" || self.cells[index.to_i - 1] == "O")? true : false
  end

  def position(index)
    self.cells[index.to_i - 1]
  end

  def valid_move?(index)
    if (1..9).include?(index.to_i)
      (self.taken?(index))? false : true
    else
      false
    end
  end

  def update(index, player)
    if self.valid_move?(index)
      self.cells[index.to_i - 1] = player.token
    end
  end

end
