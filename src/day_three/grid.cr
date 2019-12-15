module DayThree
  class Grid
    getter min_distance : (Int32 | Nil)
    getter min_delay : (Int32 | Nil)

    def initialize
      @board = Set(Tuple(Int32, Int32)).new
      @min_distance = nil
      @min_delay = nil
      @wires = Array(Wire).new
      @steps_map = {} of Wire => Hash(Tuple(Int32, Int32), Int32)
    end

    def add_wire(wire : Wire)
      @wires << wire
      @steps_map[wire] = {} of Tuple(Int32, Int32) => Int32
      wire.history.each_with_index do |position, i|
        check_position(position) unless position == {0, 0}
      end

      check_position(wire.position)
    end

    private def check_position(position : Tuple(Int32, Int32))
      unless @board.add?(position)
        check_distance(position)
        check_delay(position)
      end
    end

    private def manhattan_distance(point_1 : Tuple(Int32, Int32), point_2 : Tuple(Int32, Int32)) : Int32
      (point_2[0] - point_1[0]).abs + (point_2[1] - point_1[1]).abs
    end

    private def check_delay(position : Tuple(Int32, Int32))
      steps = @wires.first.steps_to[position] + @wires[1].steps_to[position]

      if @min_delay.nil?
        @min_delay = steps
      else
        min = @min_delay.as(Int32)
        @min_delay = steps if steps < min
      end
    end

    private def check_distance(position : Tuple(Int32, Int32))
      x, y = position
      distance = manhattan_distance({0, 0}, position)

      if @min_distance.nil?
        @min_distance = distance
      else
        min = @min_distance.as(Int32)
        @min_distance = distance if distance < min
      end
    end
  end
end
