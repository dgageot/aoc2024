#!/usr/bin/env ruby
# Expected: 6

require "../common"

def in_loop(grid, y, x, dy, dx)
  seen = {}

  loop do
    return true if seen[[y, x, dy, dx]]
    seen[[y, x, dy, dx]] = true
  
    cell = grid[y + dy, x + dx] || return
    if cell != "#"
      y += dy
      x += dx
      next
    end
  
    dx, dy = -dy, dx
  end
end

grid = Grid.new(STDIN.readlines(chomp: true).map(&:chars))
orig_y, orig_x, _ = grid.find { |_, _, c| c == "^" }

y, x = orig_y, orig_x
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

count = 0
seen.each do |(y, x), _|
  grid[y, x] = "#"
  count += 1 if in_loop(grid, orig_y, orig_x, -1, 0)
  grid[y, x] = "."
end
p count