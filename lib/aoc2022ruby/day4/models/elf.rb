# frozen_string_literal: true

module Day4
  module Models
    class Elf
      attr_reader :sections_range

      def initialize(sections_range)
        @sections_range = sections_range
      end

      def first_section
        sections_range.first
      end

      def last_section
        sections_range.last
      end
    end
  end
end
