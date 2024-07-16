# frozen_string_literal: true

# generate Player object
class Player
  attr_reader :name, :icon, :moves

  def initialize(name, icon)
    @name = name
    @icon = icon
    @moves = []
  end

  def record_moves(pos)
    @moves << pos
  end
end
