class Trip
  attr_reader :bicycles, :customers, :vechile

  def initialize(bicycles, customers, vechile)
      @bicycles = bicycles
      @customers = customers
      @vechile = vechile
  end
  
  def prepare(preparers)
    # super bad code, highly coupled
    preparers.each do |preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.fill_up_petrol(vechile)
        preparer.fill_water_tank(vechile)
      end
    end    
  end
end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle)  }
  end

  def prepare_bicycle(bicycle)
    puts "preparing #{bicycle}"
  end
end

class TripCoordinator
  def buy_food(customers)
    puts "buying food for #{customers}"
  end
end

class Driver
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
