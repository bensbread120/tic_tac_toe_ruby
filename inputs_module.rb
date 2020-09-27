# frozen_string_literal: true

module Inputs
  def int_less_than_9
    choose_postiion = gets.chomp.to_i
    (choose_postiion <= 8) && (choose_postiion >= 0) ? (return choose_postiion) : int_less_than_9
  end

  def pick_x_or_o
    player_choice = gets
    if player_choice.chomp == 'O'
      %w[O X]
    elsif player_choice.chomp == 'X'
      %w[X O]
    else
      puts "sorry that wasn't an option can you pick again?"
      pick_x_or_o
    end
  end
end
