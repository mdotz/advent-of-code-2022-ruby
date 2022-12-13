# frozen_string_literal: true

module Puzzle3
  class CompartmentSearcher
    def self.common_item_value(first_compartment, second_compartment)
      new(first_compartment, second_compartment)
        .common_item_value
    end

    def initialize(first_compartment, second_compartment)
      @first_compartment = first_compartment
      @second_compartment = second_compartment
    end

    def common_item_value
      value_map[common_item]
    end

    private

    attr_reader :first_compartment, :second_compartment

    def common_item
      @common_item ||= first_compartment.split("").uniq.find do |item|
        second_compartment.split("").uniq.include?(item)
      end
    end

    def value_map
      @value_map ||= ValueMap.build
    end
  end
end
