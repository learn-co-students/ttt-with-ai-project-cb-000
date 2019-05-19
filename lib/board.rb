class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def full?
    @cells.all? do |t|
      t == "X" || t == "O"
    end
  end

  def display
    puts " #{cells[0]} ""|"" #{cells[1]} ""|"" #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} ""|"" #{cells[4]} ""|"" #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} ""|"" #{cells[7]} ""|"" #{cells[8]} "
  end

  def position(input)
    p = (input.to_i)-1
    cells[p]
  end

  def turn_count
    cells.count{|t| t == "X" || t == "O"}
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input, player)
    p = (input.to_i)-1
    cells[p] = player.token
  end

end
