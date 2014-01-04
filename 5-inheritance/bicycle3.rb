class Bicycle
  attr_reader :size, :tape_colour

  def initialize(args)
    @size = args[:size]
    @tape_colour = args[:tape_colour]
  end
  
  def spares
    {chain: '10-speed', tyre_size: '23', tape_colour: tape_colour}
  end
end

bike = Bicycle.new(size: "m", tape_colour: 'red')
puts bike.size
puts bike.spares

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end
  
  def spares
    super.merge(rear_shock: rear_shock)
  end
end

# now we are inheriting behavior that is not needed, since road
# is part of Bicycle
mountain_bike = MountainBike.new(size: 's', front_shock: 'Fro', 
                                rear_shock: 'Rea')
puts mountain_bike.size
puts mountain_bike.spares