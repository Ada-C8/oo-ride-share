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

    def self.all_driver_trips(driver_id)
      return all.select {|trip| trip if trip.driver_id == driver_id}
    end

    def self.all_passenger_trips(passenger_id)
      return all.select {|trip| trip if trip.passenger_id == passenger_id}
    end

    def driver(driver_id)
      driver_info = Diver.find(driver_id)
      return driver_info
    end

    def passenger(passenger_id)
      passenger_info = Passenger.find(passenger_id)
      return passenger_info
    end
  end
end
