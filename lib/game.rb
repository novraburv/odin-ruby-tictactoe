# frozen_string_literal: true

require 'colorize'
require_relative 'board'

# generate Game object
# contains methods to start game loop and control the board
class Game
  WINNING_COMBINATION = %w[012 345 678 036 147 258 048 246].freeze

  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
    @b0 = Board.new
    @current_player = nil
  end

  def start
    loop do
      change_player
      display_turn
      receive_player_input
      next unless evaluate

      return
    end
  end

  private

  def receive_player_input
    player_input = gets.chomp.to_i
    @b0.set_cell(@current_player.icon, player_input)
    @current_player.record_moves(player_input)
  end

  def display_board
    system 'clear'
    @b0.display
  end

  def display_turn
    display_board
    puts "#{@current_player.name}, your turn"
    puts "Here's your available moves: #{@b0.list_empty}"
  end

  def display_no_move
    display_board
    puts 'TIE! the board is full'
    puts 'no possible move'
  end

  def display_winner(streak)
    display_board
    puts "#{@current_player.name} wins! \"#{@current_player.icon}\" streak on cell #{streak.split('').map(&:to_i)}"
      .colorize(:yellow)
  end

  def evaluate
    # evaluate winning combinations
    WINNING_COMBINATION.each do |comb|
      if comb.split('').all? { |index| @current_player.moves.include?(index.to_i) }
        display_winner(comb)
        return true
      end
    end
    # evaluate if board is full
    return unless @b0.full?

    display_no_move
    true
  end

  def change_player
    @current_player = if @current_player.nil? || @current_player.icon == 'O'
                        @p1
                      else
                        @p2
                      end
  end
end
