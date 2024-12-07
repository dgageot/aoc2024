#!/usr/bin/env ruby
# Expected: 3749

def equals(result, parts)
  return result == parts[0] if parts.length == 1

  l, r = parts[-1], parts[0...-1]
  return equals(result - l, r) || ((result % l) == 0 && equals(result / l, r))
end

lines = STDIN.readlines(chomp: true)

sum = 0
lines.each do |line|
  result, parts = line.split(': ')
  result = result.to_i
  parts = parts.split(' ').map(&:to_i)

  sum += result if equals(result, parts)
end
p sum
