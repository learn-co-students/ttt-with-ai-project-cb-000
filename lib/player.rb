class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def subclass_to_s()
    return self.class.to_s.split("::")[1]
  end
end
