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

str = []
(20..220).step(40) { str << cycles[_1 - 1].x * _1 }
puts str.sum
