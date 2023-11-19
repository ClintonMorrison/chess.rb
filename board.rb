require "./board"
require "./piece"
require "./display/grid"

class Board
  @@rank_letters = ["A", "B", "C", "D", "E", "F", "G", "H"]

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

  def render
    rank_labels = @@rank_letters.map { |letter| label_square(letter) }
    rank_labels.unshift(label_square(" "))
    rank_labels.push(label_square(" "))

    grid_rows = []

    @rows.reverse().each_with_index do |row, i|
      current_row = []

      file_number = @rows.length - i
      current_row.push(label_square(file_number))

      row.each_with_index do |piece, j|
        squareText = "#{piece.nil? ? " " : piece.to_s}"
        bg_color = (i + j) % 2 == 0 ? :white : :green
        fg_color = piece&.color == :black ? :red : :blue
        current_row.push(Square.new(squareText, fg: fg_color, bg: bg_color, underline: true))
      end

      current_row.push(label_square(file_number))
      grid_rows.push(current_row)
    end

    # Add rank labels at bottom and top
    grid_rows.unshift(rank_labels)
    grid_rows.push(rank_labels)

    Grid.new(grid_rows)
  end

  private

  def label_square(char)
    Square.new(char, fg: :white, bg: :black)
  end
end
