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
  attr_reader :chain, :tyre_size

  def initialize(args={})
    @chain = args[:chain] || default_chain
    @tyre_size = args[:tyre_size] || default_tyre_size
    post_initialize(args)
  end

  # Provide a hook, so logic of initialize central in parent
  def post_initialize
    nil  
  end

  def default_chain
    '10-speed'
  end

  def default_tyre_size
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end

  def spares
    { chain: default_chain, tyre_size: default_tyre_size }.merge(local_spares)
  end

  def local_spares
    {}
  end
end

class RoadBikeParts < Parts
  attr_reader :tape_colour

  def post_initialize(args)
    @tape_colour = args[:tape_colour]
  end
  
  def default_tyre_size
    '23'
  end

  def local_spares
    {tape_colour: tape_colour}
  end
end

bike = Bicycle.new(size: "m", parts: RoadBikeParts.new(tape_color: 'red'))
puts bike.size
puts bike.spares

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end
  
  def default_tyre_size
    '2.1'
  end

  def local_spares
    {rear_shock: rear_shock}
  end
end

mountain_bike = Bicycle.new(size: 's', parts: MountainBikeParts.new(front_shock: 'Fro', 
                                rear_shock: 'Rea'))
puts mountain_bike.size
puts mountain_bike.spares