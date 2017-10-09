require_relative 'spec_helper'

describe "initialize" do

end

describe "Trip.all" do # <= Self.all method, this is what we're testing (remember this).
  before(:each) do
    # Setting up variable
    # Call method being tested
    @trips = RideShare::Trip.all
  end

  it "Returns an array of all trips." do
    @trips.must_be_kind_of Array
    @trips.each do |trip|
      trip.must_be_kind_of RideShare::Trip
    end
  end

  it "Returns the correct number of rows in CSV." do
    @trips.count.must_equal 600
  end

  it "Returns the first trip ID from the CSV file." do
    @trips.first.trip_id.must_equal 1
  end

  it "Returns the last trip ID from the CSV file." do
    @trips.last.trip_id.must_equal 600
  end
end

describe "Trip.all_driver_trips" do
  it "Returns an array of driver trips by driver_id" do
    RideShare::Trip.all_driver_trips(1).length.must_equal 9
  end
end

# it "Returns nil if no trip is found." do
#
# end



describe "Trip.all_passenger_trips" do
  it "Returns an array of passenger trips by passenger_id." do
    RideShare::Trip.all_passenger_trips(1).length.must_equal 2
  end
end

#   it "Returns an array of trips." do
#
#   end
#
#   it "Must match the driver_id." do
#
#   end
#
#   it "Must match the passenger_id." do
#
#   end
# end
#
# describe "driver" do
#   it "returns an instance of a driver." do
#
#
#   end
# end
#
# describe "passenger" do
#   it "returns an instance of rider." do
#
#   end
# end
#
# describe "Rating" do
#   it "Returns a number." do
#
#   end


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Each trip should:

# Have an ID, passenger ID, a driver ID, date, rating.
# Each rating should be within an acceptable range (1-5).

# Given a trip object, you should be able to:

# Retrieve the associated driver instance through the driver ID.
# Retrieve the associated passenger instance through the passenger ID.

# You should be able to:

# Find all trip instances for a given driver ID.
# Find all trip instances for a given passenger ID.
# Retrieve all trips from the CSV file.
