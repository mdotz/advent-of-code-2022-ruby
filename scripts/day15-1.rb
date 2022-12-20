#!/usr/bin/env ruby
# frozen_string_literal: true
require "set"

line_regex = /.*x=(-?[0-9]+), y=(-?[0-9]+):.*x=(-?[0-9]+), y=(-?[0-9]+)/
goal_row_beacons = Set.new
goal_y = ARGV[1].to_i

sensor_coverage = File.open(ARGV[0], "r").each_with_object([]) do |line, arr|
  sx, sy, bx, by = line_regex.match(line).captures.map(&:to_i)
  goal_row_beacons.add([bx, by]) if by == goal_y
  distance = (sx - bx).abs + (sy - by).abs

  next if (sy - distance).abs >= goal_y

  max_coverage = distance * 2 + 1
  deduction = (sy - goal_y).abs * 2
  goal_row_coverage = max_coverage - deduction
  arr << [*(sx - goal_row_coverage / 2)..(sx + goal_row_coverage / 2)]
end

puts sensor_coverage.reduce(:+).uniq.size - goal_row_beacons.size
