require './text'
require './board'

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

print "\n"
