class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " "
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts " "
  end

  def position(num)
    self.cells[num.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select { |cell| cell != " " }.size
  end

  def taken?(num)
    return true if position(num) == "X" || position(num) == "O"
    false
  end

  def valid_move?(num)
    return true if num.to_i.between?(1,9) && !taken?(num)
  end

  def valid_moves
    array = [1,2,3,4,5,6,7,8,9]
    array.select { |pos| self.cells[pos - 1] == " "}.map { |elem| "#{elem}" }
  end

  def update(num, player)
    self.cells[num.to_i - 1] = player.token
  end

  def empty_corner_cells
    array = [0,2,6,8]
    array.select { |sq| cells[sq] == " " }.map { |sq| (sq + 1).to_s }
  end

  def winning_move(player)
    Game::WIN_COMBINATIONS.each do |arr|
      result = [self.cells[arr[0]], self.cells[arr[1]], self.cells[arr[2]]]
        if result.count(player.token) == 2 && result.include?(" ")
          return (arr[0] + 1).to_s if self.cells[arr[0]] == " "
          return (arr[1] + 1).to_s if self.cells[arr[1]] == " "
          return (arr[2] + 1).to_s if self.cells[arr[2]] == " "
        end
    end
    nil
  end

end
