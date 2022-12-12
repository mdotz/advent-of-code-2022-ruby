# frozen_string_literal: true

module Puzzle1
  class BagsCalculator
    def initialize(bags:)
      @bags = bags
    end

    def top_calories(number_of_top_bags = 1)
      bags.map(&:total_calories)
          .max(number_of_top_bags)
          .sum
    end

    private

    attr_reader :bags
  end
end
