class Board

  attr_accessor :cells

  attr_reader :move_array

  @cells=[]

  #below is an array of the Computer's tic tac toe moves
  #that force a tied game
  COMPUTER_MOVES=[

  ["5","1","7","3","2","8","6","4","9"],
  ["5","1","3","7","4","6","8","2","9"],
  ["5","1","2","8","4","6","3","7","9"],
  ["5","3","1","9","6","4","8","2","7"],
  ["5","3","2","8","1","9","7","4","6"],
  ["5","3","9","1","2","8","4","6","7"],
  ["5","7","1","9","8","2","6","4","3"],
  ["5","7","4","6","8","2","1","9","3"],
  ["5","7","9","1","4","6","2","8","3"],
  ["5","9","3","7","8","2","4","6","1"],
  ["5","9","6","4","7","3","2","8","1"],
  ["5","9","7","3","6","4","2","8","1"]

  ]

  def initialize
    @cells=Array.new(9, " ")

    random_integer=rand(0..COMPUTER_MOVES.length-1)
    @move_array=COMPUTER_MOVES[random_integer]
  end

  def input_to_index(input)
    input.to_i-1
  end

  def reset!
    @cells.clear
    @cells=Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
      #@cells[input.to_i-1]
    @cells[input_to_index(input)]
  end

  def full?
    @cells.all?{|square| square=="X" || square=="O"}
  end

  def turn_count

   @cells.count {|square| square=="X" || square =="O"}

   #Code below works but is probably too wordy
   #It also relies on a locally-created variable
   #counter=0
   #@cells.each do |square|
     #counter+=1 if square=="X"||square=="O"
   #end
   #counter
  end

  def taken?(input)
    ##@cells[input-1]=="X" || @cells[input-1]=="O"
    position(input)=="X" || position(input)=="O"
  end

  def valid_move?(input)
    #!taken?(input) && input.to_i.between?(1,9)
    !taken?(input) && input_to_index(input).between?(0,8)
  end

  def update(input,player)
    #@cells[input.to_i-1]=player.token
    @cells[input_to_index(input)]=player.token
  end

end
