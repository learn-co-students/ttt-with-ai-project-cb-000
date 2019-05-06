class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cell_number = input.to_i - 1
    return @cells[cell_number]
  end

  def full?
    @cells.each do |cell|
      return false if cell == " "
    end
    return true
  end

  def turn_count
    count = 0
    @cells.each do |cell|
      count += 1 unless cell == " "
    end
    return count
  end

  def taken?(input)
    cell_number = input.to_i - 1
    return (@cells[cell_number] == "X" || @cells[cell_number] == "O")
  end

  def valid_move?(input)
    cell_number = input.to_i - 1
    if cell_number < 0 || cell_number > 8 ||  @cells[cell_number] != " "
      puts "That move was invalid."
      puts "Please try again."
      sleep(1)
      puts ""
      return false
    else
      return true
    end
  end

  def update(input, player)
    cell_number = input.to_i - 1
    @cells[cell_number] = player.token if self.valid_move?(input)
  end

end
