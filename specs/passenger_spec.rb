require_relative 'spec_helper'

describe "Passenger.all" do
  before(:each) do
    @passengers = RideShare::Passenger.all
  end

  it "Returns an array of all passengers." do
    @passengers.must_be_kind_of Array
    @passengers.each do |passenger|
      passenger.must_be_kind_of RideShare::Passenger
    end
  end

  it "Returns the correct number of rows in CSV." do
    @passengers.count.must_equal 300
  end

  it "Returns the first passenger from the CSV file." do
    @passengers.first.passenger_name.must_equal "Nina Hintz Sr."
    @passengers.first.passenger_id.must_equal 1
    @passengers.first.passenger_phone_number.must_equal "560.815.3059"
  end

  it "Returns the last passenger from the CSV file." do
    @passengers.last.passenger_name.must_equal "Miss Isom Gleason"
    @passengers.last.passenger_id.must_equal 300
    @passengers.last.passenger_phone_number.must_equal "791-114-8423 x70188"
  end
end

describe "Passenger.find" do
  it "Returns an instance of a passenger." do
    passengers = RideShare::Passenger.find(181)
    passengers.must_be_instance_of RideShare::Passenger
    passengers.passenger_id.must_equal 181
    passengers.passenger_name.must_equal "Talia Kerluke"
    passengers.passenger_phone_number.must_equal "947.490.0539"
  end
end

describe "Passenger.driver_list" do
  before(:each) do
    @passenger = RideShare::Passenger.find(1)
    @driver_list = RideShare::Passenger.driver_list(1)
  end

  it "Returns an array." do
    @driver_list.must_be_instance_of Array
  end

  it "Returns the list of all previous driver instances." do
    @driver_list.length.must_equal 2
  end
end

describe "passenger_trips" do
  before(:each) do
    @passenger = RideShare::Passenger.find(1)
    @passenger_trips = @passenger.passenger_trips(1)
  end

  it "Returns an array." do
    @passenger_trips.must_be_instance_of Array
  end

  it "Returns trip objects." do
    @passenger_trips.each do |trip|
      trip.must_be_kind_of RideShare::Trip
    end
  end

  it "Returns the correct number of trips." do
    @passenger_trips.length.must_equal 2
  end
end
