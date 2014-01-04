class Trip
  attr_reader :bicycles, :customers, :vechile

  def initialize(bicycles, customers, vechile)
      @bicycles = bicycles
      @customers = customers
      @vechile = vechile
  end
  
  def prepare(preparers)
    # much better
    preparers.each do |preparer|
      preparer.prepare_trip(self)
    end
  end
end

#The prepares are now a 'duck', and respond to prepare_trip
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each { |bicycle| prepare_bicycle(bicycle)  }
  end

  def prepare_trip(trip)
    puts "preparing #{trip.bicycle}"
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customers)
    puts "buying food for #{customers}"
  end
end

class Driver
  def prepare_trip(trip)
    fill_up_petrol(trip.vechile)
    fill_water_tank(trip.vechile)  
  end

  def fill_up_petrol(vechile)
    puts "fuelling up #{vechile}"
  end

  def fill_water_tank(vechile)
    puts "filling up water tank for #{vechile}"
  end
end

mechanic = Mechanic.new
trip_coordinator = TripCoordinator.new
driver = Driver.new
trip = Trip.new(['bicycle1','bicycle2'], 'customers', 'Elenor')
trip.prepare([mechanic, trip_coordinator, driver])
