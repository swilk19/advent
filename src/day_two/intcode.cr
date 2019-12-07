require "./instruction"
require "./opcode"

module DayTwo
  class Intcode
    def self.compile(program : String, production = false) : Array(Int32)
      instructions = Intcode.new(program, production)

      instructions.execute
    end

    getter program : Array(Int32)

    def initialize(program : String, production = false)
      @program = program.split(",").map { |string| Int32.new(string) }

      if production
        @program[1] = 12
        @program[2] = 2
      end
    end

    def execute : Array(Int32)
      begin
        @program.each_slice(4) do |instructions|
          Instruction.new(
            {instructions[0], instructions[1], instructions[2], instructions[3]},
            program
          ).execute
        end

        program
      rescue EndOfExecution
        program
      end
    end
  end
end
