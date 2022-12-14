#!/usr/bin/env ruby
# frozen_string_literal: true

res = 0
File.open(ARGV[0], "r").each do |line|
  p1 = line.strip.split("").first
  p2 = line.strip.split("").last

  case p2
  when "X"
    res += 0
  when "Y"
    res += 3
  when "Z"
    res += 6
  end

  res += {
    A: { X: 3, Y: 1, Z: 2 },
    B: { X: 1, Y: 2, Z: 3 },
    C: { X: 2, Y: 3, Z: 1 },
  }[p1.to_sym][p2.to_sym]
end

puts res
