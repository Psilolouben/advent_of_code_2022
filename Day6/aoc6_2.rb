fname = 'kokolala'
input = File.read(fname)
bg = 0 
en = 13

while 1 
  (pp en + 1; break;) if input[bg..en].split('').tally.none? { |_, v| v > 1 }
  en += 1; bg += 1
end
