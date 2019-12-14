require "./intcode"

module DayTwo
  class Solver
    def initialize(file : String, part : Int32, target = 19690720)
      @file = file
      @part = part
      @target = target
    end

    def solve
      program = File.read(@file)

      if @part == 1
        compiled = Intcode.compile(program)
        puts compiled[0]
      elsif @part == 2
        (0..99).each do |noun|
          (0..99).each do |verb|
            compiled = Intcode.compile(program.dup, {noun, verb})
            if compiled[0] == @target
              puts 100 * noun + verb
              break
            end
          end
        end
      else
        STDERR.puts "Error: please specify part 1 or part 2 for day 1."
      end
    end
  end
end
