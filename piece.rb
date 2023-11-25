require "./text"

class Piece
  attr_accessor :symbol, :color, :has_moved

  def initialize(symbol, color)
    @symbol = symbol
    @color = color
    @has_moved = false
  end

  def to_s
    s = @symbol
  end

  # returns list of possible moves
  def possible_moves(position)
    []
  end
end

class Pawn < Piece
  def initialize(color)
    super "P", color
  end

  def possible_moves(position)
    # TODO: handle en pass en, and first move of 2 for pawns
    if color == :white
      [Position.new(position.rank + 1, position.file)]
    else
      [Position.new(position.rank - 1, position.file)]
    end
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
