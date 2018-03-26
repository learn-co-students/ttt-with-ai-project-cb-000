class Board
  attr_accessor :cells

  def initialize

     @cells = cells || Array.new(9, " ")
  end
  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end
  def full?
    @cells.all? do |cell|
          cell == "X" || cell == "O"
        end
  end
  def turn_count
    @cells.count{|c| c == "X" || c == "O"}
  end
  def taken?(n)
    @cells[n.to_i - 1] == "X" || @cells[n.to_i - 1] == "O"
  end
  def valid_move?(n)
    n.to_i.between?(1,9) && !taken?(n)
  end
  def update(n, player)
    @cells[n.to_i - 1] = player.token
  end

end
