require "../spec_helper"

describe DayThree::Wire do
  context "when the wire has a segment to the right" do
    wire = DayThree::Wire.new
    segment = DayThree::Segment.new("R1")

    wire.add_segment(segment)

    it "has a position one to the right" do
      wire.position.should eq({1, 0})
    end

    it "has a history with just the original position" do
      wire.history.should eq(Set{ {0, 0} })
    end

    it "has taken one step" do
      wire.steps_to[{1, 0}].should eq 1
    end
  end

  context "when the wire has a longer segment to the right" do
    wire = DayThree::Wire.new
    segment = DayThree::Segment.new("R5")

    wire.add_segment(segment)

    it "has a position five to the right and a single history entry" do
      wire.position.should eq({5, 0})
    end

    it "has a history of the previous 4 points" do
      wire.history.should eq Set{ {0, 0}, {1, 0}, {2, 0}, {3, 0}, {4, 0} }
    end

    it "has taken 5 steps" do
      wire.steps_to[{5, 0}].should eq 5
    end
  end

  context "when the wire adds multiple segments" do
    wire = DayThree::Wire.new
    right_segment = DayThree::Segment.new("R3")
    up_segment = DayThree::Segment.new("U2")

    wire.add_segments([right_segment, up_segment])

    it "has a position with both x and y coordinates" do
      wire.position.should eq({3, 2})
    end

    it "has a history entry for all the right and up movements" do
      wire.history.should eq Set{ {0, 0}, {1, 0}, {2, 0}, {3, 0}, {3, 1} }
    end

    it "has taken 5 steps" do
      wire.steps_to[{3, 2}].should eq 5
    end
  end

  context "when parsing the first advent wire example" do
    wire_route = "R8,U5,L5,D3"
    wire = DayThree::Wire.parse(wire_route)

    it "returns the same position as advent" do
      wire.position.should eq({3, 2})
    end

    it "shows a history entry for each unique point visited" do
      wire.history.should eq(
        Set{
          {0, 0},
          {1, 0},
          {2, 0},
          {3, 0},
          {4, 0},
          {5, 0},
          {6, 0},
          {7, 0},
          {8, 0},
          {8, 1},
          {8, 2},
          {8, 3},
          {8, 4},
          {8, 5},
          {7, 5},
          {6, 5},
          {5, 5},
          {4, 5},
          {3, 5},
          {3, 4},
          {3, 3},
        }
      )
    end

    it "has taken 19 steps" do
      wire.steps_to[{3, 2}].should eq 19
    end
  end
end
