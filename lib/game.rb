require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    @player = "X"
  end

  def play(row,column)
    puts check_over(@board.turn(row,column,@player))
    exit if @result.include?("over")
  end

  def turn
    @player == "X" ? @player = "O" : @player = "X"
  end

  def check_over(result)
    @result = result
    case result
    when "Success" then turn
    when "Board full - game over"
      result
    when result.include?("Winner - game over")
      result
    else result
    end
  end
end
