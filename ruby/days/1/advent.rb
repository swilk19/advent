require_relative 'device'
require_relative 'frequency'

src = './input.txt'
device = Device.new

device.process_input src

puts device.frequency

device.process_input src while device.double_history.count.zero?

puts device.double_history[0]
