require 'pry'
class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "------------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "------------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  index
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == "X"
    true
  elsif @board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(index)
  if position_taken?(index) == false && index.between?(0, 8)
    true
  else
    false
  end
end

def turn_count
  @board.count("X") + @board.count("O")
end

def current_player
  if turn_count.even?
    return "X"
  elsif turn_count.odd?
    return "O"
  end
end

def turn
  puts "Your turn, muthafucka!"
  input = gets
  index = input_to_index(input)
  if valid_move?(index)
    move(index)
    display_board
  else
    puts "you fucked up try again"
    turn
  end
  current_player
end

def won?
  binding.pry
end




WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  [0, 4, 8],
  [6, 4, 2],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

end
