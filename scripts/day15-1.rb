#!/usr/bin/env ruby
# frozen_string_literal: true
require "set"

line_regex = /.*x=(-?[0-9]+), y=(-?[0-9]+):.*x=(-?[0-9]+), y=(-?[0-9]+)/
target_row_beacons = Set.new
target_y = ARGV[1].to_i
min_x = Float::INFINITY
max_x = -Float::INFINITY

File.open(ARGV[0], "r").each do |line|
  sx, sy, bx, by = line_regex.match(line).captures.map(&:to_i)
  target_row_beacons.add([bx, by]) if by == target_y
  distance = (sx - bx).abs + (sy - by).abs

  next if (sy - distance).abs >= target_y

  diagonal = distance * 2 + 1
  deduction = (sy - target_y).abs * 2
  target_row_coverage = diagonal - deduction
  min = sx - target_row_coverage / 2
  max = sx + target_row_coverage / 2
  min_x = min if min < min_x
  max_x = max if max > max_x
end

puts max_x - min_x + 1 - target_row_beacons.size
