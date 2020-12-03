$pattern = File.readlines('input.txt', chomp: true).map { |line| line.split('') }

def terain_at(y, x)
  $pattern[y][x % $pattern[0].size]
end

def go(right, down)
  trees = 0
  y = 0
  x = 0

  while(y < $pattern.length) do
    if terain_at(y, x) == '#'
      trees += 1
    end

    y += down
    x += right
  end

  trees
end

paths = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].map { |slope| go(*slope) }

# Part 1
p paths[1]

# Part 2
p paths.inject(1) { |acc, cur| acc * cur }
