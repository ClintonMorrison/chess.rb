require "./display/text_effect"

class Square
  def initialize(char, fg: :black, bg: :white, underline: true)
    @char = char
    @fg_color = fg
    @bg_color = bg
    @underline = underline
  end

  def to_s
    s = " #{@char} "
    s = TextEffect.for_color(@fg_color, is_fg: true).apply(s)
    s = TextEffect.for_color(@bg_color, is_fg: false).apply(s)
    if @underline
      s = TextEffect.underline.apply(s)
    end
  end
end
