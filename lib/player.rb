class Player
  attr_accessor :opponent
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def find_player_positions(board)
    positions = []
    board.cells.each_with_index do |value, index|
      positions << index if value == self.token
    end
    positions
  end
end
