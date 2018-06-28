# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #Diagonal
  [2, 4, 6] #Diagonal
  ]

def won?(board)
  winning_board = false
  WIN_COMBINATIONS.each do |win_combo|
    test_board = []
    win_combo.each do |win_index|
      test_board << board[win_index]
    end
    if test_board.all? {|token| token == "X"} || test_board.all? {|token| token == "O"} 
      winning_board = win_combo
    end
  end
  winning_board
end

def full?(board)
  board.all? {|position| position =="X" || position =="O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    board[winning_combo[0]]
  else
    nil
  end
end