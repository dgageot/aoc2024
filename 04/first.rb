#!/usr/bin/env ruby
# Expected: 18

def diagonals(square)
  diagonals = []

  (3...square.size).each do |i|
    diagonals << (0..i).map { |j| square[j][i - j] }
    diagonals << (0..i).map { |j| square[j].reverse[i - j] }
  end

  (1...(square.size - 3)).each do |i|
    diagonals << (i...square.size).map { |j| square[j][j - i] }
    diagonals << (i...square.size).map { |j| square[j].reverse[j - i] }
  end

  diagonals
end

lines = STDIN.readlines(chomp: true).map(&:chars)

p (lines + lines.transpose + diagonals(lines))
  .sum { |line| line.each_cons(4).count { |sub| ["XMAS", "SAMX"].include?(sub.join) } }
