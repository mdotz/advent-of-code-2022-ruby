# frozen_string_literal: true

RSpec.describe Puzzle3::Runner do
  let(:path) { "spec/fixtures/puzzle3/input.txt" }

  it "outputs expected result" do
    expect { described_class.call(path: path) }.to output("157\n").to_stdout
  end
end
