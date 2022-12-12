# frozen_string_literal: true

RSpec.describe Puzzle1::Bag do
  describe "#add_food" do
    it "adds food to the collection" do
      bag = described_class.new

      expect { bag.add_food(1) }.to change(bag, :foods).from([]).to([1])
    end
  end

  describe "#total_calories" do
    it "adds up calories" do
      bag = described_class.new([1, 2, 3])

      expect(bag.total_calories).to eq(6)
    end
  end
end
