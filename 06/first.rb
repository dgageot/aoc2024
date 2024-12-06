#!/usr/bin/env ruby
# Expected: 41

require "../common"

grid = Grid.new(STDIN.readlines(chomp: true).map(&:chars))

y, x, _ = grid.find { |_, _, c| c == "^" }
dy, dx = [-1, 0]
seen = {}

loop do
  seen[[y, x]] = true

  cell = grid[y + dy, x + dx] || break
  if cell != "#"
    y += dy
    x += dx
    next
  end

  dx, dy = -dy, dx
end

p seen.size