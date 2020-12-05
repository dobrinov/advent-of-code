def seat_id_from(code)
  decode(code)[2]
end

def decode(code)
  row = locate 0, 127, code[0..6], 'B'
  col = locate 0,   7, code[7..9], 'R'

  [row, col, row * 8 + col]
end

def locate(min, max, sequence, upper_end_letter)
  current_min = min
  current_max = max

  sequence.split('').each do |letter|
    boundary = current_min + ((current_max - current_min) / 2)

    current_min, current_max =
      if letter == upper_end_letter
        [boundary + 1, current_max]
      else
        [current_min, boundary]
      end
  end

  raise 'Wrong calculation' unless current_min == current_max

  current_min.to_i
end

def run
  seat_ids = []
  missing_seat_id = nil

  File.open('input.txt', 'r') do |f|
    f.each_line do |code|
      seat_ids << seat_id_from(code)
    end
  end

  seat_ids.sort!

  seat_ids.each_with_index do |id, index|
    next if index == 0

    if id != seat_ids[index - 1] + 1
      missing_seat_id = id - 1
      break
    end
  end

  [
    seat_ids.last,  # Part 1
    missing_seat_id # Part 2
  ]
end
