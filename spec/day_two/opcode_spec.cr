require "../spec_helper"

describe DayTwo::Opcode do
  describe "#action" do
    context "when the action is 1" do
      it "returns the action as add" do
        action = DayTwo::Opcode.new(1).action
        1000.times do
          x = rand(1..1000)
          y = rand(1..1000)
          action.call(x, y).should eq(x + y)
        end
      end
    end

    context "when the action is 2" do
      it "returns the action as multiply" do
        action = DayTwo::Opcode.new(2).action
        1000.times do
          x = rand(1..1000)
          y = rand(1..1000)
          action.call(x, y).should eq(x * y)
        end
      end
    end

    context "when the number is 99" do
      it "raises an EndOfExecution exception" do
        expect_raises(DayTwo::EndOfExecution) do
          DayTwo::Opcode.new(99)
        end
      end
    end

    context "when the number is not 1, 2, or 99" do
      it "raises an InvalidOpcode exception" do
        expect_raises(DayTwo::InvalidOpcode, "Opcode must be 1, 2, or 99") do
          DayTwo::Opcode.new(35)
        end
      end
    end
  end
end
