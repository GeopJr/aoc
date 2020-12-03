input = File.read_lines("input.txt")

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

result = 1_u64

slopes.each do |set|
  right, down = set
  trees = 0_u64
  current_position = 0

  length = input.size
  last_step = 0
  input.each_index do |index|
    next unless index == last_step
    break if index == length - 1
    current_position += right
    next_step = index + down
    last_step = next_step
    location = input[next_step][current_position % input[index].size] if input.size > next_step
    trees = trees.succ if location.to_s == "#"
  end
  result = result * trees
end
p result
