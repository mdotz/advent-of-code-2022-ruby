# frozen_string_literal: true

module Puzzle4
  class SectionOverlapChecker

    def self.sections_fully_overlap?(pair)
      min1 = pair.elf1.first_section
      min2 = pair.elf2.first_section
      max1 = pair.elf1.last_section
      max2 = pair.elf2.last_section

      (min1 <= min2 && max1 >= max2) || (min2 <= min1 && max2 >= max1)
    end
  end
end
