def step x
  x.to_s.split("").map { |y| y.to_i ** 2 }.inject(:+)
end

def happy x, map = { 1 => :happy }
  map[x] ||= :cycle
  y = step x
  map[y] || happy(y, map)
end

count = ARGV.first.to_i

count.times { |x| happy(x + 1) }