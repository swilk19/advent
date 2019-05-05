require_relative 'scanner'
src = './input.txt'
test_file = './test.txt'


device = Scanner.new
test = Scanner.new
device.process_input src
test.process_input test_file

#Part 1
puts (device.three_count_list.size * device.two_count_list.size)

#Part 2
test.find_prototypes
puts test.prototype_ids[0]
device.find_prototypes
puts device.prototype_ids[0]