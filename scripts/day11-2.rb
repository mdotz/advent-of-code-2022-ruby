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

divisibilities = monkeys.map { _1.test_value }
monkeys.each { |m| m.items.map! { |i| divisibilities.map { [_1, i % _1] }.to_h } }

10_000.times do
  monkeys.each do |monkey|
    monkey.items.each do |item|
      if monkey.operation_value == "old"
        item = item.map { |d,v| [d, v**2 % d] }.to_h
      else
        item = item.map { |d,v| [d, v.send(monkey.operator.to_sym, monkey.operation_value.to_i) % d] }.to_h
      end

      item[monkey.test_value] == 0 ? monkeys[monkey.res_true].items << item : monkeys[monkey.res_false].items << item

      monkey.items_inspected += 1
    end
    monkey.items = []
  end
end

puts monkeys.map(&:items_inspected).max(2).reduce(&:*)
