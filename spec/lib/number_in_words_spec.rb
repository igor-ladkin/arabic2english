require 'spec_helper'
require 'number_in_words'

RSpec.describe NumberInWords do
  describe '#in_words method' do
    context 'for primitive numbers' do
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

    context 'for simple compound numbers (only hundreds, tens and ones)' do
      it 'returns twenty-one for 21' do
        number = NumberInWords.new 21
        expect(number.in_words).to eq 'twenty-one'
      end

      it 'returns sixty-seven for 67' do
        number = NumberInWords.new 67
        expect(number.in_words).to eq 'sixty-seven'
      end

      it 'returns one hundred twenty-one for 121' do
        number = NumberInWords.new 121
        expect(number.in_words).to eq 'one hundred twenty-one'
      end

      it 'returns three hundred five for 305' do
        number = NumberInWords.new 305
        expect(number.in_words).to eq 'three hundred five'
      end

      it 'does not contain hundreds for 82' do
        number = NumberInWords.new 82
        expect(number.in_words).to_not include('hundred')
      end

      it 'does not contain tens for 909' do
        number = NumberInWords.new 909
        expect(number.in_words).to_not include('ty-')
      end
    end

    context 'for complex compound number (with thousands, millions, billions etc.)' do
      it 'returns three hundred fifty-one thousand twelve for 351012' do
        number = NumberInWords.new 351012
        expect(number.in_words).to eq 'three hundred fifty-one thousand twelve'
      end

      it 'returns thirty million fifty-one thousand twelve for 30051012' do
        number = NumberInWords.new 30051012
        expect(number.in_words).to eq 'thirty million fifty-one thousand twelve'
      end

      it 'returns twenty-one million six hundred eighty thousand thirteen for 21680013' do
        number = NumberInWords.new 21680013
        expect(number.in_words).to eq 'twenty-one million six hundred eighty thousand thirteen'
      end

      it 'returns eight billion one hundred twenty-three for 8000000123' do
        number = NumberInWords.new 8000000123
        expect(number.in_words).to eq 'eight billion one hundred twenty-three'
      end

      it 'does not contain thousands for 12000050' do
        number = NumberInWords.new 12000050
        expect(number.in_words).to_not include('thousand')
      end

      it 'does not contain millions for 12000777050' do
        number = NumberInWords.new 12000777050
        expect(number.in_words).to_not include('million')
      end

      it 'does not contain millions or thousands for 9000000009' do
        number = NumberInWords.new 9000000009
        expect(number.in_words).to_not include('thousand')
        expect(number.in_words).to_not include('million')
      end
    end
  end
end