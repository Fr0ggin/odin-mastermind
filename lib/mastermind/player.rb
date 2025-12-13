# frozen_string_literal: true

# Contains all the information concerning the player
class Player
  attr_accessor :name
  attr_reader :solver

  def initialize(name = 'Player1')
    @name = name
    @wins = 0
    @losses = 0
    @solver = true
  end

  def add_win
    @wins += 1
  end

  def add_loss
    @losses += 1
  end

  def tell_score
    puts("You have #{@wins} win(s) and #{@losses} loss(es)")
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
