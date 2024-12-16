#!/usr/bin/env ruby
# Expected: 2028

require "../common.rb"

@directions = {
    "^" => [-1,  0],
    "v" => [+1,  0],
    "<" => [ 0, -1],
    ">" => [ 0, +1],
}

lines = STDIN.readlines(chomp: true)
map, movements = *lines.slice_on("") 

grid = Grid.new(map.map { |line| line.chars })

movements = movements.join.chars

br, bc = *grid.find { |_, _, v| v == "@" }[0..1]

movements.each do |movement|
    dr, dc = *@directions[movement]
    next if grid[br + dr, bc + dc] == "#"

    if grid[br + dr, bc + dc] == "O"
        count = 1
        loop do
            break if grid[br + dr * count, bc + dc * count] != "O"
            count += 1
        end
        next if grid[br + dr * count, bc + dc * count] == "#"

        grid[br + dr * count, bc + dc * count] = "O"
    end

    grid[br, bc] = "."
    br += dr
    bc += dc
    grid[br, bc] = "@"
end

sum = 0
grid.each do |r, c, v|
    next if grid[r, c] != "O"
    sum += 100 * r + c
end
p sum
# 1568399
