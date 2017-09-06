module Players
  class Computer < Player
    INFINITY = 10
    WIN = +INFINITY
    LOSE = -INFINITY
    DOUBLE_LINK = 5
    DOUBLE_DOUBLE = 8
    INPROGRESS = 1
    DRAW = 0
    WIN_STATUS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    INITIAL_POS_VALUE = [
      3, 2, 3,
      2, 4, 2,
      3, 2, 3
    ]

    def move(board)
      minimax(board, 6)
    end

    def minimax(board, depth)
      bestMoves = []
      index = 0

      bestValue = - INFINITY
      for pos in 0..8 do


        if board.cells[pos]== " "
          board.cells[pos] =  @token
          value = min(board, depth, - INFINITY, INFINITY)
          puts "#{pos} : #{value}"

          if value > bestValue
            bestValue = value
            index = 0
            bestMoves[index] = pos
            index += 1
          elsif value == bestValue

            bestMoves[index] = pos
            index += 1
          end
          board.cells[pos] = " "
        end
      end

      if index>1
        index = Random.new.rand(index) + 1
      end
 # puts "#{bestMoves.inspect}"
 # puts "#{index}"
      return "#{bestMoves[index - 1] + 1}"
    end

    def max(board, depth, alpha, beta)

      if depth == 0 || over?(board)
        value = gameState(board)
        return value
      end

      bestValue = - INFINITY
      for pos in 0..8 do
        if board.cells[pos] == " "
          board.cells[pos] = @token
          bestValue = [bestValue, min(board, depth - 1, [bestValue, alpha].max, beta)].max
          # puts board.cells.inspect
          # puts "max: #{bestValue}   beta: #{beta}"
          board.cells[pos] = " "
          break if bestValue >= beta
        end
      end
      return bestValue
    end

    def min(board, depth, alpha, beta)
      if @token == "X"
        token = "O"
      else
        token = "X"
      end

      # if board.turn_count == 1
      #   return INITIAL_POS_VALUE[board.cells.index {|i| i == "X" || i == "O"}]
      # end

      if depth == 0 || over?(board)
        value = gameState(board)
        return value
      end

      bestValue = INFINITY
      for pos in 0..8 do
        if board.cells[pos] == " "
          board.cells[pos] = token
          bestValue = [bestValue, max(board, depth - 1, alpha, [bestValue, beta].min)].min
          # puts board.cells.inspect
          # puts "min: #{bestValue}   alpha: #{alpha}"
          board.cells[pos] = " "
          break if bestValue <= alpha
        end
      end
      return bestValue
    end

    def gameState(board)
      result = INPROGRESS
      isFull = board.full?

      if won?(board)
        if winner(board) == @token
          return WIN
        else
          return LOSE
        end
      end
      if isFull
        return DRAW
      end
      finds = [0,0]
      WIN_STATUS.each do |status|
        chess = " "
        hasEmpty = false
        count = 0
        status.each do |i|

          if board.cells[i] == " "
            hasEmpty = true
          else
            if chess == " "
              chess = board.cells[i]
            end
            if board.cells[i] == chess
              count += 1
            end
          end
        end

        if hasEmpty && count > 1
          if chess == @token
            finds[0] += 1
          else
            finds[1] += 1
          end
        end
      end
      if finds[1] > 0
        if finds[1] > 1
          result = - DOUBLE_DOUBLE
        else
          result = - DOUBLE_LINK
        end

      else
        if finds[0] > 0
          if finds[0] > 1
            result = DOUBLE_DOUBLE
          else
            result = DOUBLE_LINK
          end

        end
      end


      return result
    end

    def over?(board)
      return true if won?(board) || board.full? || draw?(board)
    end

    def winner(board)
      win = won?(board)
      if win
        return board.cells[win[0]]
      end
    end

    def won?(board)
      WIN_STATUS.find do |win_index|
        (board.cells[win_index[0]] == "X" && board.cells[win_index[1]] == "X" && board.cells[win_index[2]] == "X") || (board.cells[win_index[0]] == "O" && board.cells[win_index[1]] == "O" && board.cells[win_index[2]] == "O")
      end
    end

    def draw?(board)
      return false if won?(board)
      if board.full?
        return true
      else
        return false
      end
    end
  end



end
