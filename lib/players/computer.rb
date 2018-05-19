module Players
  class Computer < Player

    def move(board)

      #If both players are computers then
      #use the COMPUTER_MOVES in the Board class
      #that guarantee tied games
      if Player.both_computers?

        board.move_array.find{|x| board.valid_move?(x)}

        ###############################################
        #BAD CODE,
        #"return board.move_array[i]" caused weird moves?
        #i=0
        #while i < board.move_array.length
          #if board.valid_move?(board.move_array[i])
            #return board.move_array[i]
          #end
          #i+=1
        #end
        ###############################################

      #Else if one player is a human and the other is
      #a computer, use s different tic-tac-toe strategy
      else

        #To determine the other player's token
        if self.token=="X"
          other_player="O"
        elsif self.token=="O"
          other_player="X"
        end

        #Always try to move to the middle position first
        if board.valid_move?("5")
          "5"
        else
          #And then try to occupy the space diagonally, vertically
          #or horizontally across from the other player's token

          #If space 1 is occupied by the opponent
          #then try to move to space 9 (diagonally accross)
          if board.position("1")==other_player && board.valid_move?("9")
            "9"
          elsif board.position("3")==other_player && board.valid_move?("7")
            "7"
          elsif board.position("7")==other_player && board.valid_move?("3")
            "3"
          elsif board.position("9")==other_player && board.valid_move?("1")
            "1"
          elsif board.position("2")==other_player && board.valid_move?("8")
            "8"
          elsif board.position("4")==other_player && board.valid_move?("6")
            "6"
          elsif board.position("6")==other_player && board.valid_move?("4")
            "4"
          elsif board.position("8")==other_player && board.valid_move?("2")
            "2"

          #if none of the conditions above are true
          #then just choose a random space on the board
          #based on the COMPUTER_MOVES in the Board class
          else
            index=rand(0..9)
            return board.move_array[index]
          end
        end
      end
    end
  end
end


        #########################################################################
        #Code that didn't work out

        #WIN_COMBOS=[          [0,1,2],          [3,4,5],          [6,7,8],          [0,3,6],          [1,4,7],          [2,5,8],          [0,4,8],          [2,4,6]          ]

        #if self.token=="X"
          #other_player="O"
        #elsif self.token=="O"
          #other_player="X"
        #end

        #WIN_COMBOS.each do |win_combination|
          #win_index_1=win_combination[0]
          #win_index_2=win_combination[1]
          #win_index_3=win_combination[2]

          #position_1=board.cells[win_index_1]
          #position_2=board.cells[win_index_2]
          #position_3=board.cells[win_index_3]

          #if position_1==other_player && board.valid_move?(win_index_2.to_s)
            #return win_index_2#+1.to_s
          #elsif position_2==other_player && board.valid_move?(win_index_3.to_s)
            #return win_index_3#+1.to_s
          #elsif position_3==other_player && board.valid_move?(win_index_1.to_s)
            #return win_index_1#+1.to_s
          #else
            ##["1","3","7","9"].sample
            #return board.valid_move?([1,3,7,9].sample)
          #end
        #end
      #end
    #end




################################################
#Old code: works but it's only one set of moves

#if board.valid_move?("5")
    #"5"
    ##board.update("5",self)
  #elsif board.valid_move?("1")
    #"1"
    ##board.update("1",self)
  #elsif board.valid_move?("7")
    #"7"
    ##board.update("7",self)
  #elsif board.valid_move?("3")
    #"3"
    ##board.update("3",self)
  #elsif board.valid_move?("2")
    #"2"
    ##board.update("2",self)
  #elsif board.valid_move?("8")
    #"8"
    ##board.update("8",self)
  #elsif board.valid_move?("6")
    #"6"
    ##board.update("6",self)
  #elsif board.valid_move?("4")
    #"4"
    ##board.update("4",self)
  #elsif board.valid_move?("9")
    #"9"
    ##board.update("9",self)
  ##another sequence of moves:
  ##5 1 3 7 4 6 8 2 9
  #end
