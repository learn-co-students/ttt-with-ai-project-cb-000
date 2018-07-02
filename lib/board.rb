class Board

    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
         puts " " + self.cells[0] + " | " + self.cells[1] + " | " + self.cells[2]+ " "
         puts "-----------"
         puts " " + self.cells[3] + " | " + self.cells[4] + " | " + self.cells[5]+ " "
         puts "-----------"
         puts " " + self.cells[6] + " | " + self.cells[7] + " | " + self.cells[8] + " "
    end

    def position(input)
        input = input.to_i - 1
        self.cells[input]
    end

    def full?
        !self.cells.include?(" ")
    end

    def turn_count
        9 - self.cells.count(" ")
    end

    def taken?(input)
        input = input.to_i - 1
        self.cells[input] != " "
    end

    def valid_move?(input)
        !taken?(input) && (1..9).include?(input.to_i)
    end

    def update(input, player)
        input = input.to_i - 1
        self.cells[input] = player[:token]
    end

end
