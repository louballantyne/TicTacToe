class Field

  attr_accessor :player, :row, :column

  def initialize(row, column, player)
    @row = row
    @column = column
    @player = player

  end

end
