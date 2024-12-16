#!/usr/bin/env ruby
# Expected: 11048

require "../common.rb"
require "rb_heap"

grid = Grid.new(STDIN.readlines(chomp: true).map { |line| line.chars })
# puts grid

grid[grid.height-2, 1] = "."
grid[1, grid.width-2] = "."

seen = Set.new
pq = Heap.new { |l, r| l[0] < r[0] }
pq << [0, grid.height - 2, 1, 0, 1]

loop do
    score, r, c, dr, dc = pq.pop
    # p "r #{r} c #{c} dr #{dr} dc #{dc} pq #{pq.size} score #{score}"

    if [r, c] == [1, grid.width - 2]
        p score
        return
    end

    next if seen.add?([r, c]).nil?

    @drdc.each do |ddr, ddc|
        next if grid[r + ddr, c + ddc] == "#"

        if dr == ddr && dc == ddc
            # Same direction
            pq << [score + 1, r + ddr, c + ddc, ddr, ddc]
        elsif (dr + ddr) == 0 && (dc + ddc) == 0
        else
            # Left or right
            pq << [score + 1001, r + ddr, c + ddc, ddr, ddc]
        end
    end
end