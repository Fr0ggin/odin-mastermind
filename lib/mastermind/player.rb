# frozen_string_literal: true

# Contains all the information concerning the player
class Player
  attr_accessor :name

  def initialize(name = 'Player1')
    @name = name
    @wins = 0
    @losses = 0
    @solver = false
    @code_creator = false
  end
end

# Class Players
#     initialize
# wins
# losses
# solver
# code_creator
#
#
