class Trip
  attr_reader :bicycles, :customers, :vechile

  def initialize(bicycles, customers, vechile)
      @bicycles = bicycles
      @customers = customers
      @vechile = vechile
  end
  
  # this 'mechanic' argument could be of any class
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)    
  end
end

# if you happen to pass an instance of *this* class, it works
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle)  }
  end

  def prepare_bicycle(bicycle)
    puts "preparing #{bicycle}"
  end
end

mechanic = Mechanic.new
trip = Trip.new(['bicycle1','bicycle2'], 'customers', 'Bus')
trip.prepare(mechanic)
