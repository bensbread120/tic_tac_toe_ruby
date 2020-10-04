# frozen_string_literal: true

require_relative 'board.rb'
# Game class is used mostly to take user input and direct valid inputs into board object
class Game < Board
  def initialize
    @new_board = Board.new
  end

  def int_less_than_9
    choose_position = gets
    if choose_position.nil? || choose_position.chomp.to_i > BOARD_SIZE_SQRD - 1 || choose_position.chomp.to_i.negative?
      puts 'sorry can you pick that again'
      int_less_than_9
    else
      choose_position.chomp.to_i
    end
  end

  def pick_puts(num)
    num.zero? ? (puts 'Player 1 please choose O or X') : (puts "Sorry that wasn't an option, pick again")
  end

  def pick_x_or_o(_num, player_choice)
    if player_choice.nil?
      pick_x_or_o(pick_puts(1), gets)
    elsif player_choice.chomp.upcase == 'O'
      %w[O X]
    elsif player_choice.chomp.upcase == 'X'
      %w[X O]
    else
      pick_x_or_o(pick_puts(1), gets)
    end
  end

  def play(player_choice, int)
    puts "player #{int + 1} choose a position between 0-8:"
    @new_board.change_board(int_less_than_9, player_choice[int])
    @new_board.check_board(player_choice[int])
  end

  def looping_turns(player_choice)
    loop do
      break if play(player_choice, 0) || play(player_choice, 1)
    end
  end

  def looping_game
    loop do
      looping_turns(pick_x_or_o(pick_puts(0), gets))
      puts 'would you like to play again y/n'
      @new_board.clear_board
      play_again = gets
      break if play_again.nil?
      play_again.chomp.downcase == 'y' ? next : break
    end
  end
end

new_game = Game.new
new_game.looping_game
