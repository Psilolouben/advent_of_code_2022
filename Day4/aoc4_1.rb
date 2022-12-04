fname = 'kokolala'
input = File.read(fname)
lines = input.split("\n")

lines.count { |l| arr = l.split(',').map{ |x| x.split('-')}.map{ |y| (y.first.to_i)..(y.last.to_i)}.flatten.map(&:to_a); (arr[0] - arr[1] == []) || (arr[1] - arr[0] == []) }
