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

total_free = 70_000_000 - tree.first[1][:size]
@space_needed = 30_000_000 - total_free

def find_dirs_to_delete(t, del_candidates = [])
  del_candidates << t[:size] if t.is_a?(Hash) && t[:type] == :dir && t[:size] >= @space_needed
  t.select { |k,v| v.is_a?(Hash) && v[:type] == :dir }.map { |k,v| find_dirs_to_delete(v,del_candidates) }
  del_candidates
end

puts find_dirs_to_delete(tree.first[1]).min
