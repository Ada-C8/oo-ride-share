require 'csv'

module RideShare
  class Trip

    attr_reader

    def initialize trip_id, passenger_id, driver_id, date, rating
      @trip_id = trip_id
      @passenger_id = passenger_id
      @driver_id = driver_id
      @date = date
      @rating = rating
    end

    def self.all
      trips = []
      CSV.open("./support/trips.csv", 'r').each do |line|
        # This will read in CSV and process them as trip instances.
      end
      return trips
    end

    def self.find_driver_trips
      # Using the self.all method this will return all trip instances for the driver.
    end

    def self.find_passenger_trips
      # Using the self.all method this will return all trip instances for the passenger.
    end

    def driver
      # Using .find, this will return associated instances for each driver ID.
    end

    def passenger
      # Using .find, this will return associated instances for each passenger ID.
    end
  end
end
