#!/usr/bin/env ruby
# Expected: 2858

drive = STDIN.readlines(chomp: true).map(&:chars)[0].map(&:to_i)

blocks = []
drive.each.with_index do |v, i|
  next if v == 0
  if i % 2 == 0 
    blocks += [[i / 2] * v]
  else
    blocks += [["."] * v]
  end
end

last = blocks.length - 1
loop do
  break if last < 0
  if blocks[last][0] == "."
    last -= 1
    next
  end

  blocks.each.with_index do |v, first|
    break if first >= last
    if v[0] == "." && v.length >= blocks[last].length
      n_first = blocks[first].length
      n_last = blocks[last].length
      blocks[first] = blocks[last]
      blocks[last] = ["."] * n_last
      if n_first != n_last
        blocks.insert(first + 1, ["."] * (n_first - n_last))
        last += 1
      end
      break
    end
  end

  last -= 1
end

checksum = 0
i = 0
blocks.each do |v|
  v.each do
    checksum += i * v[0] if v[0] != "."
    i += 1
  end
end
p checksum

