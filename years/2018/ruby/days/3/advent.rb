require_relative 'fabric'

input = './input.txt'
test_input = './test.txt'

fabric = Fabric.new
fabric.process_input input
fabric.check_disputed_claims
#part 1
puts fabric.disputed_claims.size
#part 2
puts fabric.undisputed_claims.join(',')

# test_fabric = Fabric.new
# test_fabric.process_input test_input
# test_fabric.check_disputed_claims
# puts test_fabric.disputed_claims.size
# puts test_fabric.undisputed_claims.join(',')