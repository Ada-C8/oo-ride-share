require 'csv'
require_relative 'trip'

module RideShare
  class Passenger

    attr_reader :passenger_id, :passenger_name, :passenger_phone_number

    def initialize passenger_id, passenger_name, passenger_phone_number
      @passenger_id = passenger_id
      @passenger_name = passenger_name
      @passenger_phone_number = passenger_phone_number
    end

    def self.all
      passengers = []
      pcsv = CSV.open("./support/riders.csv", 'r')
      pcsv.each do |passenger|
        passengers << Passenger.new(passenger[0].to_i, passenger[1], passenger[2])
      end
      return passengers
    end

    def self.find(passenger_id)
      passengers = RideShare::Passenger.all

      passengers.each do |passenger|
        if passenger.passenger_id == passenger_id
          return passenger
        end
      end
    end

    def self.driver_list(passenger_id)
      all_drivers = []
      passenger_trips = Trip.all_passenger_trips(passenger_id)
      passenger_trips.each do |trip|
        all_drivers << trip.driver_id
      end
      all_driver_objects = all_drivers.map {|id| Driver.find(id)}
      return all_driver_objects
    end

    def passenger_trips(passenger_id)
      return Trip.all_passenger_trips(passenger_id)
    end
  end
end
