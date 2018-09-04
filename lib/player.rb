class Player
  attr_reader :token
  @@players = []

  def initialize(token)
    @token = token
    @@players << self
  end
  
end
