#!/usr/bin/env ruby
# frozen_string_literal: true

res = 0

File.open(ARGV[0], "r").each do |line|
  r1, r2 = line.strip.split(",")
  r1 = (r1.split("-").first.to_i..r1.split("-").last.to_i)
  r2 = (r2.split("-").first.to_i..r2.split("-").last.to_i)

  res += 1 if (r1.first <= r2.first && r1.last >= r2.last) || (r2.first <= r1.first && r2.last >= r1.last)
end

puts res
