# frozen_string_literal: true

module Puzzle1
  class Runner
    def self.call(path:)
      bags = []

      Puzzle1::InputParser.new.parse(path: path) do |consecutive_lines|
        bags << Puzzle1::Bag.new(consecutive_lines)
      end

      puts Puzzle1::BagsCalculator.new(bags: bags).top_calories
    end
  end
end
