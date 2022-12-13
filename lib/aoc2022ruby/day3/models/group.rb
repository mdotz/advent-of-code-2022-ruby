# frozen_string_literal: true

module Day3
  module Models
    class Group
      class ValidationError < StandardError; end

      attr_reader :rucksacks

      def initialize(rucksacks)
        @rucksacks = rucksacks

        validate!
      end

      def contents
        @contents ||= rucksacks.map(&:contents)
      end

      private

      def validate!
        return if rucksacks.size == 3

        raise ValidationError, "Group must consist of 3 rucksacks"
      end
    end
  end
end
