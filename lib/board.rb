class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def input_to_index(cell)
    cell.to_i - 1
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "==========="
    puts ""
  end

  def position(cell)
    cells[input_to_index(cell)]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    count = 0
    cells.each do |cell|
      count += 1 if cell != " "
    end
    count
  end

  def taken?(cell)
    position(cell) != " " ? true : false
  end

  def valid_move?(cell)
    !taken?(cell) if cell.to_i > 0 && cell.to_i <= 9
  end

  def update(cell, player)
    cells[input_to_index(cell)] = player.token
  end

end
