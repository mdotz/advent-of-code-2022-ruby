# frozen_string_literal: true

module Day2
  class Runner
    def self.call(path:, move_mapper: Part1::MoveMapper)
      rounds = File.open(path, "r").each_with_object([]) do |line, acc|
        acc << Day2::Round.new(*line.split, move_mapper: move_mapper)
        acc
      end

      puts rounds.map(&:player2_points).sum
    end
  end
end
