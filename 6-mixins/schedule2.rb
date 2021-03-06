
module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  def lead_days
    1
  end
end

class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} is not scheduled \n" +
          "between #{start_date} and #{end_date}"
  end
end


class Bicycle
  include Schedulable
  
  def lead_days
    1
  end
end

require 'date'

start_day = Date.parse("2012/03/20")
end_day = Date.parse("2012/03/27")

bike = Bicycle.new
bike.schedulable?(start_day, end_day)

class Vechile
  include Schedulable
  def lead_days
    3
  end
end

vechile = Vechile.new
vechile.schedulable?(start_day, end_day)

class Mechanic
  include Schedulable
  def lead_days
    4
  end
end

mech = Mechanic.new
mech.schedulable?(start_day, end_day)