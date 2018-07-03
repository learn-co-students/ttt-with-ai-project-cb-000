class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
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
    @cells[input.to_i - 1]
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count
    turn = 0
    @cells.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end

  def taken?(index)
    !(@cells[index.to_i - 1].nil? || @cells[index.to_i - 1] == " ")
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

end
