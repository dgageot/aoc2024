#!/usr/bin/env ruby
# Expected: 55312

stones = STDIN.readlines(chomp: true).first.split(' ').map(&:to_i)

25.times do
  copy = []
  stones.each do |stone|
    if stone == 0
      copy << 1
      next
    end
    
    s = stone.to_s
    n = s.size 
    if n % 2 == 0
      copy << s[...(n / 2)].to_i
      copy << s[(n / 2)..].to_i
      next
    end

    copy << stone * 2024
  end

  stones = copy
end
p stones.count
