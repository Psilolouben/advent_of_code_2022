fname = 'kokolala'
input = File.read(fname)
lines = input.split("\n").map{|x| x.split " "}

# Solution
human_play = [ 'X', 'Y', 'Z']
rules = { 'X' => { beats: 'C', draws_with: 'A'}, 'Y' => { beats: 'A', draws_with: 'B'}, 'Z' => { beats: 'B', draws_with: 'C'}}
lines.inject(0){ |sum, (elf, human)| sum + human_play.index(human) + 1 + (rules[human][:beats] == elf ? 6 : (rules[human][:draws_with] == elf ? 3 : 0)) }

