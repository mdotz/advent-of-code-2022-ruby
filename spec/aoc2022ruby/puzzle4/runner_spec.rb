# frozen_string_literal: true

RSpec.describe Puzzle4::Runner do
  let(:path) { "spec/fixtures/puzzle4/input.txt" }

  describe ".part1" do
    it "outputs expected result" do
      expect { described_class.part1(path: path) }.to output("2\n").to_stdout
    end
  end

  describe ".part2" do
    it "outputs expected result" do
      expect { described_class.part2(path: path) }.to output("4\n").to_stdout
    end
  end
end
