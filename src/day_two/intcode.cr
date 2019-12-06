module DayTwo
  class Intcode
    def initialize(program : String)
      @program : Array(Int32) = program.split(",").map { |opcode| Int32.new(opcode) }
    end

    def execute : Int32
      0
    end
  end
end