require "./text"
require "./board"
require "./display/grid"
require "./display/square"
require "./position"
require "./game"

# P = PAWN
# N = KNIGHT
# B = BISHOP
# R = ROCK
# K = KING
# Q = QUEEN

game = Game.new

while !game.is_over
  move = game.run
end
