require 'csv'

module RideShare
  class Trip

    attr_reader :trip_id, :passenger_id, :driver_id, :date, :rating

    def initialize trip_id, passenger_id, driver_id, date, rating
      @trip_id = trip_id
      @passenger_id = passenger_id
      @driver_id = driver_id
      @date = date
      @rating = rating
    end

    def self.all
      trips = []
      tcsv = CSV.open("./support/trips.csv", 'r')
      tcsv.each do |trip|
        trips << Trip.new(trip[0].to_i, trip[1].to_i, trip[2].to_i, trip[3], trip[4])
      end
      return trips
    end
    # This will read in CSV and process them as trip instances.
  end
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#   def self.find_driver_trips
#     # Using the self.all method this will return all trip instances for the driver.
#   end
#
#   def self.find_passenger_trips
#     # Using the self.all method this will return all trip instances for the passenger.
#   end
#
#   def driver
#     # Using .find, this will return associated instances for each driver ID.
#   end
#
#   def passenger
#     # Using .find, this will return associated instances for each passenger ID.
#   end
# end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Each trip should:
#
# Have an ID, passenger ID, a driver ID, date, rating.
# Each rating should be within an acceptable range (1-5).

# Given a trip object, you should be able to:

# Retrieve the associated driver instance through the driver ID.
# Retrieve the associated passenger instance through the passenger ID.

# You should be able to:

# Find all trip instances for a given driver ID.
# Find all trip instances for a given passenger ID.
# Retrieve all trips from the CSV file.
