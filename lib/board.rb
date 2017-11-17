class Board
  attr_accessor :cells

  def initialize
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end #init

  def reset!
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end #reset!

  def display
    puts "-----------"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(pos)
    pos=pos.to_i
    @cells[pos-1]
  end #position

  def full?
    all_spaces_taken = true
    @cells.each {|cell| all_spaces_taken=false if cell==" "}
    all_spaces_taken
  end

  def turn_count
    count=0
    @cells.each { |cell| count+=1 if cell!=" "}
    count
  end #turn_count

  def taken?(pos)
    pos=pos.to_i
    taken=false
    if @cells[pos-1]!=" "
      taken = true
    end
    taken
  end

  def valid_move?(pos)
    if pos >= "1" && pos <= "9"
      valid = !self.taken?(pos)
    end
    valid
  end

  def update(pos,player)
        pos=pos.to_i
        @cells[pos-1]=player.token
  end #update
end #class
