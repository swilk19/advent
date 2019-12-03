class SpaceModule
  getter mass

  def initialize(mass : (String | Int32))
    @mass = Int32.new(mass)
  end

  def mass=(mass : (String | Int32))
    @mass = Int32.new(mass)
  end

  def basic_fuel : Int32
    Int32.new((@mass / 3).floor - 2)
  end

  def complex_fuel : Int32
    fuel = ->(mass : Int32) do
      return 0 unless mass > 0

      fuel_needed = SpaceModule.new(mass).complex_fuel
      
      return 0 if fuel_needed < 0
      fuel_needed
    end

    result = basic_fuel + fuel.call(basic_fuel)
  end
end
