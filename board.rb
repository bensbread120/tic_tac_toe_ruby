# frozen_string_literal: true

require_relative 'player_input.rb'
# Board class creates an array that can be modified by users through the game object,
# array is manipulated into board after each interaction
class Board
  include PlayerInput
  attr_accessor :board
  BOARD_SIZE = 3
  BOARD_SIZE_SQRD = BOARD_SIZE * BOARD_SIZE
  PRINT_LENGTH = BOARD_SIZE * 2 + 1
  def initialize
    @board = Array.new(BOARD_SIZE_SQRD, ' ')
  end

  def change_board(sector, value)
    if @board[sector] == ' '
      @board[sector] = value
      print_board
    else
      puts 'That sector has been chosen already, choose again'
      change_board(int_within_board(BOARD_SIZE_SQRD), value)
    end
  end

  def check_board(value)
    if [vert_check(@board, value), horz_check(@board, value), diag_check(@board, value)].include?(true)
      puts "player #{value} has won"
      clear_board
      true
    elsif full_board_check(@board)
      puts 'thats a tie'
      clear_board
      true
    end
  end

  private

  def print_board
    x = 0
    (1..PRINT_LENGTH).each do |num|
      if (num == 1) || (num == PRINT_LENGTH)
        puts '#' * (BOARD_SIZE * 4 + 1)
      elsif num.even?
        puts '# ' + @board.slice(x, BOARD_SIZE).join(' | ') + ' #'
        x += BOARD_SIZE
      else
        puts '#' + '-' * (BOARD_SIZE * 4 - 1) + '#'
      end
    end
  end

  def clear_board
    @board = Array.new(BOARD_SIZE_SQRD, ' ')
  end

  def vert_check(board, value)
    (0..BOARD_SIZE - 1).each do |num|
      answer = ''
      (0..BOARD_SIZE - 1).each do |x|
        answer += board[num + BOARD_SIZE * x]
      end
      return true if answer == value * BOARD_SIZE
    end
  end

  def horz_check(board, value)
    (0..BOARD_SIZE - 1).each do |num|
      num *= BOARD_SIZE
      answer = ''
      (0..BOARD_SIZE - 1).each do |x|
        answer += board[num + x]
      end
      return true if answer == value * BOARD_SIZE
    end
  end

  def left_to_right_diag(board, value)
    answer = ''
    (0..BOARD_SIZE - 1).each do |num|
      answer += board[num * (BOARD_SIZE + 1)]
    end
    return true if answer == value * BOARD_SIZE
  end

  def right_to_left_diag(board, value)
    answer = ''
    (1..BOARD_SIZE).each do |num|
      answer += board[BOARD_SIZE * num - num]
    end
    return true if answer == value * BOARD_SIZE
  end

  def diag_check(board, value)
    right_to_left_diag(board, value) || left_to_right_diag(board, value)
  end

  def full_board_check(board)
    !board.include?(' ')
  end
end
