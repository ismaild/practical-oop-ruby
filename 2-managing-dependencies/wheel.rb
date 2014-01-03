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