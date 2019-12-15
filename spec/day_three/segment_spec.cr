require "../spec_helper"

describe DayThree::Segment do
  context "when given up 1" do
    it "parses it to 1 movement up" do
      movement = "U1"
      segment = DayThree::Segment.new(movement)

      segment.direction.should eq 'U'
      segment.length.should eq 1
    end
  end

  context "when given down 1" do
    it "parses it to 1 movement down" do
      movement = "D1"
      segment = DayThree::Segment.new(movement)

      segment.direction.should eq 'D'
      segment.length.should eq 1
    end
  end

  context "when given right 1" do
    it "parses it to 1 movement right" do
      movement = "R1"
      segment = DayThree::Segment.new(movement)

      segment.direction.should eq 'R'
      segment.length.should eq 1
    end
  end

  context "when given left 1" do
    it "parses it to 1 movement left" do
      movement = "L1"
      segment = DayThree::Segment.new(movement)

      segment.direction.should eq 'L'
      segment.length.should eq 1
    end
  end

  context "when given a large number" do
    it "parses multiple digits" do
      movement = "L1348273423"
      segment = DayThree::Segment.new(movement)

      segment.direction.should eq 'L'
      segment.length.should eq 1348273423
    end
  end

  context "when given a bad direction" do
    it "raises an exception" do
      movement = "Q1"

      expect_raises(Exception) do
        segment = DayThree::Segment.new(movement)
      end
    end
  end
end
