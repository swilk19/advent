module DayThree
  class Segment
    property direction : Char
    property length : Int32

    def initialize(segment : String)
      @direction = segment[0]

      raise Exception.new("Invalid direction") unless ['U', 'D', 'L', 'R'].includes? @direction

      @length = Int32.new(segment[1..])
    end
  end
end
