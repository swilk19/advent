require "./segment"

module DayThree
  class Wire
    getter history : Set(Tuple(Int32, Int32))
    getter position : Tuple(Int32, Int32)
    getter steps_to : Hash(Tuple(Int32, Int32), Int32)

    def self.parse(wire : String) : Wire
      segments = Array(Segment).new
      wire.split(",").each do |movement|
        segments << Segment.new(movement)
      end
      wire_result = Wire.new
      wire_result.add_segments(segments)

      wire_result
    end

    def initialize
      @history = Set(Tuple(Int32, Int32)).new
      @position = {0, 0}
      @steps_to = {} of Tuple(Int32, Int32) => Int32
      @cur_steps = 0
    end

    def add_segments(segments : Array(Segment))
      segments.each do |segment|
        add_segment(segment)
      end
    end

    def add_segment(segment : Segment)
      case segment.direction
      when 'R'
        segment.length.times do
          move({1, 0})
          @cur_steps += 1
        end
      when 'L'
        segment.length.times do
          move({-1, 0})
          @cur_steps += 1
        end
      when 'U'
        segment.length.times do
          move({0, 1})
          @cur_steps += 1
        end
      when 'D'
        segment.length.times do
          move({0, -1})
          @cur_steps += 1
        end
      end
    end

    private def move(movement : Tuple(Int32, Int32))
      if history.add?(position)
        @steps_to[position] = @cur_steps
      end

      x, y = position
      x_move, y_move = movement
      @position = {x + x_move, y + y_move}
      @steps_to[position] = @cur_steps + x_move + y_move
    end
  end
end
