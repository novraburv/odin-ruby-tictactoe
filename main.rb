# frozen_string_literal: true

require 'colorize'

require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new('Player 1', 'X')
player2 = Player.new('Player 2', 'O')

the_game = Game.new(player1, player2)

the_game.start
