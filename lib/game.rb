require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play(row,column)
    @board.turn(row,column,1)
  end


end
