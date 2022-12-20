#!/usr/bin/env ruby
# frozen_string_literal: true

min_x = 0
min_y = 0
max_x = 1000
max_y = 0

rock_lines = File.open(ARGV[0]).map do |line|
  v = line.strip.split("->").map { _1.split(",").map(&:to_i) }
end

rock_lines.each do |line|
  line.each do |x, y|
    max_y = y if y > max_y
  end
end

cave_map = Array.new(max_y - min_y + 1) { Array.new(max_x - min_x + 1) { false } }

rock_lines.each do |line|
  line.each_cons(2) do |(x1, y1), (x2, y2)|
    if x1 == x2
      min = [y1, y2].min
      max = [y1, y2].max

      (min..max).each { cave_map[_1][x1] = true }
    elsif y1 == y2
      min = [x1, x2].min
      max = [x1, x2].max

      (min..max).each { cave_map[y1][_1] = true }
    end
  end
end

def find_bottom(cave_map, x, y = 0, count = 0)
  left = x >= 0 ? cave_map[y][x - 1] : true
  center = cave_map[y][x]
  right = x < cave_map[y].size ? cave_map[y][x + 1] : true

  if !center
    find_bottom(cave_map, x, y + 1, count)
  elsif !left && center
    find_bottom(cave_map, x - 1, y + 1, count)
  elsif left && center && !right
    find_bottom(cave_map, x + 1, y + 1, count)
  elsif left && center && right
    return nil if y == 1

    return cave_map[y - 1][x] = true
  end
end

start_point = [500, 0]
count = 0
cave_map << Array.new(cave_map.last.size) { false }
cave_map << Array.new(cave_map.last.size) { true }

while(1) do
  find_bottom(cave_map, start_point[0], start_point[1]) ? count += 1 : break
end

puts count + 1
