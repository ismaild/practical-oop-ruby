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

# Add a few enumerable methods
require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable 

  def initialize(parts)
    @parts = parts
  end

  def spares
    select {|part| part.needs_spare}
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

require 'ostruct'
class PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(
      config.collect {|part_config|
        create_part(part_config)})
 end

  def self.create_part(part_config)
    OpenStruct.new(
        name: part_config[0],
        description: part_config[1],
        needs_spare: part_config.fetch(2,true)
      )
  end
end

road_config = [
  ['chain', '10-speed'],
  ['tyre_size', '23'],
  ['tape', 'red']
]

road_bike_parts = PartsFactory.build(road_config)

bike = Bicycle.new(size: "m", parts: road_bike_parts)
puts bike.size
puts bike.spares

mountain_config = [
  ['chain', '10-speed'],
  ['tyre_size', '2.1'],
  ['front_shock', 'Fro', false],
  ['rear_shock', 'Rea']
]

mountain_bike_parts = PartsFactory.build(mountain_config)

mountain_bike = Bicycle.new(size: 's', parts: mountain_bike_parts)
puts mountain_bike.size
puts mountain_bike.spares

recumbent_config = [
  ['chain', '9-speed'],
  ['tyre_size', '28'],
  ['flag', 'tall and orange']
]

recumbent_bike_parts = PartsFactory.build(recumbent_config)

recumbent_bike = Bicycle.new(size: 's', parts: recumbent_bike_parts)
puts recumbent_bike.size
puts recumbent_bike.spares
