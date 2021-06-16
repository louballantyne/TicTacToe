require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    @player
  end

  def play(row,column)
    turn
    @board.turn(row,column,@player)
  end

  def turn
    @player == "X" ? @player = "O" : @player = "X"
  end
end
