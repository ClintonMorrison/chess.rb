require "./text"

class Piece
  attr_accessor :symbol, :color

  def initialize(symbol, bg_color)
    @symbol = symbol
    @color = bg_color
  end

  def to_s
    s = @symbol
  end
end

class Pawn < Piece
  def initialize(bg_color)
    super "P", bg_color
  end
end

class Knight < Piece
  def initialize(bg_color)
    super "N", bg_color
  end
end

class Bishop < Piece
  def initialize(bg_color)
    super "B", bg_color
  end
end

class Rook < Piece
  def initialize(bg_color)
    super "R", bg_color
  end
end

class Queen < Piece
  def initialize(bg_color)
    super "Q", bg_color
  end
end

class King < Piece
  def initialize(bg_color)
    super "K", bg_color
  end
end
