# frozen_string_literal: true

require_relative 'board_check_module.rb'
require_relative 'inputs_module.rb'

class Board
  include BoardChecks

  attr_accessor :board_elements
  def initialize
    @board_elements = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def print_board
    b = @board_elements
    puts "#############\n" \
         '# ' + b[0] + ' | ' + b[1] + ' | ' + b[2] + " #\n" \
         "#-----------#\n" \
         '# ' + b[3] + ' | ' + b[4] + ' | ' + b[5] + " #\n" \
         "#-----------#\n" \
         '# ' + b[6] + ' | ' + b[7] + ' | ' + b[8] + " #\n" \
         '#############'
  end

  def change_board(sector, value)
    if board_elements[sector] == ' '
      board_elements[sector] = value
      print_board
    else
      puts 'That sector has been chosen already, choose again'
      change_board(gets.chomp.to_i, value)
    end
  end

  def check_board(value)
    board = @board_elements
    if [vert_check(board, value), horz_check(board, value), diag_check(board, value)].include?(true)
      puts "player #{value} has won"
      true
    elsif full_board_check(board)
      puts 'thats a tie'
      true
    end
  end
end
