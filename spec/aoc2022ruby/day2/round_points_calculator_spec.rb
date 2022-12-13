# frozen_string_literal: true

RSpec.describe Day2::RoundPointsCalculator do
  it "adds points for the shape and for result of a round" do
    round = double(player1_shape: :r, player2_shape: :s)
    calc = described_class.new(round)

    expect(calc.player2_points).to eq(3)
  end
end
