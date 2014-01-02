class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog       = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tyre

  def initialize(rim, tyre)
    @rim = rim
    @tyre = tyre
  end

  def diameter
    rim + (tyre * 2)   
  end

  def circumference
    diameter * Math::PI
  end
end

wheel = Wheel.new(26,1.5)
puts wheel.circumference

puts Gear.new(52,11, wheel).gear_inches
puts Gear.new(52,11, wheel).ratio






