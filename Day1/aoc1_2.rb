fname = 'kokolala'
input = open(fname) { |f| f.read }

# Solution
input.split("\n").map(&:to_i).split{ |c| c == 0 }.map(&:sum).sort.reverse.take(3).sum
