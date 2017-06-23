module Players

  class Human < Player
    attr_reader :token, :name

    def initialize(token, name="Human Player")
      @token = token
      @name = name
    end

    def move(arr)
      puts "Please enter 1-9:"
      return index = gets.strip
    end
  end #Closes Class Human



end
