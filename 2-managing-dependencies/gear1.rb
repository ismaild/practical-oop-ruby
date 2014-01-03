require_relative 'wheel'

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end
  
  def gear_inches
    ratio * wheel.diameter
  end
end

# Gear expects a ‘Duck’ that knows ‘diameter’
puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches