class Gear
  attr_reader :chainring, :cog, :rim, :tyre

  def initialize(chainring, cog, rim, tyre)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tyre      = tyre
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * (rim + (tyre * 2))
  end
end

puts Gear.new(52,11,26,1.5).gear_inches
puts Gear.new(52,11,24,1.25).gear_inches

puts "old calls"
puts Gear.new(52, 11).ratio
puts Gear.new(30, 27).ratio