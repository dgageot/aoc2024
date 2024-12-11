#!/usr/bin/env ruby
# Expected: 1930

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

input = STDIN.readlines(chomp: true)

garden = Grid.new(input.map(&:chars))
types = garden.map { |_, _, v| v }.to_set

sum = 0
types.each do |type|
  find_zones(garden, type).each do |zone|
    sum += zone.length * zone.sum { |r, c| @drdc.count { |dr, dc| garden[r + dr, c + dc] != type } }
  end
end
p sum