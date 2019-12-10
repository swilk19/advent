require "./instruction"
require "./opcode"

module DayTwo
  class Intcode
    def self.compile(program : String, substitutions = {12, 2}) : Array(Int32)
      instructions = Intcode.new(program, substitutions)

      instructions.execute
    end

    getter program : Array(Int32)

    def initialize(program : String, substitutions = {12, 2})
      @program = program.split(",").map { |string| string.to_i }

      @program[1] = substitutions[0]
      @program[2] = substitutions[1]
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
