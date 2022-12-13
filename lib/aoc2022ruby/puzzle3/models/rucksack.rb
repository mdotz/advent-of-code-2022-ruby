# frozen_string_literal: true

module Puzzle3
  module Models
    class Rucksack
      attr_reader :contents

      def initialize(contents)
        @contents = contents
      end

      def compartments
        @compartments ||= [first_compartment, second_compartment]
      end

      private

      def first_compartment
        contents[0..half_content_size - 1]
      end

      def second_compartment
        contents[half_content_size..]
      end

      def half_content_size
        @half_content_size ||= contents.size / 2
      end
    end
  end
end
