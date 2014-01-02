class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect {|wheel| wheel.rim + (wheel.tyre * 2)}
  end

  Wheel = Struct.new(:rim, :tyre)
  def wheelify(data)
    # 0 is rim, 1 is tire
    data.collect {|cell| Wheel.new(cell[0], cell[1])}
  end
end

data = [[622, 20], [622, 23], [559, 30], [559, 40]]

puts RevealingReferences.new(data).diameters
