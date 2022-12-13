# frozen_string_literal: true

module Puzzle3
  class Runner
    def self.call(path:)
      rucksacks = File.open(path, "r").each_with_object([]) do |line, acc|
        acc << Puzzle3::Rucksack.new(line.strip)
        acc
      end

      result = rucksacks.reduce(0) do |sum, rucksack|
        sum + Puzzle3::CompartmentSearcher.common_item_value(rucksack.first_compartment, rucksack.second_compartment)
      end

      puts result
    end
  end
end
