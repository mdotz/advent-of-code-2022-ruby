# frozen_string_literal: true

module Day4
  class Runner
    class << self
      def part1(path:)
        call(path) { SectionOverlapChecker.sections_fully_overlap?(_1) }
      end

      def part2(path:)
        call(path) { SectionOverlapChecker.sections_overlap?(_1) }
      end

      private

      def call(path)
        pairs = File.open(path, "r").each_with_object([]) do |line, acc|
          line = Models::Line.new(line.strip)
          acc << Models::Pair.new(Models::Elf.new(line.range1), Models::Elf.new(line.range2))
        end

        puts pairs.select { yield _1 }.count
      end
    end
  end
end
