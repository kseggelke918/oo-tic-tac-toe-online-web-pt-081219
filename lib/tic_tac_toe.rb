require "pry"
class TicTacToe
  attr_accessor :board 
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end 
  
  def input_to_index(user_input)
    index = user_input.to_i - 1 
  end 
  
  def move(index, token = "X")
    board[index] = token 
  end 
   
  def position_taken?(index)
    if board[index] == " "
      false 
    else 
      true 
    end 
  end 
  
  def valid_move?(position)
    if position >= 0 && position <= 8 && board[position] == " " 
      true 
    end 
  end 
  
  def turn
    puts "Please enter a position on the board by choosing a number from 1-9"
    user_input = gets.chomp 
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player) 
      display_board
    else
      puts "This position is taken, please choose a different position."
      user_input = gets.chomp 
    end 
  end 
  
  def turn_count
    turns_taken = []
    board.each do |position|
      if position == "X" || position == "O"
        turns_taken << position 
      end 
    end 
    turns_taken.length
  end 
  
  def current_player
    if turn_count.even?
      "X"
    else 
      "O"
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.each do |winning_combos|
      winning_index_1 = winning_combos[0]
      winning_index_2 = winning_combos[1]
      winning_index_3 = winning_combos[2]
      @win_position_1 = board[winning_index_1]
      @win_position_2 = board[winning_index_2]
      @win_position_3 = board[winning_index_3]
      #binding.pry 
      if (@win_position_1 == "X" && @win_position_2 == "X" && @win_position_3 == "X") || (@win_position_1 == "O" && @win_position_2 == "O" && @win_position_3 == "O")
            return winning_combos 
      end
    end 
    nil 
  end 
  
  def full? 
    true unless board.include?(" ")
  end 
  
  def draw?
    true if full? && !won?
  end 
  
  def over?
    true if won? || draw?
  end 
  
  def winner
    if won?
      @win_position_1
    end 
  end 
  
  def play 
    until over? 
      turn 
    end 
      if over?
        if won?
          puts "Congratulations #{winner}!"
       else  
          puts "Cat's Game!"
        end 
      end 
  end 


end 