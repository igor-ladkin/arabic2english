class NumberInWords
  NUMBER_PRIMITIVES = {
    0 => 'zero',  10 => 'ten',        20 => 'twenty',
    1 => 'one',   11 => 'eleven',     30 => 'thirty',
    2 => 'two',   12 => 'twelve',     40 => 'forty',
    3 => 'three', 13 => 'thirteen',   50 => 'fifty',
    4 => 'four',  14 => 'fourteen',   60 => 'sixty',
    5 => 'five',  15 => 'fifteen',    70 => 'seventy',
    6 => 'six',   16 => 'sixteen',    80 => 'eighty',
    7 => 'seven', 17 => 'seventeen',  90 => 'ninety',
    8 => 'eight', 18 => 'eighteen',
    9 => 'nine',  19 => 'nineteen'
  }

  attr_reader :value

  def initialize(number)
    @value = number
  end

  def in_words
    @in_words ||= NUMBER_PRIMITIVES.fetch(@value)
  end
end