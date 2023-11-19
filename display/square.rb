require "./display/text_effect"

class Square
  def initialize(char, fg: :black, bg: :white, underline: false)
    @char = char
    @fg_color = fg
    @bg_color = bg
    @underline = underline
  end

  def to_s
    s = " #{@char} "
    s = TextEffect.fg_color(@fg_color).apply(s)
    s = TextEffect.bg_color(@bg_color).apply(s)
    if @underline
      s = TextEffect.underline.apply(s)
    end
    s
  end
end
