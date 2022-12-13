# frozen_string_literal: true

RSpec.describe Day2::Runner do
  let(:path) { "spec/fixtures/day2/input.txt" }

  it "outputs expected result" do
    expect { described_class.call(path: path) }.to output("15\n").to_stdout
  end

  context "with Part2::MoveMapper  provided" do
    it "outputs expected result" do
      expect { described_class.call(path: path, move_mapper: Day2::Part2::MoveMapper) }
        .to output("12\n").to_stdout
    end
  end
end
