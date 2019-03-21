module Players
    class Computer < Player

        #ALL methods in this class that return position
        #MUST ensure position == Board::OPEN or
        #using board.taken?

        #ALL methods return the actual index of board.cells[]
        
        #ONLY #move returns pos to match the user input
        #of array index + 1.

        def move(board)
 
            if (firstMove?(board.cells))
                pos = [0,2,4,6,8].sample
            elsif
                pos = anyBlocksNeeded?(board)
                if pos < 0
                    pos = anyWinsAvail?(board)
                end
            end

            if (pos < 0)
                pos = findOpponentCorner(board)
                if (pos < 0)
                   pos = strategicMove(board)
                end
            end
            pos += 1 #to match the normal getInput selection [1-9]
            puts("Computer '#{@token}' chose square #{pos.to_s}\n") 
            pos = pos.to_s #to match normal getInput format

        end #move

        def freeLine?(board)
          #for each winning WIN_COMBINATIONS
          #returns an array of cell indicies that we can choose
          #from [[0,1,2], [2,5,8]...]

          #includes ONLY winning cell combinations that are
          #either completely empty or only contain our tokens

          line = []
          Game::WIN_COMBINATIONS.each do |x|
            if
              (board.cells[x[0]] == @token || board.cells[x[0]] == Board::OPEN) &&
              (board.cells[x[1]] == @token || board.cells[x[1]] == Board::OPEN) &&
              (board.cells[x[2]] == @token || board.cells[x[2]] == Board::OPEN)
              line << x
            end
          end
          line
        end

        def avail(board)
          #Creates an array of cells that are currently open
          cellsAvail = []
          for i in 0 .. 8 do
            if board.cells[i] == Board::OPEN
              cellsAvail << i
            end
          end
          cellsAvail
        end

        def findBestLines(board, linesArr)
          #based upon linesArr which are WIN_COMBINATIONS that 
          #have only our token, OR are empty, we want to weed
          #out empty lines and find a line with just our token.
          #this would be the best line to choose.

          #there may be multiple best lines to choose from.
          
          #the return value will be an array of lines:
          #[ [0,1,2], [2,5,6], ... etc]

          #now we want to find win_combinations that have lines
          #that have our tokens in them.
          bestLinesArr = []
          linesArr.each do |x|
            if (board.cells[x[0]] == @token ||
                board.cells[x[1]] == @token ||
                board.cells[x[2]] == @token)
              bestLinesArr << x #[ [0,1,2], [0,3,6], ...]
            end
          end
          #if no lines have our token, randomly take a line
          if bestLinesArr.size == 0
            index = rand(linesArr.size - 1)
            bestLinesArr = linesArr[index]
          end
          bestLinesArr
        end

        def findIntersectingLines(x, y, board)
          #x and y represent bestLines, which are arrays of
          #indices from WIN_COMBINATIONS where the lines contain
          #at least one of our tokens, and no tokens of opponents

          #x and y are the same array, but passing in as two 
          #seperate arrays allows us to march through array-1
          #and look to see if any our values exist in array-2

          #[[ [0,1,2], [0,3,6]], [[2,5,8],[0,1,2]]
          linesArr = []
          matchingArr = []
          x.each do |a|
            y.each do |b|
              if (linesIntersect?(a, b))
                matchingArr << a #[0,1,2]
                matchingArr << b #[0,3,6]
                linesArr << matchingArr.dup #[ [[0,1,2], [0,3,6]], ...]
                matchingArr.clear
              end #if
            end #y.each
          end #x.each
          puts("Intersecting lines:  #{linesArr}")
          linesArr
        end #findIntersectingLines

        def linesIntersect?(line1, line2)
          #line1 and #line2 are WIN_COMBINATION array indices
          #like [0,1,2], [0,3,6]
          #we look at each of line1's indices and see if they
          #exist in line2's indices.
          retVal = false
          line1.each do |x|
            line2.each do |y|
              if x == y #cell index x == cell index  y
                retVal = true
                break
              end #if
            end #line2.each do
            if retVal == true
              break #in case we need to break out of line1.each do
            end
          end #line1.each do
          retVal
        end

        def findBestCell(board, intersectingLines)
            #intersectingLines should be [ [[0,1,2],[0,3,6]], [[0,1,2],[2,5,8]], [[...],[...]], ...]
            #intersectingLines[0] should = [0,1,2], [0,3,6] 
 
            #simply put, we are just returning the first cell of
            #the intersecting line that is empty
            #this could be improved upon.  Suggest first collecting
            #all cells that are empty, then randomizing the 
            #selection.
            pos = -1
            x = intersectingLines[0]  #first pair in array
            x[0].each do |o| #examine each position
                if board.cells[o] == Board::EMPTY
                pos = o
                end #if
            end #each x[0]
            pos
        end #bestCell

        def strategicMove(board)
            pos = -1
            #get array of WIN_COMBINATIONS that board.cells only
            #contain our token, OR empty cells.  This could return
            #completely empty lines
            freeLines = freeLine?(board)
            if freeLines.size > 1
                #find lines from WIN_COMBINATIONS that only
                #contain our token and empty spaces.
                #findBestLines returns #[ [0,1,2], [0,3,6], ...]
                bestLines = findBestLines(board, freeLines)
                
                #of these bestLines, do we have two sets of lines
                #that intersect?
                if bestLines.size > 1 
                    #returns an array of intersecting lines
                    #like [ [[0,1,2][1,3,6]] ..]
                    intersectingLines = findIntersectingLines(bestLines, bestLines, board)
                    
                    #given two intersecting lines, look at the board
                    #and determine which is the best cell to choose
                    pos = findBestCell(board, intersectingLines)
                elsif bestLines.size == 1
                    #just choose the best of the [0,1,2] array of indices
                    pos = bestLines[0].sample
                end
            else
                #we don't have a straight line free
                #choose randomly from cells available
                cellsAvailArr = avail(board)
                if cellsAvailArr.size > 0
                pos = cellsAvailArr.sample
                end
            end
            pos
        end

        def findOpponentCorner(board)
            @token == "X" ? o_token = "O" : o_token = "X"

            pos = -1
            if board.cells[0] == o_token || board.cells[8] == o_token
                if !board.taken?(2 + 1) #position 2
                    pos = 2
                elsif !board.taken?(6 + 1)
                    pos = 6
                end
            elsif board.cells[2] == o_token || board.cells[6] == o_token
                if !board.taken?(0 + 1)
                    pos = 0
                elsif !board.taken?(8 + 1)
                    pos = 8
                end
            elsif board.turn_count == 1 && board.cells[4] == o_token
                #randomly choose a corner cell, if the middle cells
                #is taken by opponent
                pos = [0,2,6,8].sample
            end
            pos
        end


        def anyBlocksNeeded?(board)
            #returns pos on the first block needed
            #pos is ONLY OPEN cell 
            @token == "X" ? o_token = "O" : o_token = "X"
            resultsArr = []
            Game::WIN_COMBINATIONS.each do |x|
                resultsArr << needsBlock?(board, x)
            end

            pos = -1

            resultsArr.each{ |x| x >= 0 ? pos = x : pos }
            pos
        end

        def firstMove?(cells)

            first = cells.detect{ |x| x != Board::OPEN }
            if first == nil
                true
            else
                false
            end
        end

        def anyWinsAvail?(board)
            pos = -1
            Game::WIN_COMBINATIONS.each do |x|
                if (board.cells[x[0]] == @token &&
                    board.cells[x[1]] == @token &&
                    board.cells[x[2]] == Board::OPEN)
                        pos = x[2]
                elsif
                    (board.cells[x[1]] == @token &&
                    board.cells[x[2]] == @token &&
                    board.cells[x[0]] == Board::OPEN)
                        pos = x[0]
                elsif
                    (board.cells[x[0]] == @token &&
                    board.cells[x[2]] == @token &&
                    board.cells[x[1]] == Board::OPEN)
                    pos = x[1]
                else
                    pos = -1
                end
            end #pos for each loop
            pos
        end

        def needsBlock?(board, cellsArr)
            #pos returned are ONLY OPEN cells
            @token == "X" ? o_token = "O" : o_token = "X"
            if (board.cells[cellsArr[0]] == o_token &&
                board.cells[cellsArr[1]] == o_token &&
                board.cells[cellsArr[2]] == Board::OPEN)
                    pos = cellsArr[2]
            elsif
                (board.cells[cellsArr[1]] == o_token &&
                board.cells[cellsArr[2]] == o_token &&
                board.cells[cellsArr[0]] == Board::OPEN)
                    pos = cellsArr[0]
            elsif
                (board.cells[cellsArr[0]] == o_token &&
                board.cells[cellsArr[2]] == o_token &&
                board.cells[cellsArr[1]] == Board::OPEN)
                    pos = cellsArr[1]
             else
                pos = -1
            end

            pos
        end



        def needCorner?(board)
            @token == "X" ? o_token = "O" : o_token = "X"
            pos = -2

            if
                #pattern
                #[0,1,2]
                #[" ", " ", o_token] => pos = 0
                (board.cells[0] == Board::OPEN &&
                board.cells[1] == Board::OPEN &&
                board.cells[2] == o_token)
                pos = 0
            elsif
                #pattern
                #[0,1,2]
                #[o_token, " ", " "] => pos = 2
                (board.cells[0] == o_token &&
                board.cells[1] == Board::OPEN &&
                board.cells[2] == Board::OPEN)
                pos = 2
            elsif
                #pattern
                #[6,7,8]
                #[" ", " ", o_token] => pos = 6
                (board.cells[6] == Board::OPEN &&
                board.cells[7] ==  Board::OPEN &&
                board.cells[8] == o_token)
                pos = 6
            elsif
                #pattern
                #[6,7,8]
                #[o_token, " ", " "] => pos = 8
                (board.cells[6] == o_token &&
                board.cells[7] == Board::OPEN &&
                board.cells[8] == Board::OPEN)
                pos = 8
            elsif
                #pattern
                #[0,3,6]
                #[o_token, " ", " "] => pos = 6
                (board.cells[0] == o_token &&
                board.cells[3] == Board::OPEN &&
                board.cells[6] == Board::OPEN)
                pos = 6
            elsif
                #pattern
                #[0,3,6]
                #[" ", " ", o_token] => pos = 0
                (board.cells[0] == Board::OPEN &&
                board.cells[3] == Board::OPEN &&
                board.cells[6] == o_token)
                pos = 0
            elsif
                #pattern
                #[2,5,8]
                #[" ", " ", o_token] => pos = 2
                (board.cells[2] == Board::OPEN &&
                board.cells[5] == Board::OPEN &&
                board.cells[8] == o_token)
                pos = 2
            elsif
                #pattern
                #[2,5,8]
                #[o_token, " ", " "] => pos = 8
                (board.cells[2] == o_token &&
                board.cells[5] == Board::OPEN &&
                board.cells[8] == Board::OPEN)
                pos = 8
            end
            pos 
        end

        def needWin?(board)
            @token
            win = -2

            Game::WIN_COMBINATIONS.each do |x|
                if
                  (board.cells[x[0]] == @token &&
                   board.cells[x[1]] == @token &&
                   board.cells[x[2]] == Board::OPEN)
                    win = x[2]
                elsif
                   (board.cells[x[0]] == @token &&
                   board.cells[x[2]] == @token &&
                   board.cells[x[1]] == Board::OPEN)
                   win = x[1]
                elsif
                   (board.cells[x[1]] == @token &&
                   board.cells[x[2]] == @token &&
                   board.cells[x[0]] == Board::OPEN)
                   win = x[0]
                end
            end
            win
        end

        def needBlock?(board)

            @token == "X" ? o_token = "O" : o_token = "X"
            block = -2
            Game::WIN_COMBINATIONS.each do |x|
                if
                  (board.cells[x[0]] == o_token &&
                   board.cells[x[1]] == o_token &&
                   board.cells[x[2]] == Board::OPEN)
                    block = x[2]
                   break;
                elsif
                   (board.cells[x[0]] == o_token &&
                   board.cells[x[2]] == o_token &&
                   board.cells[x[1]] == Board::OPEN)
                    block = x[1]
                   break;
                elsif
                   (board.cells[x[1]] == o_token &&
                   board.cells[x[2]] == o_token &&
                   board.cells[x[0]] == Board::OPEN)
                    block = x[0]
                   break;
                end
              end
              block  
        end

    end #Computer
end #Players Module
