
############################################################
#Checks the board after each turn for a winning move
module BoardChecks
  def vert_check(board, value)
    for num in (0..2) do 
      if board[num] + board[num+3] + board[num+6] == value * 3 
        puts "#{value} has won"
        return true
      end
    end
  end

  def horz_check(board, value)
    for num in [0,3,6] do 
      if board[num] + board[num+1] + board[num+2] == value * 3 
        puts "#{value} has won"
        return true
      end
    end
  end

  def diag_check(board, value)
    if board[0] + board[4] + board[8] == value * 3 || board[2] + board[4] + board[6] == value * 3
      puts "#{value} has won" 
      return true
    end
  end

  def full_board_check(board, value)
    if !(board.include?(" "))
        puts "That's a tie!"
        return true
    end
  end
end
#############################################################


#############################################################
#Creates board object that can manipulated throughout the game
class Board
  include BoardChecks
  attr_accessor :board_elements
  def initialize
    @board_elements = [" "," "," "," "," "," "," "," "," "]
  end

  def print_board
    b = @board_elements
    puts "#############"
    puts "# "+b[0]+" | "+b[1]+" | "+b[2]+" #"
    puts "#-----------#"
    puts "# "+b[3]+" | "+b[4]+" | "+b[5]+" #"
    puts "#-----------#"
    puts "# "+b[6]+" | "+b[7]+" | "+b[8]+" #"
    puts "#############"
  end 

  def change_board(sector, value)
    if self.board_elements[sector] == " "
      self.board_elements[sector] = value
    else 
      puts "That sector has been chosen already, choose again"
      change_board(gets.chomp.to_i, value)
    end
  end

  def clear_board
    @board_elements = [" "," "," "," "," "," "," "," "," "]
    puts "Board has been cleared."
  end
  
  def check_board(value)
    board = @board_elements
    return [self.vert_check(board, value), self.horz_check(board, value), self.diag_check(board, value), self.full_board_check(board, value)].include?(true)
  end
end

class Player
  attr_reader :value
  def initialize(value)
    @value = value
  end
end
########################################################

########################################################
#filter user inputs
def get_int_less_than_9()
  choose_postiion = gets.chomp.to_i
  (choose_postiion <= 8 and choose_postiion >= 0)? (return choose_postiion) : get_int_less_than_9()
end

def pick_x_or_o()
  player_choice = gets.chomp
  if  player_choice == "O" 
    return [Player.new("O"), Player.new("X")] 
  elsif player_choice == "O"
    return [Player.new("X"), Player.new("O")]
  else 
    puts "sorry that wasn't an option can you pick again?"
    pick_x_or_o()
  end
end
##################################################

def game()
  playing = true
  puts 'Player 1 please choose O or X'
  player_choice = pick_x_or_o()
  
  new_board = Board.new  
  
  loop do (new_board.check_board(player_choice[0].value) or new_board.check_board(player_choice[1].value))
    
    puts "player one choose a position between 0-8:"
    
    new_board.change_board(get_int_less_than_9(), player_choice[0].value)
    new_board.print_board
    if (new_board.check_board(player_choice[0].value) or new_board.check_board(player_choice[1].value))
      break
    end
      puts "player two choose a position between 0-8:"
    new_board.change_board(get_int_less_than_9(), player_choice[1].value)
    new_board.print_board
    if  (new_board.check_board(player_choice[0].value) or new_board.check_board(player_choice[1].value))
      break
    end
    end 

end

game()