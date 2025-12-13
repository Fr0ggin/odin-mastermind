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

  ANSI = {
    'R' => "\e[31m", # red
    'Y' => "\e[93m", # yellow
    'G' => "\e[32m", # green
    'B' => "\e[34m", # blue
    'P' => "\e[35m", # purple
    'W' => "\e[37m"  # white
  }.freeze

  RESET = "\e[0m"

  def puts_color_table
    puts '0 -> (R)ed'
    puts '1 -> (Y)ellow'
    puts '2 -> (G)reen'
    puts '3 -> (B)lue'
    puts '4 -> (P)urple'
    puts '5 -> (W)hite'
  end

  def colorize(code)
    code
      .map { |n| COLORS[n] }                       # number → letter
      .map { |l| "#{ANSI[l]}●#{RESET}" }           # letter → colored peg
      .join(' ')                                   # array → string
  end
end
