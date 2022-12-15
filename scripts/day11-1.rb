#!/usr/bin/env ruby
# frozen_string_literal: true
require "ostruct"

buf = []
monkeys = []

File.open(ARGV[0], "r").each do |line|
  if /If false/.match?(line)
    num = /Monkey (\d+)/.match(buf[0]).captures.first.to_i
    items = /Starting items:((:? \d+,?)+)/.match(buf[1]).captures.first.split(",").map(&:to_i)
    operator, value = /Operation: new = old (.) (.*)/.match(buf[2]).captures
    test = /Test: divisible by (\d+)/.match(buf[3]).captures.first.to_i
    res_true = /If true: throw to monkey (\d+)/.match(buf[4]).captures.first.to_i
    res_false = /If false: throw to monkey (\d+)/.match(line).captures.first.to_i
    buf = []

    monkeys << OpenStruct.new(items: items, operator: operator, operation_value: value,
                              test_value: test, res_true: res_true, res_false: res_false, items_inspected: 0)
  else
    buf << line unless line.strip.empty?
  end
end

20.times do
  monkeys.each do |monkey|
    monkey.items.each do |item|
      monkey.operation_value == "old" ? value = item : value = monkey.operation_value.to_i
      item = item.send(monkey.operator.to_sym, value.to_i) / 3

      if item % monkey.test_value == 0
        monkeys[monkey.res_true].items << item
      else
        monkeys[monkey.res_false].items << item
      end

      monkey.items = []
      monkey.items_inspected += 1
    end
  end
end

puts monkeys.map(&:items_inspected).max(2).reduce(&:*)
