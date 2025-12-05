# frozen_string_literal: true

# Board fulfills evrything needed to keep track of during a game
# concerning the board, like code, guesses and so on
class Board
  @colors = {
    0 => 'R',
    1 => 'Y',
    2 => 'G',
    3 => 'B',
    4 => 'P',
    5 => 'W'
  }

  def create_key
    @key = 4.times.map { rand(0..5) }
  end

  def show_code(code)
    print code
  end

  def puts_color_table
    puts '0 -> (R)ed'
    puts '1 -> (Y)ellow'
    puts '2 -> (G)reen'
    puts '3 -> (B)lue'
    puts '4 -> (P)urple'
    puts '5 -> (W)hite'
  end

  def show_code_as_colors(code)
    code.map { |c| @colors[c] }
  end
end

# parse the guess
#     check if right
#         if no
#             return the red and white pins (how good is the guess)
#         if yes return correct
#
#
