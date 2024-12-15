#!/usr/bin/env ruby
# Expected: 12

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
puts grid

movements = movements.join.chars
p movements

xr, yr = *grid.find { |_, _, v| v == "@" }[0..1]
p yr, xr

movements.each do |movement|
    dr, dr = *@directions[movement]

    next if grid[yr + dr, xr + dc] == "#"
    if grid[yr + dr, xr + dc] == "."
        yr += dr
        xr += dc
    else
       # rock 
    end

end
