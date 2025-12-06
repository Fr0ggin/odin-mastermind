# frozen_string_literal: true

# Game fulfills all methods needed for running the game
class Game
  ALLOWED_INPUT = %w[R Y G B P W].freeze

  def guess
    puts 'Enter your guess'
    loop do
      guess = gets.chomp.split('')
      if guess.length == 4 && guess.all? do |v|
        ALLOWED_INPUT.include?(v)
      end
        return guess
      end

      puts 'Invalid unput, pick 4 pins'
    end
  end
end

# Class Game

#   -> debug show code for easier debug
#   guess
#     correct = victory
#     check turn, if <12
#              turn +1
#   if turn = 12
#     end
#
