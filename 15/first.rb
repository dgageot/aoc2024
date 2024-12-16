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
# puts grid

movements = movements.join.chars
# p movements

br, bc = *grid.find { |_, _, v| v == "@" }[0..1]
# p br, bc

# puts "Initial state:" + grid.to_s

movements.each do |movement|
    dr, dc = *@directions[movement]
    # puts "br=#{br + dr}, bc=#{bc + dc} grid=#{grid[br + dr, br + dc]}}"
    if grid[br + dr, bc + dc] != "#"
        if grid[br + dr, bc + dc] == "."
            grid[br, bc] = "."
            br += dr
            bc += dc
        else
            count = 1
            loop do
                # puts "br=#{br + dr * count}, bc=#{bc + dc * count}"
                break if grid[br + dr * count, bc + dc * count] != "O"
                count += 1
            end

            # puts "count=#{count}"

            next if grid[br + dr * count, bc + dc * count] == "#"

            grid[br, bc] = "."
            grid[br + dr * count, bc + dc * count] = "O"
            br += dr
            bc += dc
        end
    end

    grid[br, bc] = "@"

    # puts
    # puts "Move #{movement}" + grid.to_s
end

sum = 0
grid.each do |r, c, v|
    next if grid[r, c] != "O"
    sum += 100 * r + c
end
p sum