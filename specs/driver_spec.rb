require_relative 'spec_helper'

  describe "Driver.all" do # <= Method, this is what we're testing (remember this).
    before(:each) do
      # Setting up variable
      # Call method being tested
      @drivers = RideShare::Driver.all
    end

    it "Returns an array of all drivers" do
      @drivers.must_be_kind_of Array
      @drivers.each do |driver|
        driver.must_be_kind_of Rideshare::Driver
      end
    end

    it "Returns the correct number of rows in CSV" do
      @drivers.count.must_equal 100
    end

    it "Returns the first driver from the CSV file" do
      driver = @drivers.last
    end

    it "Returns the last driver from the CSV file" do
      driver = @drivers.last
    end
  end
end

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
