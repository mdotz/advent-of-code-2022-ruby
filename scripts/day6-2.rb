#!/usr/bin/env ruby
# frozen_string_literal: true

res = 1

File.open(ARGV[0], "r").each do |line|
  line.split("").each_cons(14) do |e|
    if e.uniq.size == 14
      break
    else
      res +=1
    end
  end
end

puts res + 13
