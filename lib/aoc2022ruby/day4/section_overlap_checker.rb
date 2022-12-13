# frozen_string_literal: true

module Day4
  class SectionOverlapChecker
    def self.sections_fully_overlap?(pair)
      new(pair).sections_fully_overlap?
    end

    def self.sections_overlap?(pair)
      new(pair).sections_overlap?
    end

    def initialize(pair)
      @elf1 = pair.elf1
      @elf2 = pair.elf2
    end

    def sections_fully_overlap?
      min1 = elf1.first_section
      min2 = elf2.first_section
      max1 = elf1.last_section
      max2 = elf2.last_section

      (min1 <= min2 && max1 >= max2) || (min2 <= min1 && max2 >= max1)
    end

    def sections_overlap?
      elf1.sections_range.include?(elf2.first_section) || elf2.sections_range.include?(elf1.first_section)
    end

    private

    attr_reader :elf1, :elf2
  end
end
