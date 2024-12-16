#!/usr/bin/env ruby
# Expected: 9021

require "../common.rb"

@directions = {
    "^" => [-1,  0],
    "v" => [+1,  0],
    "<" => [ 0, -1],
    ">" => [ 0, +1],
}
@wider = {
    "." => "..",
    "O" => "[]",
    "#" => "##",
    "@" => "@.",
}

lines = STDIN.readlines(chomp: true)
map, movements = *lines.slice_on("") 

grid = Grid.new(map.map { |line| line.chars.map { |c| @wider[c] }.join.chars })
puts grid
# return

movements = movements.join.chars

br, bc = *grid.find { |_, _, v| v == "@" }[0..1]

movements.each do |movement|
    dr, dc = *@directions[movement]
    next if grid[br + dr, bc + dc] == "#"

    if grid[br + dr, bc + dc] == "[" || grid[br + dr, bc + dc] == "]"
        count = 1
        loop do
            break if grid[br + dr * count, bc + dc * count] != "[" && grid[br + dr * count, bc + dc * count] != "]"
            count += 1
        end
        next if grid[br + dr * count, bc + dc * count] == "#"

        (1..count).to_a.reverse.each do |i|
            grid[br + dr * i, bc + dc * i] = grid[br + dr * (i - 1), bc + dc * (i - 1)]
        end
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
