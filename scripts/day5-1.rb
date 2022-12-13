#!/usr/bin/env ruby
# frozen_string_literal: true
require'pry'
arr = Array.new(9) { [] }

File.open(ARGV[0], "r").each_with_index do |line, i|
  if i < 8
    line.split("").each_slice(4).each_with_index { |slice, j| arr[j] << slice[1] unless slice[1].strip.empty? }
  elsif i > 9
    c, f, t = /move ([0-9]+) from ([0-9]+) to ([0-9]+)/.match(line).captures
    arr[t.to_i - 1].unshift(*arr[f.to_i - 1].shift(c.to_i).reverse)
  end
end

puts arr.map(&:first).join
