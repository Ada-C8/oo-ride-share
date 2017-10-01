require 'csv'

module RideShare
  class Driver

    attr_reader :driver_id, :driver_name, :vin

    def initialize driver_id, driver_name, vin
      @driver_id = driver_id
      @driver_name = driver_name
      @vin = vin # Must be 17 characters long.
    end

    def self.all
      drivers = []
      dcsv = CSV.open("./support/drivers.csv", 'r')
      dcsv.each do |driver|
        drivers << Driver.new(driver[0].to_i, driver[1], driver[2])
      end
      return drivers
    end
    # This will read in CSV and process them as driver objects.
  end
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# def self.find passenger_id
  # This will utilize self.all to create an array or array of hashes (still deciding) of passenger instances.
# end

# def trips
#  This will return the trips that the driver has  completed, through the trip.rb file.
# end
#
# def rating
#   # Provides average rating using the trips method.
# end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Driver Necessities

# Each driver should:

# Have an ID, name, and vehicle identification number.
# Each vehicle identification number should be a specific length (17 digits) to ensure it is a valid vehicle identification number.

# Given a driver object, you should be able to:

# Retrieve the list of trip instances that only this driver has taken.
# Retrieve an average rating for that driver based on all trips taken.

# You should be able to:

# Retrieve all drivers from the CSV file.
# Find a specific driver using their numeric ID.
