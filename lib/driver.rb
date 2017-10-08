require 'csv'

module RideShare
  class Driver

    attr_reader :driver_id, :driver_name, :vin

    def initialize driver_id, driver_name, vin
      @driver_id = driver_id
      @driver_name = driver_name
      @vin = vin # Must be 17 characters long - String.

      raise ArgumentError.new("VIN is invalid.") if vin.length != 17
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

    def self.find(driver_id)
      drivers = RideShare::Driver.all

      drivers.each do |driver|
        if driver.driver_id == driver_id
          return driver
        end
      end
    end

    # def trips
    #   return Trip.find_driver_trips @driver_id
    #   #  This will return the trips that the driver has  completed, through the trip.rb file.
    # end
    #
    # def average_rating
    #   total = 0.0
    #   trips = self.trips
    #   trip_count = trips.length
    #   trips.each do |trip|
    #     total += trip.rating
    #   end
    #   return "#{(total / trip_count).round(2)}"
    # end
  end
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
