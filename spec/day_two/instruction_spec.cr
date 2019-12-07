require "../spec_helper"

describe DayTwo::Instruction do
  describe "#execute" do
    context "a small addition instruction set" do
      it "adds the numbers correctly" do
        instructions = {1, 0, 0, 0}
        memory = [1, 0, 0, 0, 99]
        DayTwo::Instruction.new(instructions, memory).execute

        memory.should eq [2, 0, 0, 0, 99]
      end
    end

    context "a small multiplication instruction set" do
      it "multiplies the numbers correctly" do
        instructions = {2, 3, 0, 3}
        memory = [2, 3, 0, 3, 99]
        DayTwo::Instruction.new(instructions, memory).execute

        memory.should eq [2, 3, 0, 6, 99]
      end
    end

    context "a moderate multiplication instruction set" do
      it "multiplies the numbers correctly" do
        instructions = {2, 4, 4, 5}
        memory = [2, 4, 4, 5, 99, 0]
        DayTwo::Instruction.new(instructions, memory).execute

        memory.should eq [2, 4, 4, 5, 99, 9801]
      end
    end

    context "when multiple instructions work on the same memory" do
      it "adds and multiplies" do
        memory = [1, 1, 1, 4, 99, 5, 6, 0, 99]
        DayTwo::Instruction.new({memory[0], memory[1], memory[2], memory[3]}, memory).execute
        DayTwo::Instruction.new({memory[4], memory[5], memory[6], memory[7]}, memory).execute

        memory.should eq [30, 1, 1, 4, 2, 5, 6, 0, 99]
      end
    end
  end
end
