class Board
  # ui -> user input
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(ui)
    @cells[ui.to_i - 1]
  end

  def update(ui,player)
    @cells[ui.to_i - 1] = token
  end

  def token
    turn_count.even? ? "X" : "O"
  end

  def full?
    @cells.all?{|c| c != " " }
  end

  def turn_count
    @cells.count{|c| c != " " }
  end

  def taken?(i)
    #binding.pry
    position(i) != " " ? true : false
    #@cells[i] != " " ? true : false
  end

  def valid_move?(ui)
    !taken?(ui) && ui.between?('1','9')
  end

end
