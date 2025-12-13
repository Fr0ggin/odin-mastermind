# frozen_string_literal: true

# Game fulfills all methods needed for passing gamestate
class Board
  extend(ColorCodeDisplay)
  ALLOWED_INPUT = %w[R Y G B P W].freeze

  def computer_create_key
    4.times.map { rand(0..5) }
  end

  # check if victory is achieved
  def victory?(key, guess)
    key == guess
  end

  # add a count to the amount of turns, broke on 12
  def add_turn
    @turn += 1
  end

  def gets_guess
    loop do
      guess = gets.chomp.upcase.split('')
      if guess.include?('H')
        Board.puts_color_table
      elsif guess.length == 4 &&
            guess.all? { |v| ALLOWED_INPUT.include?(v) }
        return guess.map { |a| ColorCodeDisplay::COLORS.key(a) }
      else
        puts 'Invalid input, pick 4 pins'
      end
    end
  end

  def full_guess(key, guess)
    red_pins, key_rest, guess_rest = count_red_pins(key, guess)
    white_pins = count_white_pins(key_rest, guess_rest)
    [red_pins, white_pins]
  end

  def show_guess_result(guess, red_pins, white_pins)
    red_pins = "\e[31m●\e[0m" * red_pins
    white_pins = "\e[37m●\e[0m" * white_pins
    puts("#{Board.colorize(guess)} | #{red_pins} #{white_pins}")
  end

  def player_game(player)
    loop do
      key = computer_create_key
      # DEBUG
      puts Board.colorize(key)
      turn = 1
      puts('We are starting, you can enter your guesses below, use "H" if you want help on the colors')
      while turn <= 12
        guess = gets_guess
        red_pins, white_pins = full_guess(key, guess)
        show_guess_result(guess, red_pins, white_pins)
        if victory?(key, guess)
          puts("Congratulations you cracked the code on turn #{turn}")
          player.add_win
          break
        end
        turn += 1
      end
      if turn > 12
        puts('Your out of turns and LOST')
        player.add_loss
      end
      player.tell_score
      puts('Do you want to play another game? (Y) / (N)')
      answer = gets.chomp.upcase
      break if answer == 'N'
    end
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
