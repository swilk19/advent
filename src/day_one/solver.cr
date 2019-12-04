module DayOne
  class Solver
    def initialize(file : String, part : Int32)
      @file = file
      @part = part
    end

    def solve
      result = [] of DayOne::SpaceModule
      File.open(@file).each_line do |mass|
        result << DayOne::SpaceModule.new(mass)
      end

      if @part == 1
        puts result.map { |space_module| space_module.basic_fuel }.sum
      elsif @part == 2
        puts result.map { |space_module| space_module.complex_fuel }.sum
      else
        STDERR.puts "Error: please specify part 1 or part 2 for day 1."
      end
    end
  end
end
