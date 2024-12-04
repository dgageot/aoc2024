#!/usr/bin/env ruby
# Expected: 18

require "../common.rb"

grid = Grid.new(STDIN.readlines(chomp: true))

count = 0

grid.height.times do |r|
  grid.width.times do |c|
    next if grid[r, c] != "X"

    [-1, 0, 1].each do |dr|
      [-1, 0, 1].each do |dc|
        next if dr == 0 && dc == 0

        next if grid[r + 1 * dr, c + 1 * dc] != "M"
        next if grid[r + 2 * dr, c + 2 * dc] != "A"
        next if grid[r + 3 * dr, c + 3 * dc] != "S"

        count += 1
      end
    end
  end
end

p count
