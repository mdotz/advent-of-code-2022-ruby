# frozen_string_literal: true

module Puzzle4
  module Models
    class Line
      def initialize(string)
        @string = string
      end

      def range1
        @range1 ||= parse_range(text_ranges.first)
      end

      def range2
        @range2 ||= parse_range(text_ranges.last)
      end

      private

      attr_reader :string

      def parse_range(text_range)
        splitted_text_range = text_range.split("-")

        (splitted_text_range.first.to_i..splitted_text_range.last.to_i)
      end

      def text_ranges
        @text_ranges ||= string.split(",")
      end
    end
  end
end
