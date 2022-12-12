# frozen_string_literal: true

RSpec.describe Puzzle2::Round do
  it "maps players' moves to shapes" do
    round = described_class.new(:A, :Z)

    expect(round.player2_shape).to eq(:s)
  end

  context "when accessing player points" do
    let(:calc_double) { instance_double(Puzzle2::RoundPointsCalculator) }

    it "delegates point calculation to RoundPointsCalculator" do
      round = described_class.new(:A, :Z)

      expect(Puzzle2::RoundPointsCalculator).to receive(:new).with(round).and_return(calc_double)

      expect(calc_double).to receive(:player2_points).and_return(2)

      expect(round.player2_points).to eq(2)
    end
  end
end
