# frozen_string_literal: true

module Puzzle4
  class Runner
    def self.call(path:)
      pairs = File.open(path, "r").each_with_object([]) do |line, acc|
        line = Models::Line.new(line.strip)
        acc << Models::Pair.new(Models::Elf.new(line.range1), Models::Elf.new(line.range2))
      end

      puts pairs.select { SectionOverlapChecker.sections_fully_overlap?(_1) }.count
    end
  end
end
