# frozen_string_literal: true

RSpec.describe Puzzle2::Runner do
  let(:path) { "spec/fixtures/puzzle2/input.txt" }

  it "outputs expected result" do
    expect { described_class.call(path: path) }.to output("15\n").to_stdout
  end
end
