#!/usr/bin/env ruby
# Expected: 34

require '../common'

grid = Grid.new(STDIN.readlines(chomp: true).map(&:chars))

antennas = grid.map { |r, c, v| [r, c, v] if v != '.' }.compact

antinodes = Set.new
antennas.combination(2).select { |l, r| l[2] == r[2] }.each do |l, r|
  r1, c1 = l
  r2, c2 = r

  dr = r2 - r1
  dc = c2 - c1

  50.times.each do |i|
    antinodes << [r1 - dr * i, c1 - dc * i]
    antinodes << [r2 + dr * i, c2 + dc * i]
  end
end
p antinodes.filter { |r, c| r >=0 && c >= 0 && r < grid.height && c < grid.width }.size