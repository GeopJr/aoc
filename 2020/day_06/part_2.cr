input = File.read("input.txt")

groups = input.split("\n\n")

sum = 0
groups.each do |group|
  arr = [] of Array(Char)
  group.split("\n").each { |ans| arr << ans.chars }
  sum = sum + arr.reduce { |x, y| x & y }.size
end

p sum
