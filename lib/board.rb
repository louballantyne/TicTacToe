require_relative 'field'

class Board

  attr_reader :fields
  def initialize
    @fields = []
  end

  def turn(row, column, player)
    return "Row or column lies outside of bounds" unless row.between?(0,3) && column.between?(0,3)

    @fields.each do |field|
      return "field in use" if field.row == row && field.column == column
    end
    @fields << Field.new(row, column, player)
  end
end
