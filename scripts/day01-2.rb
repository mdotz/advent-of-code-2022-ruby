#!/usr/bin/env ruby
# frozen_string_literal: true

lines = []
calories = []

File.open(ARGV[0], "r").each do |line|
  if line.strip.empty?
    calories << lines.map(&:to_i).sum
    lines = []
  else
    lines << line.strip
  end
end

puts calories.max(3).sum
