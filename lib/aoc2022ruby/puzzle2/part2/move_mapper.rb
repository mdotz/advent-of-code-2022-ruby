# frozen_string_literal: true

module Puzzle2
  module Part2
    class MoveMapper
      MOVE_MAPPING = {
        X: { r: :s, p: :r, s: :p },
        Y: { r: :r, p: :p, s: :s },
        Z: { r: :p, p: :s, s: :r }
      }.freeze

      def self.call(player1_shape, player2_move)
        MOVE_MAPPING[player2_move][player1_shape]
      end
    end
  end
end
