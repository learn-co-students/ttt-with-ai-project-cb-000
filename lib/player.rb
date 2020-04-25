class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def salutation
    self.token == "X" ? "Mr X" : "Miss O"
  end

end
