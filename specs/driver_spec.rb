require_relative 'spec_helper'

describe "initialize" do
  it "raises an ArgumentError if vin is not 17 characters" do
    proc{
      @drivers = RideShare::Driver.new(vin: "KPH7TNNL14MDUFN")
    }.must_raise ArgumentError
  end
end

describe "Driver.all" do
  before(:each) do
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
  before(:each) do
    @driver = RideShare::Driver.find(1)
  end

  it "Returns a float." do
    @driver.average_rating(1).must_be_instance_of Float
  end

  it "Returns an average rating between 1 and 5" do
    @driver.average_rating(1).must_be :<=, 5
    @driver.average_rating(1).must_be :>=, 1
  end
end

describe "driver_trips" do
  before(:each) do
    @driver = RideShare::Driver.find(1)
    @driver_trips = @driver.driver_trips(1)
  end

  it "Must be an instance of an array." do
    @driver_trips.must_be_instance_of Array
  end

  it "Returns trip objects." do
    @driver_trips.each do |trip|
      trip.must_be_kind_of RideShare::Trip
    end
  end

  it "Returns the correct number of trips." do
    @driver_trips.length.must_equal 9
  end
end
