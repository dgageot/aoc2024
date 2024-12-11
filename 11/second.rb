#!/usr/bin/env ruby
# Expected: 65601038650482

stones = STDIN.readlines(chomp: true).first.split(' ').map(&:to_i)

stones = stones.map { |stone| [stone, 1] }.to_h

75.times do
  copy = Hash.new(0)
  stones.each do |stone, c|
    if stone == 0
      copy[1] += c
      next
    end
    
    s = stone.to_s
    n = s.size 
    if n % 2 == 0
      copy[s[...(n / 2)].to_i] += c
      copy[s[(n / 2)..].to_i] += c
      next
    end

    copy[stone * 2024] += c
  end

  stones = copy
end
p stones.values.sum
