require "./text"
require "./board"
require "./display/grid"
require "./display/square"

# P = PAWN
# N = KNIGHT
# B = BISHOP
# R = ROCK
# K = KING
# Q = QUEEN

print "\n"

board = Board.new
board.display

print "\n"

square = Square.new("X", fg: :red, bg: :light_green)
print square.to_s

grid = Grid.new([
  [Square.new("X"), Square.new("Y")],
  [Square.new("Z")],
])

print grid

print "\n"
