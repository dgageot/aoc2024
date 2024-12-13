#!/usr/bin/env ruby
# Expected: 875318608908

require "../common.rb"

def solve(xa, xb, ya, yb, xp, yp)
  solution = Matrix[[xa, xb], [ya, yb]].inverse * Vector[xp, yp]

  na, nb = *solution
  return 0 if na.to_i != na
  return 0 if nb.to_i != nb

  3 * na.to_i + nb.to_i
end

lines = STDIN.readlines(chomp: true)

tokens = 0
lines.each_slice(4).each do |a, b, p, _|
  xa, ya = a.scanf("Button A: X+%d, Y+%d")
  xb, yb = b.scanf("Button B: X+%d, Y+%d")
  xp, yp = p.scanf("Prize: X=%d, Y=%d")

  tokens += solve(xa, xb, ya, yb, 10000000000000 + xp, 10000000000000 + yp)
end
p tokens
