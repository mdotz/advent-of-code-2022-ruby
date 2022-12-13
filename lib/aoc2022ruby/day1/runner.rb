# frozen_string_literal: true

module Day1
  class Runner
    def self.call(path:, top_bags: 1)
      bags = []

      Day1::InputParser.new.parse(path: path) do |consecutive_lines|
        bags << Day1::Bag.new(consecutive_lines)
      end

      puts Day1::BagsCalculator.new(bags: bags).top_calories(top_bags)
    end
  end
end
