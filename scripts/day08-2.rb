#!/usr/bin/env ruby
# frozen_string_literal: true

trees = []

File.open(ARGV[0], "r").each_with_index do |line, i|
  trees << line.strip.split("").map(&:to_i)
end

scenic_scores = Array.new(trees.size) { Array.new(trees.first.size) { 0 } }

trees.each_with_index do |y, i|
  y.each_with_index do |x, j|
    next if i == 0 || j == 0 || i == trees.size - 1 || j == y.size - 1

    l,r,u,d = [0,0,0,0]

    y[0..j - 1].reverse.each { |t| l += 1; break if t >= x } # left
    y[j + 1..].each { |t| r += 1; break if t >= x } # right
    [*0..i - 1].reverse.each { |index| u += 1; break if trees[index][j] >= x } # up
    (i + 1..trees.size - 1).each { |index| d += 1 ; break if trees[index][j] >= x } # down

    scenic_scores[i][j] = [l,r,u,d].reduce(:*)
  end
end

puts scenic_scores.map(&:max).max
