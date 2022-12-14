#!/usr/bin/env ruby
# frozen_string_literal: true

res = 0
values = [[*'a'..'z'], [*'A'..'Z']].flatten.each_with_index.map { |e, i| [e, i + 1] }.to_h

File.open(ARGV[0], "r").each_slice(3) do |lines|
  item = lines.map { _1.strip.split("").uniq }.reduce(:&).first
  res += values[item]
end

puts res
