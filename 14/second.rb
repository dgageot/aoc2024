#!/usr/bin/env ruby
# Expected: 5

require "../common.rb"

Robot = Struct.new(:x, :y, :vx, :vy)

robots = STDIN.readlines(chomp: true).map do |line|
  Robot.new(*line.scanf("p=%d,%d v=%d,%d"))
end

height, width = robots.count == 12 ? [7, 11] : [103, 101]

min = Float::INFINITY
mint = nil
grid = nil

(1..(height * width)).each do |t|
  robots.each do |r|
    r.x = (r.x + r.vx) % width
    r.y = (r.y + r.vy) % height
  end

  a = robots.count { |r| r.x < width / 2 && r.y < height / 2 }
  b = robots.count { |r| r.x < width / 2 && r.y > height / 2 }
  c = robots.count { |r| r.x > width / 2 && r.y > height / 2 }
  d = robots.count { |r| r.x > width / 2 && r.y < height / 2 }
  sf = a * b * c * d
  next if sf >= min
  min = sf

  grid = []
  height.times { |_| grid << [" "] * width }
  grid = Grid.new(grid)
  robots.each { |r| grid[r.y, r.x] = "*" }

  mint = t
end

puts mint
# puts grid