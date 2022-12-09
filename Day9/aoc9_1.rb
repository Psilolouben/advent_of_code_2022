fname = './aoc9.txt'
input = File.read(fname)
lines = input.split("\n")

def move_head(direction, coords)
  coords[0] += 1 if direction == 'R'
  coords[0] -= 1 if direction == 'L'
  coords[1] += 1 if direction == 'U'
  coords[1] -= 1 if direction == 'D'
  coords
end

def move_tail(direction, t_coords, h_coords)
  follow(direction, t_coords) if far_apart?(h_coords, t_coords)
  cross(h_coords, t_coords) if diagonially_far?(h_coords, t_coords)
  t_coords.dup
end

def follow(direction, coords)
  coords[0] += 1 if direction == 'R'
  coords[0] -= 1 if direction == 'L'
  coords[1] += 1 if direction == 'U'
  coords[1] -= 1 if direction == 'D'
  coords.dup
end

def cross(h_coords, t_coords)
  if h_coords[0] > t_coords[0]
   t_coords[0] += 1
  else
    t_coords[0] -= 1
  end

  if h_coords[1] > t_coords[1]
    t_coords[1] += 1
  else
    t_coords[1] -= 1
  end
end

def diagonially_far?(h_coords, t_coords)
  h_coords[0] != t_coords[0] && 
  h_coords[1] != t_coords[1] && 
  (((h_coords[0] - t_coords[0]).abs + (h_coords[1] - t_coords[1]).abs) > 2)
end

def far_apart?(h_coords, t_coords)
  ((h_coords[0] - t_coords[0]).abs > 1 || 
  (h_coords[1] - t_coords[1]).abs > 1) && 
  (h_coords[0] == t_coords[0] || h_coords[1] == t_coords[1])
end

visited = []
h_coords=[0,0]
t_coords=[0,0]

lines.each do |l|
  @cl = l
  mvm = l.split(' ')[0]
  st = l.split(' ')[1].to_i
  
  st.times do
    move_head(mvm, h_coords)
    visited << move_tail(mvm, t_coords, h_coords) 
  end
end
pp visited.uniq.count

