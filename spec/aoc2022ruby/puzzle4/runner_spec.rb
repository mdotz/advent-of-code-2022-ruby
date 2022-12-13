# frozen_string_literal: true

RSpec.describe Puzzle4::Runner do
  let(:path) { "spec/fixtures/puzzle4/input.txt" }

  describe ".call" do
    it "outputs expected result" do
      expect { described_class.call(path: path) }.to output("2\n").to_stdout
    end
  end
end
