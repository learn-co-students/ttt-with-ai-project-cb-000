class Computer < Player

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]



  def move(board)
    arraytoken = []
    arraytoken_enemy = []
    i = 0
    board = board.cells
    while i < board.length
      if board[i] == token
        arraytoken << i
      elsif board[i] != " "
        arraytoken_enemy << i
      end

     i += 1
    end

    return "5" if board == Array.new(9, " ") || board[4] == " "
    return ["1","3","7","9"].sample if board.count(" ") == 8
    combs = WIN_COMBINATIONS.find { |comb| comb if (comb - arraytoken).count == 1 }

    return ((combs - arraytoken).join("").to_i + 1).to_s if combs != nil && board[(combs - arraytoken).join("").to_i] == " "
    combs = WIN_COMBINATIONS.find { |comb| comb if (comb - arraytoken_enemy).count == 1 }

    return ((combs - arraytoken_enemy).join("").to_i + 1).to_s if combs != nil && board[(combs - arraytoken_enemy).join("").to_i] == " "
    return (([0,2,6,8] - arraytoken - arraytoken_enemy).sample + 1).to_s if ([0,2,6,8] - arraytoken - arraytoken_enemy) != []
    return ((Array(0..8) - arraytoken - arraytoken_enemy).sample + 1).to_s



  end

end
