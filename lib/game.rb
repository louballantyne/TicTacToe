require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    @player = "X"
  end

  def play(row,column)
    res = @board.turn(row,column,@player)
    res == "Success"? turn : res
  end

  def turn
    @player == "X" ? @player = "O" : @player = "X"
  end
end
