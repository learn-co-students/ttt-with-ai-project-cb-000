module Players

  class Human < Player
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def move(arr)
      puts "Please enter 1-9:"
      return index = gets.strip
    end
  end #Closes Class Human



end
