require 'csv'
require_relative 'trip'

module RideShare
  class Driver

    attr_reader :driver_id, :driver_name, :vin

    def initialize driver_id, driver_name, vin
      @driver_id = driver_id
      @driver_name = driver_name
      @vin = vin

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

    def self.find(driver_id)
      drivers = RideShare::Driver.all
      drivers.each do |driver|
        if driver.driver_id == driver_id
          return driver
        end
      end
    end

    def average_rating(driver_id)
      driver_trips = driver_trips(driver_id)
      return (driver_trips.map(&:rating).inject(0, &:+)/driver_trips.length).round(2)
    end

    def driver_trips(driver_id)
      return Trip.all_driver_trips(driver_id)
    end
  end
end
