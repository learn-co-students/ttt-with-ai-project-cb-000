class Player
  attr_reader :token

  @@all=[]

  def initialize(token)
    @token=token
    @@all << self
  end

  def self.both_computers?
    #These two lines of code don't work because the @@all stores
    #all players
    ##@@all.all? {|player| player.class==Players::Computer}
    ##@@all[0].class==Players::Computer && @@all[1].class==Players::Computer

    #If the last two players are computers.
    #In other words, the two most recent players are computers
    @@all[-1].class==Players::Computer && @@all[-2].class==Players::Computer
  end


end
