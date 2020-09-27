# frozen_string_literal: true

require_relative 'board_check_module.rb'
require_relative 'inputs_module.rb'

class Board
  include BoardChecks
  include Inputs
  attr_accessor :board_elements
  def initialize
    @board_elements = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def print_board
    b = @board_elements
    puts '#############'
    puts '# ' + b[0] + ' | ' + b[1] + ' | ' + b[2] + ' #'
    puts '#-----------#'
    puts '# ' + b[3] + ' | ' + b[4] + ' | ' + b[5] + ' #'
    puts '#-----------#'
    puts '# ' + b[6] + ' | ' + b[7] + ' | ' + b[8] + ' #'
    puts '#############'
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
    [vert_check(board, value),
     horz_check(board, value),
     diag_check(board, value),
     full_board_check(board, value)].include?(true)
  end
end
