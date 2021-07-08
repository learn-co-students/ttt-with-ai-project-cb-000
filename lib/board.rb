require "pry"

class Board

  def initialize
    self.reset!
  end

  def cells
    @board
  end

  def cells=(board)
    @board = board
  end

  # def board
  #   @board
  # end

  def reset!
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
  end


  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "--------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "--------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position(n)
    @board[n.to_i - 1]
  end


  def full?
    !@board.include?(" ")
  end

  def turn_count
    turns = @board.select {|x| x != " " }
    turns.size
  end

  def taken?(tile)
    @board[tile.to_i - 1] == " " ? false : true
  end

  def valid_move?(tile)
    tile.to_i > 0 && tile.to_i <= 9 ? !self.taken?(tile) : false
  end


  def update(tile, player)
    # binding.pry
    if valid_move?(tile)
      @board[tile.to_i - 1] = player.token
    end
  end

end
