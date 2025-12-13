# frozen_string_literal: true

require_relative '../mastermind/color_code_display'
require_relative '../mastermind/board'
require_relative '../mastermind/player'

# Main gameplay loop
class Game
  def self.run
    player = Player.new
    board = Board.new
    if player.solver == true
      board.player_game(player)
    else
      board.computer_game(player)
    end
  end
end
