# frozen_string_literal: true

module Day4
  module Models
    class Pair
      attr_reader :elf1, :elf2

      def initialize(elf1, elf2)
        @elf1 = elf1
        @elf2 = elf2
      end
    end
  end
end
