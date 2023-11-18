require './board'
require './piece'


class Board
  @@rank_letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']

  def initialize
    @rows = Array.new(8) # ranks
    for i in 0..7 do
      @rows[i] = Array.new(8) # files
      @rows[i].each_with_index do |item, j|
        @rows[i][j] = nil
      end
    end

    # Setup initial game board
    @rows[0] = [
      Rook.new('WHITE'),
      Knight.new('WHITE'),
      Bishop.new('WHITE'),
      Queen.new('WHITE'),
      King.new('WHITE'),
      Bishop.new('WHITE'),
      Knight.new('WHITE'),
      Rook.new('WHITE'),
    ]
    @rows[1] = [
      Pawn.new('WHITE'),
      Pawn.new('WHITE'),
      Pawn.new('WHITE'),
      Pawn.new('WHITE'),
      Pawn.new('WHITE'),
      Pawn.new('WHITE'),
      Pawn.new('WHITE'),
      Pawn.new('WHITE'),
    ]
    @rows[7] = [
      Pawn.new('BLACK'),
      Pawn.new('BLACK'),
      Pawn.new('BLACK'),
      Pawn.new('BLACK'),
      Pawn.new('BLACK'),
      Pawn.new('BLACK'),
      Pawn.new('BLACK'),
      Pawn.new('BLACK'),
    ]
    @rows[8] = [
      Rook.new('BLACK'),
      Knight.new('BLACK'),
      Bishop.new('BLACK'),
      Queen.new('BLACK'),
      King.new('BLACK'),
      Bishop.new('BLACK'),
      Knight.new('BLACK'),
      Rook.new('BLACK'),
    ]
  end

  def display_rank_labels
    print "   "
    for letter in @@rank_letters
      print " #{letter} "
    end
    print "\n"
  end

  def display
    self.display_rank_labels      

    @rows.reverse().each_with_index do |row, i|
      rank_number = @rows.length - i
      print " #{rank_number} "

      row.each_with_index do |col, j|
        colText = "#{col.nil? ? '   ' : col.string}"
        if (i + j) % 2 == 0
          print colText.bg_gray.underline
        else
          print colText.bg_green.underline
        end
      end

      print " #{rank_number} "
      print "\n"
    end

    self.display_rank_labels
  end
end