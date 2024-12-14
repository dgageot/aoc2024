#!/usr/bin/env ruby
# Expected: 12

require "../common.rb"

Robot = Struct.new(:x, :y, :vx, :vy)

robots = STDIN.readlines(chomp: true).map do |line|
  Robot.new(*line.scanf("p=%d,%d v=%d,%d"))
end

height, width = robots.count == 12 ? [7, 11] : [103, 101]

robots.each do |r|
  r.x = (r.x + r.vx * 100) % width
  r.y = (r.y + r.vy * 100) % height
end

g = robots.group_by { |r| [r.x <=> width / 2, r.y <=> height / 2 ] }
p [[-1, -1], [-1, 1], [1, 1], [1, -1]].map { |d| g[d].count }.reduce(:*)