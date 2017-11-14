class Player
  attr_accessor :winner
  attr_reader :token

  def initialize(token)
    @token = token
    @winner = false
  end


end
