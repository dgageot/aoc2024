#!/usr/bin/env ruby
# Expected: 143

def is_sorted(update, orders)
  update.each_cons(2).all? { |l,r| orders.include?("#{l}|#{r}") }
end

orders = Set.new
updates = []

STDIN.readlines(chomp: true).each do |line|
  next if line == ""

  if line.include?("|")
    orders << line
  else
    updates << line.split(",").map(&:to_i)
  end
end

count = 0
updates.each do |update|
  next if !is_sorted(update, orders)
  count += update[update.count / 2]
end
p count
