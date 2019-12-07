require "./intcode"

module DayTwo
  class Solver
    def initialize(file : String, part : Int32)
      @file = file
      @part = part
    end

    def solve
      program = File.read(@file)

      if @part == 1
        compiled = Intcode.compile(program, true)
        puts compiled[0]
      elsif @part == 2
        STDERR.puts "not there yet"
      else
        STDERR.puts "Error: please specify part 1 or part 2 for day 1."
      end
    end
  end
end
