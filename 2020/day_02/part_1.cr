input = File.read_lines("input.txt")

valid_pass = 0
input.each do |line|
  validation, pass = line.split(": ")
  pre_range, target = validation.split(" ")
  r1, r2 = pre_range.split("-")
  just_target = pass.downcase.gsub(/[^#{target}]/, "")
  valid_pass = valid_pass.succ if (r1.to_i32..r2.to_i32) === just_target.size
end

p valid_pass
