require_relative 'field'
require_relative 'score'

class Board

  attr_reader :fields
  def initialize
    @fields = []
    @scoreX = Score.new("X")
    @scoreO = Score.new("O")
  end

  def turn(row, column, player)
    return "Row or column lies outside of bounds" unless row.between?(1,3) && column.between?(1,3)

    @fields.each do |field|
      return "field in use" if field.row == row && field.column == column
    end
    check(save(row, column, player))
  end

  def save(row, column, player)
    @fields << Field.new(row, column, player)
    score(row, column, player)
  end

  def score(row, column, player)
    player == 'X' ? @scoreX.calc(row, column) : @scoreO.calc(row, column)
  end

  def check(result)
    if result.nil?
      return "Success"
    elsif result.include?("Winner")
      return result
    end
  end
end
