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
    @in_words ||= translate_to_words
  end

  private

  def translate_to_words
    return NUMBER_PRIMITIVES[@value] if NUMBER_PRIMITIVES.has_key? @value

    digits = value.to_s.split('').reverse.map(&:to_i)
    word_presentation = ''
    word_presentation = NUMBER_PRIMITIVES[digits[0]] unless digits[0] == 0
    word_presentation = NUMBER_PRIMITIVES[digits[1] * 10] + "-#{word_presentation}" unless digits[1] == 0
    word_presentation = NUMBER_PRIMITIVES[digits[2]] + " hundred " + word_presentation unless digits[2].nil? || digits[2] == 0
    
    word_presentation
  end
end

# puts NumberInWords.new(21).in_words