require "pry"
class Board

	attr_accessor :cells

	def initialize
		@cells = Array.new 9, " "

	end

  def reset!
		self.cells = Array.new 9, " "
  end

	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
		puts "-----------"
		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	end

	def position(index)
		position = index.to_i - 1
		self.cells[position]
	end

	def full?
		true if self.cells.all? {|element| element !=" "}
	end

	def turn_count
		self.cells.count {|element| element == "X" || element == "O"}
	end

	def taken?(position)
		# Convert user input to array index
		index = position.to_i - 1
		self.cells[index] == "X" || self.cells[index] == "O" ? true : false
	end

	def valid_move?(position)
		true unless self.full? || self.taken?(position) || !position.to_i.between?(1,9)
	end


	def update(position, player)
		if valid_move?(position)
			self.cells[position.to_i - 1] = player.token 

		end
	end

end
