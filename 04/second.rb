#!/usr/bin/env ruby
# Expected: 9

lines = STDIN.readlines(chomp: true).map(&:chars)

sum = 0
(0..lines.size-3).each do |row|
    (0..lines[0].size-3).each do |col|
        block = lines[row][col] + lines[row][col+2] + lines[row+1][col+1] + lines[row+2][col] + lines[row+2][col+2]
        sum +=1 if ["MSAMS", "MMASS", "SMASM", "SSAMM"].include?(block)
    end
end
p sum