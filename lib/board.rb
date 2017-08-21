class Board
	attr_accessor :cells

	def initialize
		@cells=[" "," "," "," "," "," "," "," "," "]
	end

	def reset!
		self.cells=[" "," "," "," "," "," "," "," "," "]
	end

	def display
		array=self.cells
		puts " #{array[0]} | #{array[1]} | #{array[2]} "
	  puts "-----------"
	  puts " #{array[3]} | #{array[4]} | #{array[5]} "
	  puts "-----------"
	  puts " #{array[6]} | #{array[7]} | #{array[8]} "
	end
	
	def position(num)
		self.cells[num.to_i-1]
	end

	def full?
    !self.cells.include?(" ")
  end

  def turn_count
  	self.cells.select{|cell| cell!=" "}.count
  end

  def taken?(num)
  	self.cells[num.to_i-1]!=" "
  end

  def valid_move?(num)
  	!self.taken?(num) && num.to_i-1>=0 && num.to_i-1<=8
  end

  def update(num, player)
  	self.cells[num.to_i-1]=player.token
  	num.to_s
  end

end

  



