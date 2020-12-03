input = File.read_lines("input.txt")
right, down = 3, 1

trees = 0
current_position = 0

length = input.size
input.each_index do |index|
  break if index == length - 1
  current_position += right
  location = input[index + down][current_position % input[index].size]
  trees = trees.succ if location.to_s == "#"
end

p trees
