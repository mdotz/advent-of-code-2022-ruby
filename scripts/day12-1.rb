#!/usr/bin/env ruby
# frozen_string_literal: true

Node = Struct.new(:x, :y, :height, :distance, :via, :visited, keyword_init: true)

height_map = File.open(ARGV[0], "r").inject([]) { |arr, line| arr << line.strip.split("") }
nodes = []

height_map.each_with_index do |row, y|
  row.each_with_index do |e, x|
    nodes << Node.new(x: x, y: y, height: e.ord, distance: Float::INFINITY, via: nil, visited: false)
  end
end

start_node = nodes.find { _1.height == "S".ord }
start_node.distance = 0
start_node.height = "a".ord

end_node = nodes.find { _1.height == "E".ord  }
end_node.height = "z".ord

nodes_to_visit = [start_node]

# slow as hecc
while nodes_to_visit.size > 0
  node = nodes_to_visit[0]
  nodes_to_visit.delete(node)

  neighbours = [
    nodes.find { _1.x == node.x - 1 && _1.y == node.y },
    nodes.find { _1.x == node.x + 1 && _1.y == node.y },
    nodes.find { _1.x == node.x && _1.y == node.y - 1 },
    nodes.find { _1.x == node.x && _1.y == node.y + 1 }
  ].compact.select { _1.height - 1 <= node.height && _1 != node.via }

  neighbours.each do |neighbour|
    if neighbour.distance > node.distance + 1
      neighbour.distance = node.distance + 1
      neighbour.via = node
    end
    nodes_to_visit << neighbour unless neighbour.visited
  end

  node.visited = true
end

puts end_node.distance
