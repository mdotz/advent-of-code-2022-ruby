#!/usr/bin/env ruby
# frozen_string_literal: true

letter_map = File.open(ARGV[0], "r").inject([]) { |arr, line| arr << line.strip.split("") }
visit_map = Array.new(letter_map.size) { Array.new(letter_map[0].size) { false } }
steps_map = Array.new(letter_map.size) { Array.new(letter_map[0].size) { Float::INFINITY } }
height_map = letter_map.map { |row| row.map { _1.ord } }

start_y = letter_map.find_index { _1.include?("E") }
start_x = letter_map[start_y].index("E")
end_y = letter_map.find_index { _1.include?("S") }
end_x = letter_map[end_y].index("S")
height_map[start_y][start_x] = "z".ord
height_map[end_y][end_x] = "a".ord

steps_map[start_y][start_x] = 0
queue = [[start_x, start_y]]

while queue.size > 0
  x, y = queue.shift
  next if visit_map[y][x]

  step = steps_map[y][x]
  break puts(step) if letter_map[y][x] == "a"

  neighbours = [[x - 1, y], [x + 1, y], [x, y - 1], [x, y + 1]].each do |nx, ny|
    next if nx < 0 || nx >= height_map[0].size || ny < 0 || ny >= height_map.size
    next if height_map[ny][nx] < height_map[y][x] - 1

    steps_map[ny][nx] = step + 1 if steps_map[ny][nx] > step + 1
    queue << [nx, ny]
  end

  visit_map[y][x] = true
end
