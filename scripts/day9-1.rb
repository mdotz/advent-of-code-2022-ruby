#!/usr/bin/env ruby
# frozen_string_literal: true

require "set"
require "ostruct"

visited = Set.new
h, t = [OpenStruct.new(x: 0, y: 0), OpenStruct.new(x: 0, y: 0)]

def touching?(p1, p2)
  (p1.x - p2.x).abs <= 1 && (p1.y - p2.y).abs <= 1
end

def dir(p1, p2)
  x_diff = (p1.x - p2.x)
  y_diff = (p1.y - p2.y)

  OpenStruct.new(
    x: x_diff > 0 ? 1 : (x_diff == 0 ? 0 : -1),
    y: y_diff > 0 ? 1 : (y_diff == 0 ? 0 : -1),
  )
end

def move(p, dir)
  p.x += dir.x
  p.y += dir.y
end


File.open(ARGV[0], "r").each_with_index do |line, i|
  dir, count = /([LRUD]) ([0-9]+)/.match(line).captures

  count.to_i.times do
    case dir
    when "L"
      h.x -= 1
    when "R"
      h.x += 1
    when "U"
      h.y += 1
    when "D"
      h.y -= 1
    end
    move(t, dir(h, t)) unless touching?(h, t)

    visited << [t.x, t.y]
  end
end

puts visited.size
