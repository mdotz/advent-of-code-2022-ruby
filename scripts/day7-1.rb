#!/usr/bin/env ruby
# frozen_string_literal: true

tree = {}
current_path = []
pointer = tree

File.open(ARGV[0], "r").each do |line|
  if /\$ cd \.\./.match?(line)
    current_path.pop
    pointer = tree.dig(*current_path)
  elsif /\$ cd .*/.match?(line)
    name = /\$ cd (.*)/.match(line).captures.first
    pointer[name] = { type: :dir, size: 0 }
    current_path << name
    pointer = pointer[name]
  elsif /^dir/.match?(line)
    name = /^dir (.*)/.match(line).captures.first
    pointer[name] = { type: :dir, size: 0 }
  elsif /^[0-9]+/.match?(line)
    size, name = /([0-9]+) (.*)/.match(line).captures
    pointer[name] = { type: :file, size: size.to_i }
    current_path.each_index { |i| tree.dig(*current_path.take(i+1))[:size] += size.to_i }
  end
end

def count_size(t, sum = 0)
  sum += t.select { |k,v| v.is_a?(Hash) && v[:type] == :dir }.map { |k,v| count_size(v,sum) }.sum
  t[:size] <= 100_000 ? sum += t[:size] : sum
end

puts count_size(tree.first[1])
