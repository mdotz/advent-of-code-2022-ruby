# frozen_string_literal: true

RSpec.describe Puzzle1::Runner do
  let(:path) { "spec/fixtures/puzzle1/input.txt" }

  context "for top 1 bags" do
    it "returns expected result" do
      expect { described_class.call(path: path) }.to output("24000\n").to_stdout
    end
  end

  context "for top 3 bags" do
    it "returns expected result" do
      expect { described_class.call(path: path, top_bags: 3) }.to output("45000\n").to_stdout
    end
  end
end
