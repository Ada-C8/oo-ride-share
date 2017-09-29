require 'csv'

module RideShare
  class Driver

    attr_reader

    def initialize driver_id, driver_name, vin
      @driver_id = driver_id
      @driver_name = driver_name
      @vin = vin # Must be 17 characters long.
    end

    def self.all
      drivers = []
      CSV.open("./support/drvers.csv", 'r').each do |line|

        # This will read in CSV and process them as driver objects.
      end
    end
    

    def self.find driver_id
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
