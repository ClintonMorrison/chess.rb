class Move
  attr_accessor :piece, :start_position, :end_position

  def initialize(piece, start_position, end_position)
    @piece = piece
    @start_position = start_position
    @end_position = end_position
  end

  def to_s
    "#{@piece}#{@start_position}-#{@end_position}"
  end
end
