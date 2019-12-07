require "./opcode"

module DayTwo
  class Instruction
    getter memory, instructions

    def initialize(instructions : Tuple(Int32, Int32, Int32, Int32), memory : Array(Int32))
      @instructions = instructions
      @memory = memory
    end

    def execute
      result = opcode.action.call(first_argument, second_argument)

      @memory[result_location] = result
    end

    private def opcode
      Opcode.new(instructions[0])
    end

    private def first_argument
      memory[instructions[1]]
    end

    private def second_argument
      memory[instructions[2]]
    end

    private def result_location
      instructions[3]
    end
  end
end
