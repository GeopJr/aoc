input = File.read("input.txt").gsub(" ", "\n")

valid_info = {
  "byr" => /^(19[2-9][0-9]|200[0-2])$/,
  "iyr" => /^20(1[0-9]|20)$/,
  "eyr" => /^20(2[0-9]|30)$/,
  "hgt" => /^1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in$/,
  "hcl" => /^#[0-9a-f]{6}$/,
  "ecl" => /^amb|blu|brn|gry|grn|hzl|oth$/,
  "pid" => /^[0-9]{9}$/,
}

passports = input.split("\n\n")

valid = 0
passports.each do |passport|
  hash = Hash(String, String).new
  pairs = passport.split("\n").reject { |c| c.empty? }.map { |x| x.split(":") }
  pairs.each do |x|
    hash[x[0]] = x[1]
  end
  next unless (valid_info.keys - hash.keys).empty? || (valid_info.keys - hash.keys).first == "cid"
  wrong = false
  hash.keys.each do |key|
    next if key == "cid"
    break if wrong
    wrong = true if (valid_info[key].match(hash[key].to_s)).nil?
  end
  valid = valid.succ unless wrong
end

p valid
