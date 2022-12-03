fname = 'kokolala'
input = File.read(fname)

lines = input.split("\n")

lines.sum { |l| (l[0..((l.size/2) - 1)].split('') & l[(l.size/2)..l.size].split('')).sum{|c| (('a'..'z').to_a + ('A'..'Z').to_a).index(c) + 1} }
