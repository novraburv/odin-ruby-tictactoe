# frozen_string_literal: true

# generate Board object
# contains data about the game board and methods to control it
class Board
  SEPARATOR = '+---+---+---+'
  attr_reader :array

  def initialize
    @array = Array.new(9)
  end

  def display # rubocop:disable Metrics/AbcSize
    puts SEPARATOR
    puts "| #{show_nil(array[0])} | #{show_nil(array[1])} | #{show_nil(array[2])} |"
    puts SEPARATOR
    puts "| #{show_nil(array[3])} | #{show_nil(array[4])} | #{show_nil(array[5])} |"
    puts SEPARATOR
    puts "| #{show_nil(array[6])} | #{show_nil(array[7])} | #{show_nil(array[8])} |"
    puts SEPARATOR
  end

  def set_cell(icon, index)
    array[index] = icon
  end

  def list_empty
    empty_index = []
    array.each_index { |i| empty_index.push(i) if array[i].nil? }
    empty_index
  end

  def full?
    array.all? { |cell| !cell.nil? }
  end

  def reset
    array.map! { nil }
  end

  private

  def show_nil(val)
    val.nil? ? ' ' : val
  end
end
