numbers = File.read('input.txt').split("\n").map(&:to_i).sort

p numbers.combination(2).find { |(x, y)| x + y == 2020 }
p numbers.combination(3).find { |(x, y, z)| x + y + z == 2020 }
