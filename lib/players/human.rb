module Players
  class Human < Player

    def move(board)
      print "[MX+MO] Please enter 1-9 player #{self.salutation} >>"
      gets.strip
    end
  end
end
