valid_passwords = 0

File.open('input.txt', 'r') do |f|
  f.each_line do |line|
    segments = line.split ' '

    one, two = segments[0].split '-'
    letter = segments[1][0...-1]
    password = segments[2]

    if (password[one.to_i - 1] == letter && password[two.to_i - 1] != letter) || (password[one.to_i - 1] != letter && password[two.to_i - 1] == letter)
      valid_passwords += 1
    end
  end
end

p valid_passwords
