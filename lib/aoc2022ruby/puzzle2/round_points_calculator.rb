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
      @player1_shape = round.player1_shape
      @player2_shape = round.player2_shape
    end

    def player2_points
      POINTS_MAPPING[player2_shape] + RESULTS_MAPPING[player2_shape][player1_shape]
    end

    private

    attr_reader :player1_shape, :player2_shape
  end
end
