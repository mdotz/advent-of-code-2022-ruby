#!/usr/bin/env ruby
# frozen_string_literal: true

res = 0
values = [[*'a'..'z'], [*'A'..'Z']].flatten.each_with_index.map { |e, i| [e, i + 1] }.to_h

File.open(ARGV[0], "r").each do |line|
  half1 = line.strip[0..line.strip.size/2-1]
  half2 = line.strip[line.strip.size/2..]

  item = (half1.split("").uniq & half2.split("").uniq).first
  res += values[item]
end

puts res
