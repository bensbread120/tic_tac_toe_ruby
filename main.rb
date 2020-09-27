# frozen_string_literal: true

require_relative 'tic_tac_toe.rb'

def game
  include Inputs
  puts 'Player 1 please choose O or X'
  player_choice = pick_x_or_o
  new_board = Board.new
  catch :finished do
    loop do
      [0, 1].each do |n|
        puts "player #{n + 1} choose a position between 0-8:"
        new_board.change_board(int_less_than_9, player_choice[n])
        throw :finished if new_board.check_board(player_choice[0]) || new_board.check_board(player_choice[1])
      end
    end
  end
end

loop do
  game
  puts 'would you like to play again y/n'
  gets.chomp.downcase == 'y' ? next : break
end
