require "./position"
require "./player"
require "./move"

class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new
    @players = [Player.new(:white), Player.new(:black)]
    @next_player_index = 0
  end

  def read_valid_move(player)
    begin
      prompt_for_move(player)
    rescue ArgumentError => error
      print "#{TextEffect.fg_color(:red).apply("Illegal move")}: #{error.message}\n\n"
      read_valid_move(player)
    end
  end

  def prompt_for_move(player)
    print "It is #{player.to_s}'s turn. "
    print "Enter move (e.g. A2-A3): "

    input = gets.chomp
    positions = input.split("-")

    # There must be two positions
    if positions.length != 2
      raise ArgumentError, "Enter two positions separated by a hyphen (e.g. A2-A3)"
    end

    start_position = Position.from_s(positions[0])
    end_position = Position.from_s(positions[1])

    # Start and end position must be different
    if start_position == end_position
      raise ArgumentError, "Start and end position must be different"
    end

    # There must be a piece at the start
    piece = @board.piece_at(start_position)
    if piece.nil?
      raise ArgumentError, "There is no piece at the given position: #{start_position}"
    end

    # The piece must belong to the current player
    if !player.owns_piece(piece)
      raise ArgumentError, "The piece at #{start_position} is not owned by #{player.color}"
    end

    # The destination must be a legal move for the piece
    possible_moves = piece.possible_moves(start_position)
    if !possible_moves.include?(end_position)
      raise ArgumentError, "#{start_position}→#{end_position} is not a valid move. Valid destinations: #{possible_moves.map { |m| m.to_s }}"
    end

    # The destination must not already be occupied with a piece owned by the current player
    destination_piece = @board.piece_at(end_position)
    if !destination_piece.nil? && player.owns_piece(destination_piece)
      raise ArgumentError, "The destination #{end_position} already contains a piece owned by #{player.color}"
    end

    # Also check: destination is empty OR contains capturable piece
    # Also check: king is not under check

    print("\n#{start_position} → #{end_position}\n")

    Move.new(piece, start_position, end_position)
  end

  def apply_move(move)
    # TODO: handle captures
    @board.move_piece(move.start_position, move.end_position)
  end

  def run
    for player in @players
      print "\n#{@board.render}\n"

      move = read_valid_move(player)
      apply_move(move)
    end
  end

  def is_over
    false
  end
end
