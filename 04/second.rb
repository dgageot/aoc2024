#!/usr/bin/env ruby
# Expected: 9

require "../common.rb"

grid = Grid.new(STDIN.readlines(chomp: true))

count = 0

(1...grid.height-1).each do |r|
  (1...grid.width-1).each do |c|
    next if grid[r, c] != "A"
    corners = grid[r - 1, c - 1] + grid[r - 1, c + 1] + grid[r + 1, c + 1] + grid[r + 1, c - 1]
    next if ["MMSS", "MSSM", "SSMM", "SMMS"].exclude?(corners)

    count += 1
  end
end

p count
