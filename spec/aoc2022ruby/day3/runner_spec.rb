# frozen_string_literal: true

RSpec.describe Day3::Runner do
  let(:path) { "spec/fixtures/day3/input.txt" }

  describe ".part1" do
    it "outputs expected result" do
      expect { described_class.part1(path: path) }.to output("157\n").to_stdout
    end
  end

  describe ".part2" do
    it "outputs expected result" do
      expect { described_class.part2(path: path) }.to output("70\n").to_stdout
    end
  end
end
