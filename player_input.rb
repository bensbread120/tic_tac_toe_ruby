# frozen_string_literal: true

# function asks for integer within the specified board size
module PlayerInput
  def int_within_board(board_range)
    choose_position = gets
    if choose_position.nil? || choose_position.chomp.to_i > board_range - 1 || choose_position.chomp.to_i.negative?
      puts 'sorry can you pick that again'
      int_within_board(board_range)
    else
      choose_position.chomp.to_i
    end
  end
end
