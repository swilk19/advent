require "../spec_helper"

describe DayTwo::Opcode do
  describe "#action" do
    context "when the action is 1" do
      it "returns the action as :add" do
        action = DayTwo::Opcode.new(1).action.
        
        action.should eq(:add)
      end
    end
  end
end
