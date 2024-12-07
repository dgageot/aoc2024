#!/usr/bin/env ruby
# Expected: 1928

drive = STDIN.readlines(chomp: true).map(&:chars)[0].map(&:to_i)

blocks = []
drive.each.with_index do |v, i|
  if i % 2 == 0 
    blocks += [i / 2] * v
  else
    blocks += ["."] * v
  end
end

first = 0
last = blocks.length - 1
loop do
  first += 1 while blocks[first] != "."
  last -= 1 while blocks[last] == "."
  break if last <= first

  blocks[first], blocks[last] = blocks[last], blocks[first]
end

checksum = 0
blocks.each.with_index do |v, i|
  checksum += i * v if v != "."
end
p checksum

