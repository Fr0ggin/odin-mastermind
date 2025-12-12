# frozen_string_literal: true

# Game fulfills all methods needed for running the game
class Game
  extend(ColorCodeDisplay)
  ALLOWED_INPUT = %w[R Y G B P W].freeze

  # check if victory is achieved
  def victory?(key, guess)
    key == guess
  end

  # add a count to the amount of turns, broke on 12
  def add_turn
    @turn += 1
  end

  def gets_guess
    puts 'Enter your guess'
    loop do
      guess = gets.chomp.split('')
      if guess.length == 4 &&
         guess.all? { |v| ALLOWED_INPUT.include?(v) }
        return guess.map { |a| COLORS.key(a) }
      end

      puts 'Invalid input, pick 4 pins'
    end
  end

  def full_guess(key, guess)
    red_pins, key_rest, guess_rest = count_red_pins(key, guess)
    white_pins = count_white_pins(key_rest, guess_rest)
    [red_pins, white_pins]
  end

  private

  # to avoid duplicate as false positives we use two passes, everything not a red
  # pin will go into rest, to check on whites. this way we ensure right position
  def count_red_pins(key, guess) # rubocop:disable Metrics/MethodLength
    red_pins = 0
    key_rest = []
    guess_rest = []

    guess.each_index do |i|
      if guess[i] == key[i]
        red_pins += 1
      else
        key_rest << key[i]
        guess_rest << guess[i]
      end
    end

    [red_pins, key_rest, guess_rest]
  end

  def count_white_pins(key_rest, guess_rest)
    white_pins = 0
    guess_rest.each do |guess|
      ind = key_rest.index(guess)
      if ind
        white_pins += 1
        key_rest.delete_at(ind)
      end
    end
    white_pins
  end

  def show_guess_result(guess, red_pins, white_pins)
    puts("#{colorize(guess)} | R#{red_pins} W#{white_pins}")
  end

  # def game_loop(key)
  #   guess = gets_guess
  #   red_pins, white_pins = full_guess(key, guess)

  # end
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
