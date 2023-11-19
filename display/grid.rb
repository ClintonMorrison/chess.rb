class Grid
  attr_accessor :rows

  def initialize(rows)
    @rows = rows
  end

  def to_s
    result = ""

    for row in @rows
      for col in row
        result << col.to_s
      end
      result << "\n"
    end

    result
  end
end
