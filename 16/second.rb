#!/usr/bin/env ruby
# Expected: 11048

require "../common.rb"
require "rb_heap"

grid = Grid.new(STDIN.readlines(chomp: true).map { |line| line.chars })

seen = Set.new
pq = Heap.new { |l, r| l[0] < r[0] }
pq << [0, grid.height - 2, 1, 0, 1, []]
min_score = Float::INFINITY

loop do
    score, r, c, dr, dc, path = pq.pop
    next if seen.add?([r, c]).nil?

    if [r, c] == [1, grid.width - 2]
        if score <= min_score
            min_score = score
            p score
        else
        end
        return
    end

    @drdc.each do |ddr, ddc|
        next if grid[r + ddr, c + ddc] == "#"

        if dr == ddr && dc == ddc
            pq << [score + 1, r + ddr, c + ddc, ddr, ddc, path + [[r, c]]]
        elsif (dr + ddr) != 0 || (dc + ddc) != 0
            pq << [score + 1001, r + ddr, c + ddc, ddr, ddc, path + [[r, c]]]
        end
    end
end