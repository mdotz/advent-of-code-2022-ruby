# frozen_string_literal: true

RSpec.describe Day1::BagsCalculator do
  let(:bag1) { double(total_calories: 1) }
  let(:bag2) { double(total_calories: 2) }
  let(:bag3) { double(total_calories: 3) }
  let(:bag4) { double(total_calories: 4) }
  let(:bags) { [bag1, bag2, bag3, bag4] }

  describe "#top_calories" do
    context "when no argument is given" do
      it "prints out the sum of calories of top 1 bag" do
        calc = described_class.new(bags: bags)
        expect(calc.top_calories).to eq(4)
      end
    end

    context "when top 3 bags argument passed" do
      it "prints out the sum of calories of top 3 bags" do
        calc = described_class.new(bags: bags)
        expect(calc.top_calories(3)).to eq(9)
      end
    end
  end
end
