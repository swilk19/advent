require 'chronic'

path = './test.txt'
File.open(path, 'r') do |file_handle|
    file_handle.each_line do |event|      
      split = event.split(' ')
      timestamp = split[0]
      test = Chronic.parse timestamp
      puts "#{timestamp} parsed to #{test}"
    end
end