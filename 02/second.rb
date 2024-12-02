#!/usr/bin/env ruby
# Expected: 4

def safe(values)
    diff = values.each_cons(2).map { |a, b| b - a }
    diff.all? { |v| (1..3).include?(v) } || diff.all? { |v| (-3..-1).include?(v) } 
end

p STDIN
    .readlines(chomp: true)
    .map { |line| line.split.map(&:to_i) }
    .count { |values| (0..values.length).any? { |i| safe(values.rotate(-i)[1..].rotate(i-1)) } }
