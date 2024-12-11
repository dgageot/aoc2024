#!/usr/bin/env ruby
# Expected: 1206

require "../common.rb"

def fill(grid, seen, zone_id, r, c, type)
  return if grid[r, c] != type
  return if seen[[r, c]]

  seen[[r, c]] = zone_id
  @drdc.each { |dr, dc| fill(grid, seen, zone_id, r + dr, c + dc, type) }
end

def find_zones(grid, type)
  id = -1
  seen = {}
  grid.each do |r, c, v|
    next if v != type
    next if seen[[r, c]]

    id = seen[[r, c]] || seen[[r - 1, c]] || seen[[r + 1, c]] || seen[[r, c - 1]] || seen[[r, c + 1]] || id + 1
    fill(grid, seen, id, r, c, type)
  end

  seen.group_by { |_, v| v }.values.map { |v| v.map(&:first) }
end

def sides(zone)
  edges = {}
  zone.each do |r, c|
    @drdc.each do |dr, dc|
      nr = r + dr
      nc = c + dc
      next if zone.include?([nr, nc])

      er = (r + nr) / 2.0
      ec = (c + nc) / 2.0
      edges[[er, ec]] = [er - r, ec - c]
    end
  end

  seen = {}
  count = 0
  edges.each do |edge, direction|
    next if seen[edge]
    
    seen[edge] = true
    count += 1
    er, ec = edge

    if er % 1 == 0
      drdc = [[-1, 0], [1, 0]]
    else
      drdc = [[0, -1], [0, 1]]
    end

    drdc.each do |dr, dc|
      (1..).each do |i|
        next_edge = [er + i * dr, ec + i * dc]
        break if edges[next_edge] != direction
        seen[next_edge] = true
      end
    end
  end

  count
end

input = STDIN.readlines(chomp: true)

garden = Grid.new(input.map(&:chars))
types = Set.new(garden.map { |_, _, v| v })

p types.sum { |type| find_zones(garden, type).sum { |zone| sides(zone) * zone.length } }
