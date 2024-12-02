#!/usr/bin/env ruby
# Expected: 31

l, r = STDIN
    .readlines(chomp: true)
    .map { |line| line.split.map(&:to_i) }
    .transpose
p l.sum { |v| v * r.count(v) }
