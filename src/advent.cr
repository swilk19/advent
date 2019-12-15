require "./day_one/solver"
require "./day_two/solver"
require "./day_three/solver"
require "admiral"

class Advent < Admiral::Command
  define_help description: "A command line program to help solve Advent of Code"
  define_flag day : Int32, required: true, long: "day", short: "d", default: 1, description: "Which Advent of Code day to process input for"
  define_flag part : Int32, long: "part", short: "p", default: 1, description: "Which part of the day to use when determining answer"
  define_argument file : String, required: true

  def run
    case flags.day
    when 1
      DayOne::Solver.new(arguments.file, flags.part).solve
    when 2
      DayTwo::Solver.new(arguments.file, flags.part).solve
    when 3
      DayThree::Solver.new(arguments.file, flags.part).solve
    else
      STDERR.puts "Error: invalid day."
    end
  end
end

begin
  Advent.run ARGV
rescue NilAssertionError
  Advent.run "--help"
rescue ArgumentError
  STDERR.puts "Error: Day or part value must be numeric if provided."
rescue Errno
  STDERR.puts "Error: No such file or directory."
end
