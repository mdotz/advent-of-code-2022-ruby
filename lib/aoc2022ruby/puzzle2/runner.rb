# frozen_string_literal: true

module Puzzle2
  class Runner
    def self.call(path:)
      rounds = File.open(path, "r").each_with_object([]) do |line, acc|
        acc << Puzzle2::Round.new(*line.split)
        acc
      end

      puts rounds.map(&:player2_points).sum
    end
  end
end
