require 'spec_helper'
require 'number_in_words'

RSpec.describe NumberInWords do
  describe 'primitive numbers' do
    it 'returns one for 1' do
      number = NumberInWords.new 1
      expect(number.in_words).to eq 'one'
    end

    it 'returns twelve for 12' do
      number = NumberInWords.new 12
      expect(number.in_words).to eq 'twelve'
    end

    it 'returns one for 17' do
      number = NumberInWords.new 17
      expect(number.in_words).to eq 'seventeen'
    end

    it 'returns one for 50' do
      number = NumberInWords.new 50
      expect(number.in_words).to eq 'fifty'
    end
  end
end