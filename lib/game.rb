class Game
  # Game ::WIN_COMBINATIONS defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  # Game #board provides access to the board

  # Game #player_1 provides access to player_1

  # Game #player_2 provides access to player_2

  # Game initialize accepts 2 players and a board

  # Game initialize defaults to two human players, X and O, with an empty board
end
