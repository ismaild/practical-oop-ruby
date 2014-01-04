class Bicycle
  attr_reader :size, :chain, :tyre_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tyre_size = args[:tyre_size] || default_tyre_size
  end

  def default_chain
    '10-speed'
  end

  def default_tyre_size
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end

  def spares
    { chain: default_chain, tyre_size: default_tyre_size }
  end
end

class RoadBike < Bicycle
  attr_reader :tape_colour

  def initialize(args)
    @tape_colour = args[:tape_colour]
    super(args)
  end
  
  def default_tyre_size
    '23'
  end

  def spares
    super.merge({tape_colour: tape_colour})
  end
end

bike = RoadBike.new(size: "m", tape_colour: 'red')
puts bike.size
puts bike.spares

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end
  
  def default_tyre_size
    '2.1'
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
end

mountain_bike = MountainBike.new(size: 's', front_shock: 'Fro', 
                                rear_shock: 'Rea')
puts mountain_bike.size
puts mountain_bike.spares