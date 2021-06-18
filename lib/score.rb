class Score

  def initialize(player)
    @fields = []
    @message = "#{player} is the Winner - game over"
  end

  def calc(row, column)
    @fields << [row, column]
    if @fields.include?([2,2])
      check_middle_win
    elsif @fields.include?([1,1])
      check_first_win
    elsif @fields.include?([3,3])
      check_last_win
    end
  end

  def check_middle_win
    return @message if @fields.include?([2,1]) && @fields.include?([2,3])
    return @message if @fields.include?([1,2]) && @fields.include?([3,2])
    return @message if @fields.include?([1,1]) && @fields.include?([3,3])
    return @message if @fields.include?([3,1]) && @fields.include?([1,3])
  end

  def check_first_win
    return @message if @fields.include?([1,2]) && @fields.include?([1,3])
    return @message if @fields.include?([2,1]) && @fields.include?([3,1])
  end

  def check_last_win
    return @message if @fields.include?([3,1]) && @fields.include?([3,2])
    return @message if @fields.include?([1,3]) && @fields.include?([2,3])
  end

end
