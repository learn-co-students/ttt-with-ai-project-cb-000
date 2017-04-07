class Board


attr_accessor :cells, :board

#test_________
# attr_reader :token
# ____________

  def initialize
    @cells = cells || Array.new(9, " ")
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

  def position(position)
    i = (position.to_i) - 1
    @cells[i]
  end

  def full?
    @cells.all? {|cell| cell != " "} ? true : false
  end

  def turn_count
    counter = 0
    for n in @cells
      if n != " " then counter += 1 end
    end
      counter
  end

  def taken?(position)
    i = position.to_i - 1
    @cells[i] == "X" || @cells[i] == "O"
  end

  def valid_move?(position)
    (1..9) === position.to_i && !taken?(position)
  end

  def update(position, player)
		self.cells[position.to_i - 1] = player.token
	end



end
