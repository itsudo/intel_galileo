require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/mini_test'
require 'intel_galileo'

describe IntelGalileo::DigitalPin do
  it "initializes" do
    IntelGalileo::DigitalPin.any_instance.stubs(:get_gpio).returns(Object.new)
    IntelGalileo::DigitalPin.new(0).must_be_instance_of IntelGalileo::DigitalPin
  end

  describe "when reading" do
    it "forwards read call to gpio" do
  	  gpio_mock = mock('object')
  	  gpio_mock.expects(:read).returns('read_from_gpio')
  	  IntelGalileo::DigitalPin.any_instance.stubs(:get_gpio).returns(gpio_mock)

  	  IntelGalileo::DigitalPin.new(0).read.must_equal 'read_from_gpio'
    end
  end

  describe "when writing" do
    it "forwards write call to gpio" do
  	  gpio_mock = mock('object')
  	  gpio_mock.expects(:write).with('write_from_digital_pin')
  	  IntelGalileo::DigitalPin.any_instance.stubs(:get_gpio).returns(gpio_mock)

  	  IntelGalileo::DigitalPin.new(0).write('write_from_digital_pin')
    end
  end
end
