class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts
  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select {|part| part.needs_spare}
  end

  # implement size
  def size
    parts.size
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end

  def to_s
    "#{name}: #{description}"
  end
end

chain = Part.new(name: 'chain', description: '10-speed')

road_tyre = Part.new(name: 'tyre_size', description: '23')

tape = Part.new(name: 'tape', description: 'red')

road_bike_parts = Parts.new([chain, road_tyre, tape])

bike = Bicycle.new(size: "m", parts: road_bike_parts)
puts bike.size
puts bike.spares
puts bike.spares.size
puts bike.parts.size


mountain_tyre = Part.new(name: 'tyre_size', description: '2.1')

rear_shock = Part.new(name: 'rear_shock', description: 'Rea')

front_shock = Part.new(name: 'front_shock', description: 'Fron', 
                      needs_spare: false)

mountain_bike_parts = Parts.new([chain, mountain_tyre, front_shock, 
                                rear_shock])

mountain_bike = Bicycle.new(size: 's', parts: mountain_bike_parts)
puts mountain_bike.size
puts mountain_bike.spares
puts mountain_bike.spares.size
puts mountain_bike.parts.size
