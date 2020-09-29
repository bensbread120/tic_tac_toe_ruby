# frozen_string_literal: true

def int_less_than_9
  choose_position = gets
  if choose_position.nil? || choose_position.chomp.to_i > 8 || choose_position.chomp.to_i.negative?
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
