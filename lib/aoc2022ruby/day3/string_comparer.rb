# frozen_string_literal: true

module Day3
  class StringComparer
    def self.common_item_value(compartments)
      new(compartments).common_item_value
    end

    def initialize(compartments)
      @compartments = compartments
    end

    def common_item_value
      @common_item_value ||= value_map[common_item]
    end

    private

    attr_reader :compartments

    def common_item
      compartments.map(&method(:uniq_char_array)).reduce(:&).first
    end

    def uniq_char_array(string)
      string.split("").uniq
    end

    def value_map
      ValueMap.build
    end
  end
end
