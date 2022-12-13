# frozen_string_literal: true

module Puzzle4
  module Models
    class Elf
      def initialize(sections_range)
        @sections_range = sections_range
      end

      def first_section
        sections_range.first
      end

      def last_section
        sections_range.last
      end

      private

      attr_reader :sections_range
    end
  end
end
