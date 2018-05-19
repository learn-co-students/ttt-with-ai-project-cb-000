class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [2,4,6]
  ]

  #def initialize(player_1=Human.new("X"),player_2=Human.new("O"),board=Board.new)
  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    #(player_1,player_2,board)
    @player_1=player_1
    @player_2=player_2
    @board=board
  end

  def current_player
    #ternary
    (@board.turn_count.odd? ? @player_2 : @player_1)

    #if @board.turn_count.odd?
      #@player_2
    #else
      #@player_1
    #end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]

      position_1=@board.cells[win_index_1]
      position_2=@board.cells[win_index_2]
      position_3=@board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def draw?
    #Even simpler than ternary
    !won? && @board.full?

    #ternary
    #(!won? && @board.full? ? true : false)

    #if !won? && @board.full?
      #true
    #else
      #false
    #end
  end

  def over?
    #Simpler than if/else statements
    won? || draw?

    #if won?||draw?#||Board.full?
      #true
    ##elsif !@board.full?
    #else
      #false
    #end
  end

  def winner

    #ternary
    #if won? returns a winning combo then iterate through its
    #array and return the winning letter: X or O.
    #else if won? is false then return nil

    (won? ? won?.each {|winning_letter_index| return @board.cells[winning_letter_index]} : nil)

    #################################################
    #Longer version works too
    #winning_combo=won?
    #if winning_combo
    ##if won?
    ##if won?!=false
      ##winning_combo=won?
      #winning_combo.each do |winning_letter_index|
        #return @board.cells[winning_letter_index]
        ##@board[winning_letter_index]
      #end
    #else
      #return nil
    #end
  end

  def turn

    puts "\n"
    @board.display
    puts "\n"

    input=current_player.move(@board)

    #ternary
    (@board.valid_move?(input) ? @board.update(input,current_player) : turn)

    #Code below works too
    #if @board.valid_move?(input)
      #@board.update(input,current_player)
    #else
      #just call the method turn if move is invalid
      #turn

      #Code below works but basically repeats the code above
      #input=current_player.move(@board)
      #if @board.valid_move?(input)
        #@board.update(input,current_player)
      #end

      ########################################
      #Code that didn't work
      ##input=@player_1.move(@board)
      ##puts "Please enter 1-9:"
      ##input=gets.strip#.to_i-1
    #end
  end

  def play
    until over?
      turn
    end

    if winner=="O"||winner=="X"
      puts "\n"
      @board.display
      puts "\n"
      puts "Congratulations #{winner}!"
      puts "\n"
    elsif draw?
      puts "\n"
      @board.display
      puts "\n"
      puts "Cat's Game!"
      puts "\n"
    end
  end
end
