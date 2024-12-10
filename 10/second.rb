#!/usr/bin/env ruby
# Expected: 81

require "../common.rb"

@grid = Grid.new(STDIN.readlines(chomp: true).map { |line| line.chars.map(&:to_i) })

def paths(r, c, l)
  return [] if @grid[r, c] != l
  return [[r, c]] if @grid[r, c] == 9

  [[0, -1], [0, 1], [-1, 0], [1, 0]].flat_map { |dr, dc| paths(r + dr, c + dc, l + 1) }
end

  
sum = 0
@grid.select { |_, _, v| v == 0 }.each do |r, c|
  seen = paths(r, c, 0)
  sum += seen.count
end
p sum



