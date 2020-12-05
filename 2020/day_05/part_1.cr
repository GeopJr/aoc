input = File.read_lines("input.txt")

row, column = 0, 0

def diadiki_search(code : String)
  last_input = (['L', 'R'].includes?(code[0]) ? 0..7 : 0..127).to_a
  code.each_char do |char|
    median = last_input[((last_input.size - 1)/2).to_i32]
    last_input = (['L', 'F'].includes?(char) ? last_input[0]..median : (median + 1)..last_input[-1]).to_a
  end
  return last_input[0]
end

def seat_id(r : Int32, c : Int32)
  r * 8 + c
end

highest_id = 0
input.each do |line|
  row, column = diadiki_search(line.[0..6]), diadiki_search(line[7...line.size])
  seat = seat_id(row, column)
  highest_id = highest_id > seat ? highest_id : seat
end

p highest_id
