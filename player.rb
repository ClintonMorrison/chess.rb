class Player
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def to_s
    @color
  end

  def owns_piece(piece)
    piece.color == @color
  end
end
