require_relative 'wheel'

class Gear
  attr_reader :chainring, :cog, :rim, :tyre

  def initialize(chainring, cog, rim, tyre)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tyre = tyre
  end
  
  def ratio
    chainring / cog.to_f
  end
  
  def wheel
    @wheel ||= Wheel.new(rim, tyre)
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches