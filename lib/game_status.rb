# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # row wins 
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  # column wins
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  # diagonal wins
  [0,4,8], #top left to bottom right
  [2,4,6] #top right to bottom left
  ]
  
  def won?(board)
    WIN_COMBINATIONS.each do |combo|
      win_index_1= combo[0]
      win_index_2= combo[1]
      win_index_3= combo[2]
      
      position_1= board [win_index_1]
      position_2= board [win_index_2]
      position_3= board [win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      end
    end
  else
    false
  end
  
  def full?(board)
    board.all? do |check|
      check == "X" || check == "O"
    end
  end
  
  def draw?(board)
    if won?(board) == false && full?(board) == true 
      return true
    else
      return false
    end
  end
  
def over?(board)
  won?(board) || draw?(board) 
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end