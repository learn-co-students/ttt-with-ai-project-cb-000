case @player[length - 1]
when "5"
  possible = ["1","3","7","9"]

   possible.each do |num|
     if self.board.valid_move?(num)
       move = num
       break
     end
   end
when !"5"
  move = "5"
end
