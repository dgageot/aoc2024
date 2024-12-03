#!/usr/bin/env ruby
# Expected: 161

p STDIN
    .read
    .scan(/mul\((\d+),(\d+)\)/)
    .sum { |l, r| l.to_i * r.to_i }
