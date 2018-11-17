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

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.any? do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]]== board[combination[2]]
  end
end

def full?(board)
  turn_count(board) == 9
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if win_combo = WIN_COMBINATIONS.detect { |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    board[combination[2]] != " "}
    board[win_combo[0]]
  else
    nil
  end
end

def play(board)
  puts "Please choose a number between 1-9:"
    turn(board)
    if won?(board)
      winner(board)
    end
    draw?(board)
end
