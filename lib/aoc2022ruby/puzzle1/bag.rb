# frozen_string_literal: true

module Puzzle1
  class Bag
    attr_reader :foods

    def initialize(foods = [])
      @foods = foods
    end

    def add_food(food)
      foods << food
    end

    def total_calories
      foods.sum
    end
  end
end
