module Players
  class Computer < Player

    MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def move(board)
      opponent, win, lose, corners = nil, nil, nil, nil
      self.token == "X" ? opponent = "O" : opponent = "X"
      corners = ["1", "3", "7", "9"].select{|m| !board.taken?(m)}
      win = WIN_COMBINATIONS.find{|c| (board.cells[c[0]] == self.token && board.cells[c[1]] == self.token && board.cells[c[2]] == " ") || (board.cells[c[1]] == self.token && board.cells[c[2]] == self.token && board.cells[c[0]] == " ") || (board.cells[c[0]] == self.token && board.cells[c[2]] == self.token && board.cells[c[1]] == " ")}
      lose = WIN_COMBINATIONS.find{|c| (board.cells[c[0]] == opponent && board.cells[c[1]] == opponent && board.cells[c[2]] == " ") || (board.cells[c[1]] == opponent && board.cells[c[2]] == opponent && board.cells[c[0]] == " ") || (board.cells[c[0]] == opponent && board.cells[c[2]] == opponent && board.cells[c[1]] == " ")}
      move = MOVES.select{|m| !board.taken?(m)}.sample
      move = corners.sample if corners.size > 0
      move = "5" if !board.taken?("5")
      move = (lose.find{|pos| board.cells[pos] == " "} + 1).to_s if lose
      move = (win.find{|pos| board.cells[pos] == " "} + 1).to_s if win
      move
    end
  end
end
