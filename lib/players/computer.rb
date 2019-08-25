require 'pry'

module Players
  class Computer < Player

    def corner_move(board)
      corners = [0, 2, 6, 8]

      value = corners.find { |corner| board.cells[corner] == " " }

      "#{value+=1}"
    end

    def attack(board)
      row = Game::WIN_COMBINATIONS.find do |combo|
        combo.all? { |square| board.cells[square] == " " || board.cells[square] == token } &&
        combo.count { |square| board.cells[square] == token } >= 1
      end

      square = row.find { |square| board.cells[square] == " " }

      "#{square+=1}"
    end

    def winnable?(board)
      Game::WIN_COMBINATIONS.find do |combo|
        combo.all? { |square| board.cells[square] == " " || board.cells[square] == token } &&
        combo.count { |square| board.cells[square] == token } == 2
      end
    end

    def go_for_win(board)
      row = Game::WIN_COMBINATIONS.find do |combo|
        combo.all? { |square| board.cells[square] == " " || board.cells[square] == token } &&
        combo.count { |square| board.cells[square] == token } == 2
      end

      square = row.find { |square| board.cells[square] == " " }

      "#{square+=1}"
    end

    def square_at_risk?(board)
      Game::WIN_COMBINATIONS.find do |combo|
        combo.none? { |square| board.cells[square] == token } &&
        combo.all? { |square| board.cells[square] == " " || board.cells[square] != " " } &&
        combo.count { |square| board.cells[square] != " " } == 2
      end
    end

    def defend(board)
      row = Game::WIN_COMBINATIONS.find do |combo|
        combo.none? { |square| board.cells[square] == token } &&
        combo.all? { |square| board.cells[square] == " " || board.cells[square] != " " } &&
        combo.count { |square| board.cells[square] != " " } == 2
      end

      square = row.find { |square| board.cells[square] == " " }

      "#{square+=1}"
    end

    def move(board)
      if board.turn_count == 0 || board.cells[4] == " "
        "5"
      elsif board.turn_count == 1
        corner_move(board)
      elsif winnable?(board)
        go_for_win(board)
      elsif square_at_risk?(board)
        defend(board)
      else
        attack(board)
      end
    end
  end
end
