class TextEffect
  attr_accessor :start_code, :end_code

  # fg color codes
  # See https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4
  @@color_codes = {
    black: 30,
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    magenta: 35,
    cyan: 36,
    light_gray: 37,
    gray: 90,
    light_red: 91,
    light_green: 92,
    light_yellow: 93,
    light_blue: 94,
    light_magenta: 95,
    light_cyan: 96,
    white: 97,
  }

  @@style_codes = {
    reset: 0,
    bold: 1,
    faint: 2,
    italic: 3,
    underline: 4,
  }

  def initialize(start_code, end_code = 0)
    @start_code = start_code
    @end_code = end_code
  end

  def apply(text)
    "\e[#{@start_code}m#{text}\e[#{@end_code}m"
  end

  def self.for_color(color_name, is_fg: true)
    code = @@color_codes.fetch(color_name, 30)
    code = is_fg ? code : code + 10 # bg codes are 10 higher
    TextEffect.new(code)
  end

  def self.fg_color(color_name)
    code = @@color_codes.fetch(color_name, 30)
    TextEffect.new(code)
  end

  def self.bg_color(color_name)
    code = @@color_codes.fetch(color_name, 30)
    code = code + 10 # bg codes are 10 higher
    TextEffect.new(code)
  end

  def self.underline
    TextEffect.new(@@style_codes[:underline])
  end
end
