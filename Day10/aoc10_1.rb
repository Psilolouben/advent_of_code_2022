fname = './aoc10.txt'
input = File.read(fname)
lines = input.split("\n")

x = 1; c = 0; a = {}
lines.each do |l|
  if l == 'noop'
    c += 1
    next
  end
  c += 2
  x += l.split(' ')[1].to_i
  a[c] = x
end
pp [20, 60, 100, 140, 180, 220].inject(0) { |s, b| s + (a.select{|k,v| k < b}.values.last.to_i * b) }



