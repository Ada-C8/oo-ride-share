require_relative 'spec_helper'

describe "initialize" do
  it "raises an ArgumentError if vin is not 17 characters" do
    proc{
      @drivers = RideShare::Driver.new(vin: "KPH7TNNL14MDUFN")
    }.must_raise ArgumentError
  end

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

    it "Returns the first driver name, id, and vin from the CSV file." do
      @drivers.first.driver_name.must_equal "Bernardo Prosacco"
      @drivers.first.driver_id.must_equal 1
      @drivers.first.vin.must_equal "WBWSS52P9NEYLVDE9"
    end

    it "Returns the last driver name, id, and vin from the CSV file." do
      @drivers.last.driver_name.must_equal "Minnie Dach"
      @drivers.last.driver_id.must_equal 100
      @drivers.last.vin.must_equal "XF9Z0ST7X18WD41HT"
    end
  end

  describe "Driver.find" do # <= Method, this is what we're testing (remember this).
    it "Returns an instance of a driver." do
      drivers = RideShare::Driver.find(8)
      drivers.must_be_instance_of RideShare::Driver
      drivers.driver_id.must_equal 8
      drivers.driver_name.must_equal "Shania Olson"
      drivers.vin.must_equal "KPH7TNNL14MDUFNF8"
    end

    it "Raises an error if no driver is found." do

    end

    # describe "Trips" do
    #   it "Returns all trips associated with each driver." do
    #
    #   end
    #
    #   it "Returns an empty Array if no trips are found." do
    #
    #   end
    # end


    # describe "average_rating" do
    #   it "Returns a number." do
    #     drivers = RideShare::Driver.find(8)
    #     drivers.average_rating.must_be_instance_of Float
    #     drivers.average_rating.must_be :<=, 5
    #     drivers.average_rating.must_be :>=, 1
    #   end
    # end
  end
end

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
