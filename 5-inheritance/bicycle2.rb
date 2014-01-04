class Bicycle
  attr_reader :style, :size, :tape_colour, :front_shock, :rear_shock

  def initialize(args)
    @size = args[:size]
    @tape_colour = args[:tape_colour]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end
  
  # If statement, indicates there are two classes here
  # good for refactoring using inheritance
  def spares
    if style == :road
      # size in mm
      {chain: '10-speed', tyre_size: '23', tape_colour: tape_colour}
    else
      # inches
      {chain: '10-speed', tyre_size: '2.1', rear_shock: rear_shock}
    end
  end
end

bike = Bicycle.new(style: :mountain, size: "s", 
                  front_shock: 'fro', rear_shock: 'rea')
puts bike.size
puts bike.spares