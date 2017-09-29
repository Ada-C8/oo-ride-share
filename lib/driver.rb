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
      dcsv = CSV.open("./support/drivers.csv", 'r').each do |line|
        dcsv.each do |driver|
          drivers << Driver.new(driver[0].to_i, driver[1], driver[2])
        end
      end
      return drivers
    end

    def self.find driver_id
      all_drivers = Driver.all
      return all_drivers.find
      # This will utilize self.all to create an array or array of hashes (still deciding) of driver instances.
    end

    def trips
      # This will return the trips that the driver has completed.
    end

    def rating
      # Provides average rating using the trips method.
    end
  end
end
