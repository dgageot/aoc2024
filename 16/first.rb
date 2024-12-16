#!/usr/bin/env ruby
# Expected: 2028

require "../common.rb"
require "rb_heap"

grid = Grid.new(STDIN.readlines(chomp: true).map { |line| line.chars })
puts grid

grid[grid.height-2, 1] = "."
grid[1, grid.width-2] = "."

seen = Set.new
pq = Heap.new { |l, r| l[0] < r[0] }
pq << [0, 0, 0, 0, 0, 0]

loop do
    score, r, c, dr, dc = pq.pop

    if [r, c] == [1, grid.width - 2]
        p hl
        return
    end

    next if seen.add?([r, c]).nil?

    @drdc.each do |ddr, ddc|
        next if grid[r + ddr, c + ddc] == "#"

        if dr == ddr && dc == ddc
            pq << [score + 1, r + dr, c + dc, dr, dc]
        elsif dr + ddr + dc + ddc == 0
            pq << [score + 2001, r + dr, c + dc, dr, dc]
        elsif
            pq << [score + 1001, r + dr, c + dc, dr, dc]
        end
    end
end