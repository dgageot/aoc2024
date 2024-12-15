#!/usr/bin/env ruby
# Expected: 12

require "../common.rb"

lines = STDIN.readlines(chomp: true)
map, movements = *lines.slice_on("") 

grid = Grid.new(map.map { |line| line.chars })
puts grid

movements = movements.join.chars
p movements

robot = grid.find { |_, _, v| v == "@" }[0..1]
p robot

@directions = {
    "^" => [-1,  0],
    "v" => [+1,  0],
    "<" => [ 0, -1]
    ">" => [ 0, +1],
}


movements.each do |movement|
    dr, dr = *@directions[movement]
end
