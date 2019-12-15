require "../spec_helper"

describe DayThree::Grid do
  context "when parsing the simple example wires" do
    first_wire = DayThree::Wire.parse("R8,U5,L5,D3")
    second_wire = DayThree::Wire.parse("U7,R6,D4,L4")
    grid = DayThree::Grid.new

    grid.add_wire(first_wire)
    grid.add_wire(second_wire)

    it "returns the minimum distance as 6" do
      grid.min_distance.should eq 6
    end

    it "returns the minimum delay as 30" do
      grid.min_delay.should eq 30
    end
  end

  context "when parsing the first moderate example wires" do
    first_wire = DayThree::Wire.parse("R75,D30,R83,U83,L12,D49,R71,U7,L72")
    second_wire = DayThree::Wire.parse("U62,R66,U55,R34,D71,R55,D58,R83")
    grid = DayThree::Grid.new

    grid.add_wire(first_wire)
    grid.add_wire(second_wire)

    it "returns the minimum distance as 159" do
      grid.min_distance.should eq 159
    end

    it "returns the minimum delay as 610" do
      grid.min_delay.should eq 610
    end
  end

  context "when parsing the second moderate example wires" do
    first_wire = DayThree::Wire.parse("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51")
    second_wire = DayThree::Wire.parse("U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")
    grid = DayThree::Grid.new

    grid.add_wire(first_wire)
    grid.add_wire(second_wire)

    it "returns the minimum distance as 135" do
      grid.min_distance.should eq 135
    end

    it "returns the minimum delay as 410" do
      grid.min_delay.should eq 410
    end
  end
end
