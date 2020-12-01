input = File.read_lines("input.txt").map { |x| x.to_i32 }

result = 0
input.each_combination(3) do |comb|
  if comb[0] + comb[1] + comb[2] == 2020
    result = comb[0] * comb[1] * comb[2]
  end
end

p result
