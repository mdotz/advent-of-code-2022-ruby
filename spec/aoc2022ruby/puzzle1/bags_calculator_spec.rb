# frozen_string_literal: true

RSpec.describe Puzzle1::BagsCalculator do
  let(:bag1) { double(total_calories: 1) }
  let(:bag2) { double(total_calories: 2) }
  let(:bag3) { double(total_calories: 3) }
  let(:bags) { [bag1, bag2, bag3] }

  describe "#top_calories" do
    it "prints out the biggest sum of calories" do
      calc = described_class.new(bags: bags)
      expect(calc.top_calories).to eq(3)
    end
  end
end
