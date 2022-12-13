# frozen_string_literal: true

module Puzzle3
  class Rucksack
    def initialize(contents)
      @contents = contents
    end

    def first_compartment
      @first_compartment ||= contents[0..half_content_size - 1]
    end

    def second_compartment
      @second_compartment ||= contents[half_content_size..]
    end

    private

    attr_reader :contents

    def half_content_size
      contents.size / 2
    end
  end
end
