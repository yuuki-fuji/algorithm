require 'rspec'
require_relative '../FizzBuzz_DDD/fizzbuzz'

RSpec.describe FizzBuzz do
  describe '.generate' do
    it '1のとき1を返す' do
      expect(FizzBuzz.generate(1)).to eq(1)
    end
    it '2のとき2を返す' do
      expect(FizzBuzz.generate(2)).to eq(2)
    end
    it '3のときFizzを返す' do
      expect(FizzBuzz.generate(3)).to eq('Fizz')
    end
    it '5のときBuzzを返す' do
      expect(FizzBuzz.generate(5)).to eq('Buzz')
    end
    it '15のときFizzBuzzを返す' do
      expect(FizzBuzz.generate(15)).to eq('FizzBuzz')
    end
  end
end
