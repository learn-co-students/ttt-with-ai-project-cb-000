require 'spec_helper'

describe 'Players::Computer' do
  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Players::Computer.new("X")
      board = Board.new

      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end

		it 'completes horizontal winning patterns' do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
			expect(board.cells).to eq (["X", "X", " ", " ", " ", " ", " ", " ", " "])
			expect(computer.move(board)).to eq("3")
		end

		it 'completes vertical winning patterns' do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells = [" ", " ", " ", " ", "X", " ", " ", "X", " "]
			expect(computer.move(board)).to eq("2")
		end

		it 'completes diagonal winning patterns' do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", "X"]
			expect(computer.move(board)).to eq("5")
		end

		it 'does not take a taken position' do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells = ["X", " ", " ", " ", "O", " ", " ", " ", "X"]
			expect(computer.move(board)).not_to eq("5")
		end

		it 'Takes a different win position if the first cant be completed' do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells = ["X", "O", "X", " ", " ", "O", " ", " ", "X"]
			expect(computer.move(board)).to eq("5")
		end

		it 'stops horizontal losing patterns' do
			computer = Players::Computer.new("O")
      board = Board.new
			board.cells = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
			expect(computer.move(board)).to eq("3")
		end

		it 'stops vertical losing patterns' do
			computer = Players::Computer.new("O")
      board = Board.new
			board.cells = [" ", " ", " ", " ", "X", " ", " ", "X", " "]
			expect(computer.move(board)).to eq("2")
		end

		it 'stops diagonal losing patterns' do
			computer = Players::Computer.new("O")
      board = Board.new
			board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", "X"]
			expect(computer.move(board)).to eq("5")
		end

		it 'Takes center if unclaimed' do
			computer = Players::Computer.new("X")
      board = Board.new
			expect(computer.move(board)).to eq("5")
		end

		it "does not place duplicates" do
			computer = Players::Computer.new("X")
      board = Board.new
			9.times do
				board.update(computer.move(board), computer)
			end
			expect(board.cells).to eq(["X", "X", "X", "X", "X", "X", "X", "X", "X"])
		end

  end

	describe "#count_surrounding" do
		it "corectly counts fully surrounded cell" do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells= ["X", "X", "X", "X", " ", "X", "X", "X", "X"];

			expect(computer.send(:surrounding_count, board, 4, "X")).to eq(8)
		end

		it "does not count self" do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells= ["X", "X", "X", "X", " ", "X", "X", "X", "X"];

			expect(computer.send(:surrounding_count, board, 4, "X")).to eq(8)
		end

		it "counts surrounded slot in upper left corner" do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells= ["X", "X", "X", "X", "X", "X", "X", "X", "X"];

			expect(computer.send(:surrounding_count, board, 0, "X")).to eq(3)
		end

		it "counts surrounded slot in mid right" do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells= ["X", "X", "X", "X", "X", "X", "X", "X", "X"];

			expect(computer.send(:surrounding_count, board, 5, "X")).to eq(5)
		end

		it "counts surrounded slot in bottom mid" do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells= ["X", "X", "X", "X", "X", "X", "X", "X", "X"];

			expect(computer.send(:surrounding_count, board, 7, "X")).to eq(5)
		end

		it "counts surrounded slot in bottom right" do
			computer = Players::Computer.new("X")
      board = Board.new
			board.cells= ["X", "X", "X", "X", "X", "X", "X", "X", "X"];

			expect(computer.send(:surrounding_count, board, 8, "X")).to eq(3)
		end
	end
end
