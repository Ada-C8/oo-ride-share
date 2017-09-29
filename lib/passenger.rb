require 'csv'

module RideShare
  class Passenger

    attr_reader

    def initialize passenger_id, passenger_name, passenger_phone_number
      @passenger_id = passenger_id
      @passenger_name = passenger_name
      @passenger_phone_number = passenger_phone_number # Some numbers have extensions
    end

    def self.all
      passengers = []
      CSV.open("./support/riders.csv", 'r').each do |line|
        # This will read in CSV and process them as passenger objects.
        # Figure out how to check phone numbers here due to extensions this may be difficult.
      end
      return passengers
    end

    def self.find passenger_id
      # This will utilize self.all to create an array or array of hashes (still deciding) of passenger instances.
    end

    def trips
      # This will return the trips that the passenger has taken.
    end

    def drivers
      # Use trip method, connect with the driver_id.
      # This will need to store the driver instances and then return them.
    end
  end
end
