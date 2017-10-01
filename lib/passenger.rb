require 'csv'

module RideShare
  class Passenger

    attr_reader :passenger_id, :passenger_name, :passenger_phone_number

    def initialize passenger_id, passenger_name, passenger_phone_number
      @passenger_id = passenger_id
      @passenger_name = passenger_name
      @passenger_phone_number = passenger_phone_number # Some numbers have extensions
    end

    def self.all
      passengers = []
      pcsv = CSV.open("./support/riders.csv", 'r')
      pcsv.each do |passenger|
        passengers << Passenger.new(passenger[0].to_i, passenger[1], passenger[2])
      end
      return passengers
    end
    # This will read in CSV and process them as passenger objects.
  end
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Figure out how to check phone numbers here due to extensions this may be difficult.

  # def self.find passenger_id
    # This will utilize self.all to create an array or array of hashes (still deciding) of passenger instances.
  # end

  # def trips
    # This will return the trips that the passenger has taken.
  # end

  # def drivers
    # Use trip method, connect with the driver_id.
    # This will need to store the driver instances and then return them.
  # end
# end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Each passenger should:

# Have an ID, name and phone number
# Given a passenger object, you should be able to:

# Retrieve the list of trip instances that only this passenger has taken.
# Retrieve the list of all previous driver instances (through the trips functionality built above).

# You should be able to:

# Retrieve all passengers from the CSV file
# Find a specific passenger using their numeric ID
