# frozen_string_literal: true

# Board fulfills evrything needed to keep track of during a game
# concerning the board, like code, guesses and so on
class Board
  extend(ColorCodeDisplay)
  def create_key
    @key = 4.times.map { rand(0..5) }
  end

  def show_code(code)
    print code
  end
end

# parse the guess
#     check if right
#         if no
#             return the red and white pins (how good is the guess)
#         if yes return correct
#
#
