# Use the same script as that of the first part
us = 70000000 - dir_map['/'][:siz]
ns = 30000000 - us
dir_map.select{ |k,v| v[:siz] >= ns}.map{|_,v| v[:siz]}.min
