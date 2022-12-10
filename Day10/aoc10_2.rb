fname = './aoc10.txt'
input = File.read(fname)
lines = input.split("\n")

x = 1; c = 0; a = {}
op = []
sprt = [0,1,2]
lines.each do |l|
  if l == 'noop'
    c += 1
    next
  end
  c += 2
  x += l.split(' ')[1].to_i
  a[c] = x
end
x = 2
(0..239).each do |c|
  x = a.select{|k,v| k <= c}.values.last || 1
  sprt = [x-1, x, x+1]
  op << "\n" if c % 40 == 0
  sprt.include?(c % 40) ? (op << '#') : (op <<  '.')
 end
pp op.join('')
