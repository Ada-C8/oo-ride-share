require_relative 'spec_helper'

describe "Passenger.all" do # <= Method, this is what we're testing (remember this).
  before(:each) do
    # Setting up variable
    # Call method being tested
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

describe "Passenger.find" do # <= Method, this is what we're testing (remember this).
  it "Returns an instance of a passenger." do
    passengers = RideShare::Passenger.find(181)
    passengers.must_be_instance_of RideShare::Passenger
    passengers.passenger_id.must_equal 181
    passengers.passenger_name.must_equal "Talia Kerluke"
    passengers.passenger_phone_number.must_equal "947.490.0539"
  end

  # it "Raises an error if no passenger is found." do
  #
  # end
end

# describe "trips" do
#   it "Returns all trips associated with each driver." do
#
#   end
#
#   it "Returns an array of trips." do
#
#   end
# end
#
# describe "drivers" do
#   it "Returns the list of all previous driver instances." do
#
#   end
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
