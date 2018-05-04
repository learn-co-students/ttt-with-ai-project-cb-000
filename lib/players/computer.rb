module Players
  class Computer < Player
    attr_accessor :ai

    WIN_COMBOS = Game::WIN_COMBINATIONS

    def move(board)
      sleep(Game::CLI_DELAY)
      ai = AI.new(self, board)
      ai.think
      best_move = ai.pick_move
      puts "#{self.token} selects #{best_move}"
      puts ""
      sleep(Game::CLI_DELAY)
      best_move
    end

  end
end
