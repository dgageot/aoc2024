#!/usr/bin/env ruby
# Expected: 11

p STDIN
    .readlines(chomp: true)
    .map { |line| line.split.map(&:to_i) }
    .transpose
    .map(&:sort)
    .transpose
    .sum { |l, r| (l - r).abs }
