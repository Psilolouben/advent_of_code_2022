fname = 'kokolala'
input = File.read(fname)
lines = input.split("\n").map{|x| x.split " "}

# Solution
human_play = [ 'A', 'B', 'C']
rules = { 'A' => { beats: 'C', draws_with: 'A', loses_from: 'B'}, 'B' => { beats: 'A', draws_with: 'B', loses_from: 'C'}, 'C' => { beats: 'B', draws_with: 'C', loses_from: 'A'}}
lines.inject(0) { |sum, (elf, human)| sum + (human == 'X' ? 0 : (human == 'Y' ? 3 : 6)) + (human_play.index(human == 'X' ? rules[elf][:beats] : (human == 'Z' ? rules[elf][:loses_from] : rules[elf][:draws_with])) + 1)}
