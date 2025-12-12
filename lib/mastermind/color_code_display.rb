# frozen_string_literal: true

# As numbers are used for pins, this module transforms the numbers
# to colors for readability for player
module ColorCodeDisplay
  COLORS = {
    0 => 'R',
    1 => 'Y',
    2 => 'G',
    3 => 'B',
    4 => 'P',
    5 => 'W'
  }.freeze

  def puts_color_table
    puts '0 -> (R)ed'
    puts '1 -> (Y)ellow'
    puts '2 -> (G)reen'
    puts '3 -> (B)lue'
    puts '4 -> (P)urple'
    puts '5 -> (W)hite'
  end

  def colorize(code)
    code.map { |c| COLORS[c] }
  end
end
