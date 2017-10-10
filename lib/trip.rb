require 'csv'

module RideShare
  class Trip

    attr_reader :trip_id, :passenger_id, :driver_id, :date, :rating

    def initialize trip_id, driver_id, passenger_id, date, rating
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
        trips << Trip.new(trip[0].to_i, trip[1].to_i, trip[2].to_i, trip[3], trip[4].to_f)
      end
      return trips
    end
    # This will read in CSV and process them as trip instances.

    def self.all_driver_trips(driver_id)
      # driver_trips = []
      return all.select {|trip| trip if trip.driver_id == driver_id}
      # return driver_trips
      # driver_trips = []
      # all.each do |trip|
      #   if trip.driver_id == driver_id
      #     driver_trips << trip
      #   end
      # end
      # return driver_trips
    end

    def self.all_passenger_trips(passenger_id)
      return all.select {|trip| trip if trip.passenger_id == passenger_id}


      # passenger_trips = []
      # all.each do |trip|
      #   if trip.passenger_id == passenger_id
      #     passenger_trips << trip
      #   end
      # end
      # return passenger_trips
    end
  end
end

p RideShare::Trip.all_passenger_trips(1)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# So for a passenger get a list of all the drivers that passenger has had.
#
# So they’ll need to get a list of trips and then find each driver for each trip.

# p all.select{ |trip| trip.driver_id  }


# def self.all_passenger_trips(passenger_id)
#   all
#   RideShare::Trip.all.select{ |trip| trip.passenger_id == id }
# end
# Select enumerable - https://ruby-doc.org/core-2.4.2/Enumerable.html#method-i-select

# def driver
#   driver_info = Driver.find @driver_id
#   return driver_info
#   # Using .find, this will return associated instances for each driver ID.
# end
#
# def passenger
#   return Passenger.find @passenger_id
#   # Using .find, this will return associated instances for each passenger ID.
# end




# Each trip should:

# Have an ID, passenger ID, a driver ID, date, rating. - Instance variables completed.
# Each rating should be within an acceptable range (1-5).

# Given a trip object, you should be able to:

# Retrieve the associated driver instance through the driver ID.
# Retrieve the associated passenger instance through the passenger ID.

# You should be able to:

# Find all trip instances for a given driver ID.
# Find all trip instances for a given passenger ID.
# Retrieve all trips from the CSV file. <--- Done
