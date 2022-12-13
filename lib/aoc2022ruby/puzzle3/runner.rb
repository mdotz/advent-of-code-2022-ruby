# frozen_string_literal: true

module Puzzle3
  class Runner
    class << self
      def part1(path:)
        rucksacks = File.open(path, "r").each_with_object([]) do |line, acc|
          acc << Models::Rucksack.new(line.strip)
          acc
        end

        result = rucksacks.reduce(0) do |sum, rucksack|
          sum + StringComparer.common_item_value(rucksack.compartments)
        end

        puts result
      end

      def part2(path:)
        groups = File.open(path, "r").each_slice(3).each_with_object([]) do |lines, acc|
          rucksacks = lines.map { Models::Rucksack.new(_1.strip) }
          acc << Models::Group.new(rucksacks)
          acc
        end

        result = groups.reduce(0) do |sum, group|
          sum + StringComparer.common_item_value(group.contents)
        end

        puts result
      end
    end
  end
end
