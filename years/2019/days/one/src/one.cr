require "admiral"

class DayOne < Admiral::Command
  define_help description: "A command line program to help solve Advent of Code Day 1"
  define_argument filename : String, required: true

  def run
    result = [] of Int32
    File.open(arguments.filename).each_line { |mass| result << Int32.new((Int32.new(mass) / 3).floor - 2) }

    puts result.sum
  end
end

DayOne.run