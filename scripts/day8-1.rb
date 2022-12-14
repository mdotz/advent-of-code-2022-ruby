#!/usr/bin/env ruby
# frozen_string_literal: true

trees = []

File.open(ARGV[0], "r").each_with_index do |line, i|
  trees << line.strip.split("").map(&:to_i)
end

maxes_x = []
maxes_y = []
visibility = Array.new(trees.size) { Array.new(trees.first.size) { false } }

trees.each_with_index do |y, i|
  y.each_with_index do |x, j|

    if j == trees.first.size - 1
      visibility[i][j] = true
      trees[i].each_with_index do |elem, index|
        if trees[i][index+1..].all? { _1 < elem } && elem > x
          visibility[i][index] = true
        end
      end
    elsif i == trees.size - 1
      visibility[i][j] = true
      pv_vert = (0..i).map { trees[_1][j] }
      pv_vert.each_with_index do |elem, index|
        if pv_vert[index+1..].all? { _1 < elem } && elem > x
          visibility[index][j] = true
        end
      end
    elsif maxes_x[i].nil? || maxes_y[j].nil? || maxes_x[i] < x || maxes_y[j] < x
      visibility[i][j] = true
    end

    maxes_x[i] = x if maxes_x[i].nil? || x > maxes_x[i]
    maxes_y[j] = x if maxes_y[j].nil? || x > maxes_y[j]
  end
end

puts visibility.map { |a| a.select { _1 }.size }.sum
