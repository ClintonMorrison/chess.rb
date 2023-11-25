require "./board"
require "./piece"
require "./display/grid"

class Board
  @@file_letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
  @@rank_numbers = ["1", "2", "3", "4", "5", "6", "7", "8"]

  def initialize
    @rows = Array.new(8) # ranks
    for i in 0..7
      @rows[i] = Array.new(8) # files
      @rows[i].each_with_index do |item, j|
        @rows[i][j] = nil
      end
    end

    # Setup initial game board
    @rows[0] = [
      Rook.new(:white),
      Knight.new(:white),
      Bishop.new(:white),
      Queen.new(:white),
      King.new(:white),
      Bishop.new(:white),
      Knight.new(:white),
      Rook.new(:white),
    ]
    @rows[1] = [
      Pawn.new(:white),
      Pawn.new(:white),
      Pawn.new(:white),
      Pawn.new(:white),
      Pawn.new(:white),
      Pawn.new(:white),
      Pawn.new(:white),
      Pawn.new(:white),
    ]
    @rows[7] = [
      Pawn.new(:black),
      Pawn.new(:black),
      Pawn.new(:black),
      Pawn.new(:black),
      Pawn.new(:black),
      Pawn.new(:black),
      Pawn.new(:black),
      Pawn.new(:black),
    ]
    @rows[8] = [
      Rook.new(:black),
      Knight.new(:black),
      Bishop.new(:black),
      Queen.new(:black),
      King.new(:black),
      Bishop.new(:black),
      Knight.new(:black),
      Rook.new(:black),
    ]
  end

  # returns piece at given space, or nil
  def piece_at(position)
    @rows[position.rank][position.file]
  end

  # returns true if given space is empty
  def empty_at(position)
    @rows[position.rank][position.file].nil?
  end

  # moves piece at given position to a new position
  def move_piece(start_position, end_position)
    # TODO: validate piece present, and end position empty
    piece = @rows[start_position.rank][start_position.file]
    @rows[start_position.rank][start_position.file] = nil
    @rows[end_position.rank][end_position.file] = piece
  end

  def render
    file_labels = @@file_letters.map { |letter| label_square(letter) }
    file_labels.unshift(label_square(" "))
    file_labels.push(label_square(" "))

    grid_rows = []

    @rows.reverse().each_with_index do |row, i|
      current_row = []

      file_number = @rows.length - i
      current_row.push(label_square(file_number))

      row.each_with_index do |piece, j|
        current_row.push(piece_square(piece, i, j))
      end

      current_row.push(label_square(file_number))
      grid_rows.push(current_row)
    end

    # Add rank labels at bottom and top
    grid_rows.unshift(file_labels)
    grid_rows.push(file_labels)

    Grid.new(grid_rows)
  end

  private

  def label_square(char)
    Square.new(char, fg: :white, bg: :black)
  end

  def piece_square(piece, i, j)
    text = "#{piece.nil? ? " " : piece.to_s}"
    bg_color = (i + j) % 2 == 0 ? :white : :green
    fg_color = piece&.color == :black ? :red : :blue
    Square.new(text, fg: fg_color, bg: bg_color, underline: true)
  end
end
