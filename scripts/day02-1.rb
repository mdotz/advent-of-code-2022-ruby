#!/usr/bin/env ruby
# frozen_string_literal: true

res = 0
File.open(ARGV[0], "r").each do |line|
  p1 = line.strip.split("").first
  p2 = line.strip.split("").last

  case p2
  when "X"
    res += 1
  when "Y"
    res += 2
  when "Z"
    res += 3
  end

  res += {
    A: { X: 3, Y: 6, Z: 0 },
    B: { X: 0, Y: 3, Z: 6 },
    C: { X: 6, Y: 0, Z: 3 },
  }[p1.to_sym][p2.to_sym]
end

puts res
