input = File.read_lines("input.txt")

valid_pass = 0
input.each do |line|
  validation, pass = line.split(": ")
  pre_range, target = validation.split(" ")
  range = pre_range.split("-").map { |x| x.to_i32 }
  tmp = 0
  range.each do |x|
    tmp = tmp.succ if pass[x - 1]?.to_s == target
  end
  valid_pass = valid_pass.succ if tmp == 1
end

p valid_pass
