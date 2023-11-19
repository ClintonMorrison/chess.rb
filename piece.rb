require "./text"

class Piece
  def initialize(symbol, color)
    @symbol = symbol
    @color = color
  end

  def string
    s = @symbol

    if @color == "WHITE"
      " #{s} "
    else
      "*#{s}*"
    end
  end
end

# P = PAWN
# N = KNIGHT
# B = BISHOP
# R = ROOK
# Q = QUEEN
# K = KING

class Pawn < Piece
  def initialize(color)
    super "P", color
  end
end

class Knight < Piece
  def initialize(color)
    super "N", color
  end
end

class Bishop < Piece
  def initialize(color)
    super "B", color
  end
end

class Rook < Piece
  def initialize(color)
    super "R", color
  end
end

class Queen < Piece
  def initialize(color)
    super "Q", color
  end
end

class King < Piece
  def initialize(color)
    super "K", color
  end
end
