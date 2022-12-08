fname = './aoc8.txt'
input = File.read(fname)

def visible?(i, j, mp)
  if i == (mp.size - 1) || j == (mp.size - 1) || i == 0 || j == 0
    return true
  end

  top_visible?(i, j, mp) || bottom_visible?(i, j, mp) || left_visible?(i, j, mp) || right_visible?(i, j, mp)
end

def top_visible?(i, j, mp)
  k = 0; visible = true;
  while k < i
    visible = false if mp[k][j] >= mp[i][j]; k += 1
  end
  
  visible
end

def bottom_visible?(i, j, mp)
  k = i+1; visible = true
  while k < mp.size
    visible = false if mp[k][j] >= mp[i][j]; k += 1
  end
  
  visible
end

def left_visible?(i, j, mp)
  arr = mp[i].take(j+1); curr = mp[i][j]; arr.max == curr && arr.tally[curr] == 1
end

def right_visible?(i, j, mp)
  arr = mp[i].last(mp.size-j); curr = mp[i][j]; arr.max == curr && arr.tally[curr] == 1
end

mp = []
visible = []
lines = input.split("\n")
lines.each { |l| mp << l.split('').map(&:to_i)}

i = 0; j = 0;
while i < lines.size
  j = 0
  while j < lines.size 
    visible << [i,j] if visible?(i,j,mp)
    j += 1
  end
  i += 1
end
pp visible.count


