# WIN_COMBINATIONS = [[0,1,2],
#                     [3,4,5],
#                     [6,7,8],
#                     [0,3,6],
#                     [1,4,7],
#                     [2,5,8],
#                     [0,4,8],
#                     [6,4,2]]
#
#
# class Board
#
#   def initialize
#     @board = ["X", "X", " ", " ", "X", " ", " ", " ", " " ]
#   end
#
#   def cells
#     @board
#   end
# end
#
#
# board = Board.new
#
# def attacking_move(board, token)
#   x = WIN_COMBINATIONS.detect do |win|
#         [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(" ") == 2 &&
#         [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(token) == 1
#       end
#   if x != nil
#     x.find {|index| board.cells[index] == " "}
#   end
# end
#
#
#
# def winning_move(board, token)
#   x = WIN_COMBINATIONS.detect do |win|
#         [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(" ") == 1 &&
#         [board.cells[win[0]], board.cells[win[1]], board.cells[win[2]]].count(token) == 2
#       end
#   if x != nil
#     x.find {|index| board.cells[index] == " "}
#   end
# end
#
# attacking_move(board, "X")
# winning_move(board, "X")
#
# # WIN_COMBINATIONS.detect do |wins|
# #   wins.collect.all? {|win| @board[win] == "X" }
# # end
#
# # /
