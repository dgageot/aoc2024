#!/usr/bin/env ruby
# Expected: 11387

def equals(result, parts)
  return result == parts[0] if parts.length == 1

  r, l = parts[-1], parts[0...-1]
  return true if equals(result - r, l)
  return true if (result % r) == 0 && equals(result / r, l)
  return true if result.to_s.end_with?(r.to_s) && equals(result.to_s[0...(-r.to_s.length)].to_i, l)
  false
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
