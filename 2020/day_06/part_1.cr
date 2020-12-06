input = File.read("input.txt")

groups = input.split("\n\n")

sum = 0
groups.each do |group|
  arr = [] of Char
  group.split("\n").each { |ans| arr = arr + ans.chars }
  sum = sum + arr.size
end

p sum
