#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'
res = 1

File.open(ARGV[0], "r").each do |line|
  line.split("").each_cons(4) do |e|
    if e.uniq.size == 4
      break
    else
      res +=1
    end
  end
end

puts res + 3
