# frozen_string_literal: true

require "forwardable"

module Puzzle2
  class Round
    extend Forwardable

    SIGN_MAPPING = {
      A: :r, B: :p, C: :s,
      X: :r, Y: :p, Z: :s
    }.freeze

    def_delegators :points_calculator, :player1_points, :player2_points

    def initialize(player1_move, player2_move)
      @player1_move = player1_move.to_sym
      @player2_move = player2_move.to_sym
    end

    def player1_sign
      @player1_sign ||= SIGN_MAPPING[player1_move]
    end

    def player2_sign
      @player2_sign ||= SIGN_MAPPING[player2_move]
    end

    private

    attr_reader :player1_move, :player2_move

    def points_calculator
      @points_calculator ||= Puzzle2::RoundPointsCalculator.new(self)
    end
  end
end
