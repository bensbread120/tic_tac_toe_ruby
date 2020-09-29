# frozen_string_literal: true

module BoardChecks
  def vert_check(board, value)
    (0..2).each do |num|
      return true if board[num] + board[num + 3] + board[num + 6] == value * 3
    end
  end

  def horz_check(board, value)
    [0, 3, 6].each do |num|
      return true if board[num] + board[num + 1] + board[num + 2] == value * 3
    end
  end

  def diag_check(board, value)
    board[0] + board[4] + board[8] == value * 3 || board[2] + board[4] + board[6] == value * 3
  end

  def full_board_check(board)
    !board.include?(' ')
  end
end
