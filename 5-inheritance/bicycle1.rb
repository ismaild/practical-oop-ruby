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