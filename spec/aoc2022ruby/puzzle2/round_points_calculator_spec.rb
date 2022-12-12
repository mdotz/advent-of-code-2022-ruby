# frozen_string_literal: true

RSpec.describe Puzzle2::RoundPointsCalculator do
  it "adds points for the sign and for result of a round" do
    round = double(player1_sign: :r, player2_sign: :s)
    calc = described_class.new(round)

    expect(calc.player1_points).to eq(7)
    expect(calc.player2_points).to eq(3)
  end
end
