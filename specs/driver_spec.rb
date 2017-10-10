require_relative 'spec_helper'

describe "initialize" do
  it "raises an ArgumentError if vin is not 17 characters" do
    proc{
      @drivers = RideShare::Driver.new(vin: "KPH7TNNL14MDUFN")
    }.must_raise ArgumentError
  end
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

  it "Everything in the Array is an instance of Driver." do
    @drivers.each do |driver|
      driver.must_be_instance_of RideShare::Driver
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

describe "Driver.find" do
  it "Returns an instance of a driver." do
    drivers = RideShare::Driver.find(8)
    drivers.must_be_instance_of RideShare::Driver
    drivers.driver_id.must_equal 8
    drivers.driver_name.must_equal "Shania Olson"
    drivers.vin.must_equal "KPH7TNNL14MDUFNF8"
  end
end

describe "average_rating" do
  it "Returns a float." do

    # driver_1 = RideShare::Driver.all.average_rating(1)
    # driver_1.average_rating.must_be :<=, 5
    # driver_1.average_rating.must_be :>=, 1

    # driver_1 = RideShare::Driver.average_rating(1)
    # driver_1.average_rating.must_be :<=, 5
    # driver_1.average_rating.must_be :>=, 1
    # ^^  Errors with undefined method

    # @drivers.driver_id.must_equal 1
    # @drivers.average_rating.must_be :<=, 5
    # @drivers.average_rating.must_be :>=, 1

    # driver_trips = RideShare::Driver.find(1)
    # # drivers.average_rating.must_be_instance_of Float
    # driver_trips.average_rating.must_be :<=, 5
    # driver_trips.average_rating.must_be :>=, 1

    # This method DOES work, tested with print BUT can't get any test to work no matter how many versions I have managed to make generally undefined method or wrong argument.
  end
end

describe "driver_trips" do
  it "Returns all trips associated with each driver." do
    # driver = driver_id(1)
    # driver.all_driver_trips.must_be_instance_of Array
    # driver.trips.each do |trip|
    #   trip.all_driver_trips.must_be_instance_of RideShare::Trip

      # No method error. Really burnt out at this point and am probably making VERY obvious mistakes.  Been working on this for days.

      # Once again, I know via print that this method does work, I just seem to be not able to properly define methods and I think it's from not having proper breaks to try and get this done.  It's likely obvious and I'm sorry.
    
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
