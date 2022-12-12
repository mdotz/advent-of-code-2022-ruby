# frozen_string_literal: true

module Puzzle2
  class RoundPointsCalculator
    POINTS_MAPPING = {
      r: 1, p: 2, s: 3
    }.freeze
    RESULTS_MAPPING = {
      r: { r: 3, p: 0, s: 6 },
      p: { r: 6, p: 3, s: 0 },
      s: { r: 0, p: 6, s: 3 }
    }.freeze

    def initialize(round)
      @player1_sign = round.player1_sign
      @player2_sign = round.player2_sign
    end

    def player1_points
      points(player1_sign, player2_sign)
    end

    def player2_points
      points(player2_sign, player1_sign)
    end

    private

    attr_reader :player1_sign, :player2_sign

    def points(sign1, sign2)
      POINTS_MAPPING[sign1] + RESULTS_MAPPING[sign1][sign2]
    end
  end
end
