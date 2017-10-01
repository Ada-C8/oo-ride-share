require_relative 'spec_helper'

describe "Driver.all" do # <= Method, this is what we're testing (remember this).
  before(:each) do
    # Setting up variable
    # Call method being tested
    @drivers = RideShare::Driver.all
  end

  it "Returns an array of all drivers." do
    @drivers.must_be_kind_of Array
    @drivers.each do |driver|
      driver.must_be_kind_of RideShare::Driver
    end
  end

  it "Returns the correct number of rows in CSV." do
    @drivers.count.must_equal 100
  end

  it "Returns the first driver from the CSV file." do
    @drivers.first.driver_name.must_equal "Bernardo Prosacco"
  end

  it "Returns the last driver from the CSV file." do
    @drivers.last.driver_name.must_equal "Minnie Dach"
  end
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# describe "Driver.find" do
#   it "Returns an instance of a driver." do
#
#   end

#   it "Raises an error if no driver is found." do
#
#   end
# end


# describe "Trips" do
#   it "Returns all trips associated with each driver." do
#
#   end
# end


# describe "Rating" do
#   it "Returns a float number." do
#
#   end
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
