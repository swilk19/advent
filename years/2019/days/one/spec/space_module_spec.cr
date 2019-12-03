require "./spec_helper"

describe SpaceModule do
  describe "#basic_fuel" do
    context "when the mass is 12" do
      it "requires 2 fuel" do
        space_module = SpaceModule.new(12)

        space_module.basic_fuel.should eq 2
      end
    end

    context "when the mass is 14" do
      it "requires 2 fuel" do
        space_module = SpaceModule.new(14)

        space_module.basic_fuel.should eq 2
      end
    end

    context "when the mass is 1969" do
      it "requires 654 fuel" do
        space_module = SpaceModule.new(1969)

        space_module.basic_fuel.should eq 654
      end
    end

    context "when the mass is 100756" do
      it "requires 33583 fuel" do
        space_module = SpaceModule.new(100756)

        space_module.basic_fuel.should eq 33583
      end
    end
  end

  describe "#complex_fuel" do
    context "when the mass is 14" do
      it "requires 2 fuel" do
        SpaceModule.new(14).complex_fuel.should eq 2
      end
    end

    context "when the mass is 1969" do
      it "requires 966 fuel" do
        SpaceModule.new(1969).complex_fuel.should eq 966
      end
    end

    context "when the mass is 100756" do
      it "requires 50346 fuel" do
        SpaceModule.new(100756).complex_fuel.should eq 50346
      end
    end
  end
end
