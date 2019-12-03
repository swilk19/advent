require "./*"
require "admiral"

class DayOne < Admiral::Command
  define_help description: "A command line program to help solve Advent of Code Day 1"
  define_flag part : Int32, description: "Part 1 or 2 of day 1.", default: 1, short: "p"
  define_argument file : String, required: true

  def run
    result = [] of SpaceModule
    File.open(arguments.file).each_line do |mass|
      result << SpaceModule.new(mass)
    end

    if flags.part == 1
      puts result.map { |space_module| space_module.basic_fuel }.sum
    elsif flags.part == 2
      puts result.map { |space_module| space_module.complex_fuel }.sum
    else
      puts "Error: please specify part 1 or part 2."
    end
  end
end

begin
  DayOne.run
rescue NilAssertionError
  DayOne.run "--help"
rescue Errno
  STDERR.puts "No such file or directory."
end
