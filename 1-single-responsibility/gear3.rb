class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tyre)
    @chainring = chainring
    @cog       = cog
    @wheel = Wheel.new(rim, tyre)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tyre) do
    def diameter
      rim + (tyre * 2)
    end
  end
end

puts Gear.new(52,11,26,1.5).gear_inches
puts Gear.new(52,11,24,1.25).gear_inches