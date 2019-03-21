class Board
    OPEN = " "

    attr_accessor :cells

    def initialize
        @cells=[]
        for i in 0 .. 8 do
            @cells << OPEN
        end

    end

    def availCells
        avail = []
        @cells.each_index {|x| @cells[x] == OPEN ? avail << x : false}
        avail          
        

    end

    def reset!
        #clears cells
        for i in 0 .. 8 do
            @cells[i] = OPEN
        end
        @cells
    end

    def display(cells = @cells)
        puts("")
        puts(" #{cells[0]} | #{cells[1]} | #{cells[2]} \n")
        puts("-----------")
        puts(" #{cells[3]} | #{cells[4]} | #{cells[5]} \n")
        puts("-----------")
        puts(" #{cells[6]} | #{cells[7]} | #{cells[8]} \n")
        puts("")

    end

    def position(pos)
        #pos is a string, convert to int
        @cells[pos.to_i-1]
    end


    def update(pos, playerObj)
        #updates cell with playerToken
        puts("Updating board for player #{playerObj.token} for cell #{pos.to_i}")
        @cells[pos.to_i - 1] = playerObj.token
    end

    def full?
        #boolean returning whether board is full
        retval = true
        @cells.each{ |c| retval = false unless c != OPEN }
        retval
 
    end
    def turn_count
        #returns number of positions filled on the board
        i = 0
        @cells.each { |c| i += 1 unless c == OPEN }
        i
    end

    def valid_move?(pos)
        #returns true if position is empty
        #validate string is digits
        if pos.scan(/\D/).empty? && pos.to_i <=9 && pos.to_i >=1
           # @cells[pos.to_i - 1] == OPEN ? true : false
           true
        else
            false
        end
    end

    def taken?(pos)
        @cells[pos.to_i - 1] == OPEN ? false : true
    end

end