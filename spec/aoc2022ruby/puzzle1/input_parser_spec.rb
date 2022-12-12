# frozen_string_literal: true

RSpec.describe Puzzle1::InputParser do
  let(:input_file_path) { "spec/fixtures/puzzle1/input.txt" }
  let(:expected_output) do
    [[1000, 2000, 3000], [4000], [5000, 6000], [7000, 8000, 9000], [10_000]]
  end

  it "yields consecutive lines to given block" do
    expect do |b|
      described_class.new.parse(path: input_file_path, &b)
    end.to yield_successive_args(*expected_output)
  end

  context "when the last line is empty" do
    let(:input_file_path) { "spec/fixtures/puzzle1/last_line_empty.txt" }

    it "still yields consecutive lines to given block" do
      expect do |b|
        described_class.new.parse(path: input_file_path, &b)
      end.to yield_successive_args(*expected_output)
    end
  end

  context "when the first line is empty" do
    let(:input_file_path) { "spec/fixtures/puzzle1/first_line_empty.txt" }

    it "still yields consecutive lines to given block" do
      expect do |b|
        described_class.new.parse(path: input_file_path, &b)
      end.to yield_successive_args(*expected_output)
    end
  end
end
