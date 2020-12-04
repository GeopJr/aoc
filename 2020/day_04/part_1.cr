input = File.read("input.txt").gsub(" ", "\n")

valid_info = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
passports = input.split("\n\n")

valid = 0
passports.each do |passport|
  keys = passport.split("\n").map { |x| x.split(":")[0] }.reject { |c| c.empty? }
  valid = valid.succ if (valid_info - keys).empty? || (valid_info - keys).first == "cid"
end

p valid
