class Player
  @token

  def initialize(token)
    if @token == nil
      @token = token
    end
  end

  def token
    @token
  end
end
