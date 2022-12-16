#!/usr/bin/env ruby
# frozen_string_literal: true

def compare_packets(i1, i2)
  if i1.is_a?(Array) && i2.is_a?(Array)
    [i1.size, i2.size].max.times do |index|
      res = compare_packets(i1[index], i2[index])
      return res unless res.nil?
    end
    return
  elsif i1.is_a?(Integer) && i2.is_a?(Array)
    compare_packets([i1], i2)
  elsif i1.is_a?(Array) && i2.is_a?(Integer)
    compare_packets(i1, [i2])
  else
    # Array conditions
    return 1 if i1.nil?
    return -1 if i2.nil?

    # Integer conditions
    return 1 if i1 < i2
    return nil if i1 == i2

    -1
  end
end

packets = File.open(ARGV[0]).readlines(chomp: true).reject(&:empty?).map { eval _1 }.push(*[[[2]], [[6]]])

sorted_packets = packets.sort { |p1, p2| compare_packets(p1,p2) }.reverse
puts (sorted_packets.index([[2]]) + 1) * (sorted_packets.index([[6]]) + 1)
