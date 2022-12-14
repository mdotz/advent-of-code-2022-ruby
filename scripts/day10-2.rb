#!/usr/bin/env ruby
# frozen_string_literal: true
require "ostruct"

cycles = []
offset = 0
register = 1

File.open(ARGV[0], "r").each_with_index do |line, index|
  instruction, value = line.split
  register += offset if cycles.last&.end

  case instruction
  when "addx"
    cycles << OpenStruct.new(x: register)
    cycles << OpenStruct.new(x: register, end: true)
    offset = value.to_i
  when "noop"
    cycles << OpenStruct.new(x: register)
  end
end

crt = Array.new(6) { Array.new(40, ".") }

cycles.each_with_index do |cycle, index|
  pixel_pos = (index).divmod(crt.first.size)
  crt[pixel_pos[0]][pixel_pos[1]] = "#" if (cycle.x - 1..cycle.x + 1).include?(pixel_pos[1])
end

puts crt.map(&:join)
