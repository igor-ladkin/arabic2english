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

  POWER_RANKS = {
    0 => '',
    1 => ' thousand ',
    2 => ' million ',
    3 => ' billion ',
    4 => ' trillion '
  }

  attr_reader :value

  def initialize(number)
    raise ArgumentError if (!number.is_a?(Fixnum) || number.to_i < 0)
    @value = number
  end

  def in_words
    @in_words ||= translate_to_words
  end

  def to_s
    in_words
  end

  def inspect
    {
      value: value,
      in_words: in_words
    }
  end

  private

  def translate_to_words
    raise UnableToConvertError if value.to_s.length > 15
    return NUMBER_PRIMITIVES[value] if NUMBER_PRIMITIVES.has_key? value

    word_presentation = ''
    
    multipliers = split_by_thousands
    multipliers.each_with_index do |multiplier, power|
      if multiplier != 0
        word_presentation = convert_multiplier_to_words(multiplier) + POWER_RANKS[power] + word_presentation
      end
    end

    word_presentation
  end

  def split_by_thousands
    multipliers = []
    number = value
    
    begin
      multipliers << number % 1000
      number = number / 1000
    end while number != 0

    multipliers
  end

  def convert_multiplier_to_words(multiplier)
    return NUMBER_PRIMITIVES[multiplier] if NUMBER_PRIMITIVES.has_key? multiplier

    digits = split_multiplier_into_digits(multiplier)
    word_presentation = ''

    word_presentation = append_hundreds(word_presentation, digits)
    word_presentation = append_tens_and_ones(word_presentation, digits)
    
    word_presentation.strip
  end

  def split_multiplier_into_digits(multiplier)
    multiplier.to_s.split('').reverse.map(&:to_i)
  end

  def append_hundreds(word_presentation, digits)
    word_presentation += NUMBER_PRIMITIVES[digits[2]] + ' hundred ' unless digits[2].nil? || digits[2] == 0
    
    word_presentation
  end

  def append_tens_and_ones(word_presentation, digits)
    tens_with_ones = digits[1] * 10 + digits[0]
    if NUMBER_PRIMITIVES.has_key?(tens_with_ones) && tens_with_ones != 0
      return word_presentation + NUMBER_PRIMITIVES[tens_with_ones]
    end

    word_presentation += NUMBER_PRIMITIVES[digits[1] * 10] + '-' unless digits[1] == 0
    word_presentation += NUMBER_PRIMITIVES[digits[0]] unless digits[0] == 0

    word_presentation
  end
end

class UnableToConvertError < StandardError ; end

if __FILE__ == $0
  if !ARGV.empty?
    ARGV.each do |agrument|
      begin
        number = NumberInWords.new(Integer agrument)
        puts number
      rescue ArgumentError, UnableToConvertError
        puts 'Seems like you are trying to convert a really big number or not a nonnegative integer number at all. Please check your input.'
      end 
    end
  else
    loop do
      puts 'Please enter a nonnegative number you would like to convert to words: '
      agrument = gets.strip

      if agrument == 'exit'
        puts 'I am glad to help. See you next time 8-)'
        break
      end

      begin
        number = NumberInWords.new(Integer agrument)
        puts number
      rescue ArgumentError, UnableToConvertError
        puts 'Seems like you are trying to convert a really big number or not a nonnegative integer number at all. Please check your input.'
      end

      puts '-' * 80
    end
  end
end