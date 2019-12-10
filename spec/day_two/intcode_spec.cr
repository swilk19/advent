require "../spec_helper"

describe DayTwo::Intcode do
  describe "#parse" do
    context "when given the advent example program" do
      it "compiles the example program successfully" do
        program = "1,9,10,3,2,3,11,0,99,30,40,50"
        output = DayTwo::Intcode.compile(program, {9, 10})

        output.should eq [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]
      end
    end
  end
end
