WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i ? user_input.to_i - 1 : -1
end

def move(board, position, token)
  board[position] = token
end

def position_taken?(board, position)
  board[position] != " "
end

def valid_move?(board, position)
  position_taken?(board, position) == false && position.between?(0, 8)
end

def turn(board)
  puts "Please choose a number between 1-9:"
  user_input = gets.strip
  idx = input_to_index(user_input)
  if valid_move?(board, idx)
    move(board, idx, "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.select {|ele| ele == "X" || ele == "O"}.length
end

def current_player
  turn_count(board) % 2 == 0 ? "X" : "O"
end
