#!/usr/bin/env ruby
# Expected: 11048

require "../common.rb"
require "rb_heap"

grid = Grid.new(STDIN.readlines(chomp: true).map { |line| line.chars })

seen = Set.new
pq = Heap.new { |l, r| l[0] < r[0] }
pq << [0, grid.height - 2, 1, 0, 1]

loop do
    score, r, c, dr, dc = pq.pop

    if [r, c] == [1, grid.width - 2]
        p score
        return
    end

    next if seen.add?([r, c]).nil?

    @drdc.each do |ddr, ddc|
        next if grid[r + ddr, c + ddc] == "#"

        if dr == ddr && dc == ddc
            pq << [score + 1, r + ddr, c + ddc, ddr, ddc]
        elsif (dr + ddr) != 0 || (dc + ddc) != 0
            pq << [score + 1001, r + ddr, c + ddc, ddr, ddc]
        end
    end
end