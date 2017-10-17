class Player

  attr_reader :token
  attr_accessor :game, :board

  def initialize(token)
    @token = token
  end
end
