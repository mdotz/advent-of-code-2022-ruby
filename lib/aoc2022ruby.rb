# frozen_string_literal: true

require_relative "aoc2022ruby/version"

require_relative "aoc2022ruby/puzzle1/input_parser"
require_relative "aoc2022ruby/puzzle1/bag"
require_relative "aoc2022ruby/puzzle1/bags_calculator"
require_relative "aoc2022ruby/puzzle1/runner"

require_relative "aoc2022ruby/puzzle2/round"
require_relative "aoc2022ruby/puzzle2/round_points_calculator"
require_relative "aoc2022ruby/puzzle2/runner"
require_relative "aoc2022ruby/puzzle2/part1/move_mapper"
require_relative "aoc2022ruby/puzzle2/part2/move_mapper"

require_relative "aoc2022ruby/puzzle3/rucksack"
require_relative "aoc2022ruby/puzzle3/value_map"
require_relative "aoc2022ruby/puzzle3/compartment_searcher"
require_relative "aoc2022ruby/puzzle3/runner"

module Aoc2022ruby
  class Error < StandardError; end
  # Your code goes here...
end
