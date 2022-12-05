fname = 'kokolala'
input = File.read(fname)
lines = input.split("\n")

crate_map = ht = Hash.new {|h,k| h[k]=[]}
lines.each do |l|
  if l.include? '['
    step = -3
    (1..9).each { |i| step += 4; crate_map[i] += [l[step]] unless l[step].strip.empty? }
  end

  if l.include? 'move'
    tim = l.split(' ')[1].to_i; from = l.split(' ')[3].to_i; to = l.split(' ')[5].to_i
    crate_map[to] += crate_map[from].shift(tim); crate_map[to].rotate!(-1 * tim)
  end
end

crate_map.sort_by{|x, _| x}.to_h.map{|_,v| v[0]}.join
