class Position
  @@file_letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
  @@rank_numbers = ["1", "2", "3", "4", "5", "6", "7", "8"]

  attr_accessor :rank, :file

  def initialize(rank, file)
    @rank = rank
    @file = file
  end

  def to_s()
    "#{@@file_letters[@file]}#{@@rank_numbers[@rank]}"
  end

  def self.from_s(s)
    s = s.upcase

    if s.length != 2
      raise ArgumentError, "Position #{s} invalid - should be two characters (e.g. A1)"
    end

    file = @@file_letters.find_index(s[0])
    rank = @@rank_numbers.find_index(s[1])

    if file.nil?
      raise ArgumentError, "Position #{s} invalid - file must be letter between A and H"
    end

    if rank.nil?
      raise ArgumentError, "Position #{s} invalid - rank must be number between 1 and 9"
    end

    Position.new(rank, file)
  end

  def ==(other)
    self.to_s == other.to_s
  end
end
