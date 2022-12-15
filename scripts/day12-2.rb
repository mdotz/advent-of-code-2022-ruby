# frozen_string_literal: true

Node = Struct.new(:x, :y, :height, :distance, :source, :visited, keyword_init: true)

height_map = File.open(ARGV[0], "r").inject([]) { |arr, line| arr << line.strip.split("") }
nodes = []

height_map.each_with_index do |row, y|
  row.each_with_index do |e, x|
    nodes << Node.new(x: x, y: y, height: e.ord, distance: Float::INFINITY, source: nil, visited: false)
  end
end

def reset_nodes(nodes)
  nodes.each do |n|
    n.distance = Float::INFINITY
    n.source = nil
    n.visited = false
  end
end

nodes.find { _1.height == "S".ord }.height = "a".ord
start_nodes = nodes.select { ["S".ord, "a".ord].include?(_1.height) }
start_nodes[0].height = "a".ord

puts "#{start_nodes.count} start nodes"
res = []

end_node = nodes.find { _1.height == "E".ord  }
end_node.height = "z".ord

start_nodes.each_with_index do |start_node, index|
  start_node.distance = 0
  nodes_to_visit = [start_node]

  # slow as hecc, 16 minutes for 2026 start points
  while nodes_to_visit.size > 0
    node = nodes_to_visit.min { _1.distance <=> _2.distance }
    nodes_to_visit.delete(node)

    neighbours = [
      nodes.find { _1.x == node.x - 1 && _1.y == node.y },
      nodes.find { _1.x == node.x + 1 && _1.y == node.y },
      nodes.find { _1.x == node.x && _1.y == node.y - 1 },
      nodes.find { _1.x == node.x && _1.y == node.y + 1 }
    ].compact.select { _1.height - 1 <= node.height && _1 != node.source }

    neighbours.each do |neighbour|
      if neighbour.distance > node.distance + 1
        neighbour.distance = node.distance + 1
        neighbour.source = node
      end
      nodes_to_visit << neighbour unless neighbour.visited
    end

    node.visited = true
  end

  res << end_node.distance
  reset_nodes(nodes)
  puts "processed start node #{index + 1}/#{start_nodes.size}"
end

puts res.min
