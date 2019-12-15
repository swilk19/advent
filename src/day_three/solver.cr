require "./grid"
require "./wire"

module DayThree
  class Solver
    def initialize(file : String, part : Int32)
      @file = file
      @part = part
    end

    def solve
      grid = Grid.new

      File.open(@file).each_line do |wire|
        grid.add_wire(Wire.parse(wire))
      end

      case @part
      when 1
        puts grid.min_distance
      when 2
        puts grid.min_delay
      end
    end
  end
end
