#!/usr/bin/env ruby
# Expected: 48

require "scanf"

sum = 0
enabled = true
STDIN
    .read
    .scan(/mul\(\d+,\d+\)|do\(\)|don't\(\)/)
    .each do |match|
        if match == "do()"
            enabled = true
        elsif match == "don't()"
            enabled = false
        elsif enabled
            x, y = match.scanf("mul(%d,%d)")
            sum += x * y
        end
    end
p sum
