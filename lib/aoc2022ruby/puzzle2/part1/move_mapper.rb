# frozen_string_literal: true

module Puzzle2
  module Part1
    class MoveMapper
      MOVE_MAPPING = { X: :r, Y: :p, Z: :s }.freeze

      def self.call(_, move2)
        MOVE_MAPPING[move2]
      end
    end
  end
end
