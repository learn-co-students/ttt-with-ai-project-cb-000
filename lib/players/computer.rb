require 'pry'

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    attr_accessor :skill
    attr_reader :board

    #Skill defaults to easy. Use writer to change skill after init.
    def initialize(token)
      super
      @skill = "easy"
    end

    def move(board)
      @board = board
      if self.skill == "hard" || self.skill == 2
        move = self.hard
      elsif self.skill =="normal" || self.skill == 1
        move = self.normal
      else
        move = self.easy
      end

      puts "[MX+MO] #{self.salutation} chose square #{move} >>"
      move
    end

    #Doesn't get any simpler than this, chooses a random valid move
    def easy
      find_valid_moves(self.board).sample.to_s
    end

    #Both the normal and hard versions of the computer utilize Minimax.
    #When researching Minimax I didn't read that much about opening moves.
    #What is interesting is that using a simple opening move in the hard
    #version of computer player dramatically increased the win rate versus
    #the random computer player (appoximately by 15%). Eliminating the
    #opening move also improved the AI speed by a large measure.

    def normal
      find_move(self.board,self,0).to_s
    end

    def hard
      moves = find_valid_moves(self.board)

      if moves.count == 9
        [1,3,7,9].sample.to_s
      elsif moves.count == 8
        moves.include?(5) ? 5 : [1,3,7,9].sample.to_s
      else
        find_move(self.board,self,0).to_s
      end
    end

    def minimax(board_ref, player, depth)
      score = self.evaluate(board_ref,depth)
      return score if score

      best, moves = 0, find_valid_moves(board_ref)
      depth += 1

      moves.each do |move|
        board_ref.update(move, player)
        value = minimax(board_ref, enemy(player), depth)
        board_ref.undo_move(move)

        if self.token == player.token
          best = value > best ? value : best
        else
          best = value < best ? value : best
        end
      end
      best
    end

    def find_move(board_ref, player, depth)
      best_value = -83
      best_move, best_moves = -83, []
      depth += 1

      moves = find_valid_moves(board_ref)
      moves.each do |move|
        board_ref.update(move, player)
        move_value = minimax(board_ref, enemy(player), depth)
        board_ref.undo_move(move)

        if move_value >= best_value
          best_value = move_value
          best_move = move
        end
      end
      best_move
    end

    def find_valid_moves(board_ref)
      Array(1..9).select {|i| board_ref.valid_move?(i)}
    end

    def evaluate(board_ref, depth)
      winner = self.won?(board_ref)
      if winner
        return board_ref.cells[winner[0]] == self.token ? 20 - depth : -20 + depth
      end
      board_ref.full? ? 0 : nil
    end

    def enemy(player)
      if player.token == "X"
        Player.new("O")
      else
        Player.new("X")
      end
    end

    def won?(board_ref)
      WIN_COMBINATIONS.detect {|c| c.all?{|x| board_ref.cells[x]=="X"} || c.all?{|x| board_ref.cells[x]=="O"}}
    end

  end
end
