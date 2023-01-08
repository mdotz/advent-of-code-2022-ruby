#!/usr/bin/env ruby
# frozen_string_literal: true
require 'set'

def segments_intersection(a, b, c, d)
  abc = ((d.x - c.x) * (a.y - c.y)) - ((d.y - c.y) * (a.x - c.x))
  abd = ((d.y - c.y) * (b.x - a.x)) - ((d.x - c.x) * (b.y - a.y))

  return nil if abd.zero?

  t = abc.fdiv(abd)
  ba = Point.new((b.x - a.x) * t, (b.y - a.y) * t)

  Point.new(a.x + ba.x, a.y + ba.y)
end

def point_inside_square?(square, m)
  a = square.a
  b = square.b
  d = square.d
  am = Point.new(m.x - a.x, m.y - a.y)
  ab = Point.new(b.x - a.x, b.y - a.y)
  ad = Point.new(d.x - a.x, d.y - a.y)
  abab = (ab.x * ab.x) + (ab.y * ab.y)
  adad = (ad.x * ad.x) + (ad.y * ad.y)
  amab = (am.x * ab.x) + (am.y * ab.y)
  amad = (am.x * ad.x) + (am.y * ad.y)

  (0 < amab && amab < abab) && (0 < amad && amad < adad)
end

line_regex = /.*x=(-?[0-9]+), y=(-?[0-9]+):.*x=(-?[0-9]+), y=(-?[0-9]+)/
left_slope_lines = []
right_slope_lines = []
squares = []
Point = Struct.new(:x, :y)
Segment = Struct.new(:point1, :point2)
Square = Struct.new(:a, :b, :c, :d)

File.open(ARGV[0], "r").each do |line|
  sx, sy, bx, by = line_regex.match(line).captures.map(&:to_i)
  distance = (sx - bx).abs + (sy - by).abs

  top = Point.new(sx, sy + distance)
  bottom = Point.new(sx, sy - distance)
  right = Point.new(sx + distance, sy)
  left = Point.new(sx - distance, sy)

  right_slope_lines += [Segment.new(left, bottom), Segment.new(top, right)]
  left_slope_lines += [Segment.new(top, left), Segment.new(right, bottom)]
  squares << Square.new(left, top, right, bottom)
end

intersections = right_slope_lines.each_with_object(Set.new) do |r_line, set|
  left_slope_lines.each do |l_line|
    intersection_point = segments_intersection(r_line.point1, r_line.point2, l_line.point1, l_line.point2)
    points = [r_line.point1, r_line.point2, l_line.point1, l_line.point2]
    set.add(intersection_point) if intersection_point
  end
end

intersections.each_with_object([]) do |point, arr|
  if intersections.include?(Point.new(point.x + 1, point.y + 1)) &&
      intersections.include?(Point.new(point.x + 2, point.y)) &&
      intersections.include?(Point.new(point.x + 1, point.y - 1))
    potential_target = Point.new(point.x + 1, point.y)

    if squares.none? { point_inside_square?(_1, potential_target) } &&
        potential_target.x >= 0 && potential_target.x <= 4_000_000 &&
        potential_target.y >= 0 && potential_target.y <= 4_000_000
      puts (potential_target.x * 4_000_000 + potential_target.y).to_i
      return
    end
  end
end
