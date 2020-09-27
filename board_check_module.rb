# frozen_string_literal: true

module BoardChecks
  def vert_check(board, value)
    (0..2).each do |num|
      if board[num] + board[num + 3] + board[num + 6] == value * 3
        puts "#{value} has won"
        return true
      end
    end
  end

  def horz_check(board, value)
    [0, 3, 6].each do |num|
      if board[num] + board[num + 1] + board[num + 2] == value * 3
        puts "#{value} has won"
        return true
      end
    end
  end

  def diag_check(board, value)
    return unless board[0] + board[4] + board[8] == value * 3 || board[2] + board[4] + board[6] == value * 3
      puts "#{value} has won"
    
    end
  end

  def full_board_check(board, _value)
    return if board.include?(' ')
      puts "That's a tie!"
      
    end
  end
end
