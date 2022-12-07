fname = './aoc7.txt'
input = File.read(fname)
lines = input.split("\n")

dir_map = Hash.new { |h,k| h[k] = { siz: 0} }
pwd = '/'
lines.each do |l|
  if l.start_with?('dir')
    new_dir = l.split(' ').map(&:strip)[1]
    dir_map[pwd + new_dir + '/' ] = { siz: 0}
  elsif l.start_with?('$ cd')
    new_dir = l.split(' ').map(&:strip)[2]
    next if new_dir == '/'
    if new_dir == '..'
      if pwd.split('/').size == 0
        pwd = '/'
      else
        pwd = pwd.split('/').take(pwd.split('/').size - 1).join('/') + '/'
      end
      next
    end
    pwd += new_dir + '/' 
  elsif !l.start_with?('$ ls')
    unless l.start_with?('dir')
      cp = '/'
      dir_map[cp][:siz] += l.split(' ').first.to_i
      pwd.split('/').reject(&:empty?).each do |p|
        cp += "#{p}/"
        dir_map[cp][:siz] += l.split(' ').first.to_i
      end
    end
  end
end
pp dir_map.select{ |k,v| v[:siz] <= 100000}.map{|_,v| v[:siz]}.sum
