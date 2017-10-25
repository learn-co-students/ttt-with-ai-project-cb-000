class Board
    attr_accessor :cells
    def initialize
        self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def reset!
        self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def token(index)
        self.cells[index] == "X" ? self.cells[index].colorize(:green) : self.cells[index].colorize(:yellow)
    end

    def display
        puts " #{token(0)} | #{token(1)} | #{token(2)} "
        puts "-----------"
        puts " #{token(3)} | #{token(4)} | #{token(5)} "
        puts "-----------"
        puts " #{token(6)} | #{token(7)} | #{token(8)} "
    end

    def position(input)
        cells[input.to_i - 1]
    end

    def full?
        self.cells.all? {|cell| cell == "X" || cell == "O"}
    end

    def turn_count
        self.cells.select {|cell| cell == "X" || cell == "O"}.size
    end
    
    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        input.to_i.between?(1, 9) && !taken?(input)
    end

    def update(input, player)
        self.cells[input.to_i - 1] = player.token
    end

    def available_moves
        cells.size.times.select {|index| cells[index] == " "}
    end
end