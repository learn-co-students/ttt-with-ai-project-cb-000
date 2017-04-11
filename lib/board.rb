class Board
    attr_accessor :cells

    def initialize
        self.cells = [" "," "," "," "," "," "," "," "," "]
    end


    def reset!
        self.cells = [" "," "," "," "," "," "," "," "," "]
    end

    def display
        puts " #{self.cells[0]} " "|" " #{self.cells[1]} " "|" " #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} " "|" " #{self.cells[4]} " "|" " #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} " "|" " #{self.cells[7]} " "|" " #{self.cells[8]} "
    end


    def position(input)
        input = input.to_i
        self.cells[input-1]
    end

    def full?
        !self.cells.include?(" ")
    end

    def turn_count
        count = 0
        self.cells.each do |space|
            if  space == "X" || space == "O"
                count += 1
            end
        end
        count
    end

    def taken?(index)
        index = index.to_i
        self.cells[index - 1] == "X" || self.cells[index - 1] == "O"
    end


    def valid_move?(index)
        index = index.to_i
        (index >= 1 && index <= 9) && (!taken?(index))
    end

    def update(index, player)
        index = index.to_i
        self.cells[index-1] = player.token
    end




end
