# frozen_string_literal: true

module Puzzle1
  class InputParser
    def parse(path:)
      File.open(path, "r").each do |line|
        if empty_line?(line)
          yield(consecutive_lines) unless consecutive_lines.empty?

          reset_consecutive_lines
        else
          accumulate_consecutive_line(line)
        end
      end

      yield(consecutive_lines) unless consecutive_lines.empty?
    end

    private

    def empty_line?(line)
      line.strip.empty?
    end

    def consecutive_lines
      @consecutive_lines ||= []
    end

    def reset_consecutive_lines
      @consecutive_lines = []
    end

    def accumulate_consecutive_line(line)
      consecutive_lines << line.strip.to_i
    end
  end
end
