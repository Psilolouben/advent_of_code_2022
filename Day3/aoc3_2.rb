fname = 'kokolala'
input = File.read(fname)

lines = input.split("\n")

sum = 0
arr = []
lines.each_with_index { |l, i| arr << l; (i + 1) % 3 == 0 ? (sum += (arr[0].split('') & arr[1].split('') & arr[2].split('')).sum{|c| (('a'..'z').to_a + ('A'..'Z').to_a).index(c) + 1}; arr=[];) : nil }
pp sum
