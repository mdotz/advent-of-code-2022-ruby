# frozen_string_literal: true

require_relative "aoc2022ruby/version"

require_relative "aoc2022ruby/day1/input_parser"
require_relative "aoc2022ruby/day1/bag"
require_relative "aoc2022ruby/day1/bags_calculator"
require_relative "aoc2022ruby/day1/runner"

require_relative "aoc2022ruby/day2/round"
require_relative "aoc2022ruby/day2/round_points_calculator"
require_relative "aoc2022ruby/day2/runner"
require_relative "aoc2022ruby/day2/part1/move_mapper"
require_relative "aoc2022ruby/day2/part2/move_mapper"

require_relative "aoc2022ruby/day3/models/rucksack"
require_relative "aoc2022ruby/day3/value_map"
require_relative "aoc2022ruby/day3/string_comparer"
require_relative "aoc2022ruby/day3/models/group"
require_relative "aoc2022ruby/day3/runner"

require_relative "aoc2022ruby/day4/models/pair"
require_relative "aoc2022ruby/day4/models/elf"
require_relative "aoc2022ruby/day4/models/line"
require_relative "aoc2022ruby/day4/runner"
require_relative "aoc2022ruby/day4/section_overlap_checker"

module Aoc2022ruby
  class Error < StandardError; end
  # Your code goes here...
end
