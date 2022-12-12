# frozen_string_literal: true

module Puzzle1
  class BagsCalculator
    def initialize(bags:)
      @bags = bags
    end

    def top_calories
      bags.map(&:total_calories).max
    end

    private

    attr_reader :bags
  end
end
