require 'pry'
require 'pry-nav'
fname = './aoc11.txt'
input = File.read(fname)
lines = input.split("\n")

def inspect_item(item, operation, operator2)
  if operation == '*'
    item *= operator2
  else
    item += operator2
  end
  item
end

monkeys = Hash.new{|h,k| h[k]=[]}
mc = Hash.new{|h,k| h[k]=0}
round = 1
current_items = []
divider = 1
current_monkey = 0 

10000.times do
  pp monkeys if round < 6 
  lines.each do |l|
    if l.lstrip.start_with?('Monkey')
      current_monkey = l.split(' ')[1].split(':')[0].to_i
    end

    if l.lstrip.start_with?('Starting')  
      if round == 1
        current_items = monkeys[current_monkey] + l.split(' ')[2..-1].map{|x| x.gsub(',','').to_i}
      else
        current_items = monkeys[current_monkey]
      end
      monkeys[current_monkey] = []
    end
    if l.lstrip.start_with?('Operation')
      operation = l.split(' ')[4]
      inspected_items = []
      current_items.each{|x| inspected_items << (inspect_item(x, operation, l.split(' ')[5] == 'old' ? x : l.split(' ')[5].to_i) % 9699690)}
      current_items = inspected_items 
      mc[current_monkey] += inspected_items.count
    end

    if l.lstrip.start_with?('Test')
      divider = l.split(' ')[3].to_i
    end
    
    if l.lstrip.start_with?('If true')
      recipient = l.split(' ')[5].to_i
      current_items.each{|x| (monkeys[recipient] << x) if (x % divider == 0) }
    end

    if l.lstrip.start_with?('If false')
      recipient = l.split(' ')[5].to_i
      current_items.each{|x| (monkeys[recipient] << x) if (x % divider != 0) }  
    end
  end
  round += 1
end
pp mc.values.sort.reverse.take(2).reduce(:*)
