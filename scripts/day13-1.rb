#!/usr/bin/env ruby
# frozen_string_literal: true

packets = File.open(ARGV[0]).readlines(chomp: true).reject(&:empty?).map { eval _1 }

def right_order?(i1, i2)
  if i1.is_a?(Array) && i2.is_a?(Array)
    [i1.size, i2.size].max.times do |index|
      res = right_order?(i1[index], i2[index])
      return res unless res.nil?
    end
    return
  elsif i1.is_a?(Integer) && i2.is_a?(Array)
    right_order?([i1], i2)
  elsif i1.is_a?(Array) && i2.is_a?(Integer)
    right_order?(i1, [i2])
  else
    # Array conditions
    return true if i1.nil?
    return false if i2.nil?

    # Integer conditions
    return true if i1 < i2
    return nil if i1 == i2

    false
  end
end

indexes = []
packets.each_slice(2).each_with_index do |(p1, p2), i|
  indexes << i + 1 if right_order?(p1, p2)
end

puts "right order for indexes: #{indexes}"
puts "sum: #{indexes.sum}"
