# frozen_string_literal: true

require_relative 'tic_tac_toe.rb'
require_relative 'inputs_module.rb'

def game(player_choice)
  new_board = Board.new
  catch :finished do
    loop do
      [0, 1].each do |n|
        puts "player #{n + 1} choose a position between 0-8:"
        new_board.change_board(int_less_than_9, player_choice[n])
        throw :finished if new_board.check_board(player_choice[n])
      end
    end
  end
end

loop do
  game(pick_x_or_o(pick_puts(0), gets))
  puts 'would you like to play again y/n'
  play_again = gets
  if play_again.nil?
    break
  else
    play_again.chomp.downcase == 'y' ? next : break
  end
end
