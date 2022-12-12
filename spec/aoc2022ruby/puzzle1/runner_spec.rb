# frozen_string_literal: true

RSpec.describe Puzzle1::Runner do
  let(:path) { "spec/fixtures/puzzle1/input.txt" }

  it "returns expected result" do
    expect { described_class.call(path: path) }.to output("24000\n").to_stdout
  end
end
