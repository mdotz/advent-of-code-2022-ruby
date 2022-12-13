# frozen_string_literal: true

require "forwardable"

module Day2
  class Round
    extend Forwardable

    PLAYER1_SHAPE_MAPPING = { A: :r, B: :p, C: :s }.freeze

    def_delegators :points_calculator, :player1_points, :player2_points

    def initialize(player1_move, player2_move, move_mapper: Part1::MoveMapper)
      @player1_move = player1_move.to_sym
      @player2_move = player2_move.to_sym
      @move_mapper = move_mapper
    end

    def player1_shape
      @player1_shape ||= PLAYER1_SHAPE_MAPPING[player1_move]
    end

    def player2_shape
      @player2_shape ||= move_mapper.call(player1_shape, player2_move)
    end

    private

    attr_reader :player1_move, :player2_move, :move_mapper

    def points_calculator
      @points_calculator ||= Day2::RoundPointsCalculator.new(self)
    end
  end
end
