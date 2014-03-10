require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/mini_test'
require 'fakefs/safe'
require 'intel_galileo'

describe IntelGalileo::AnalogInPin do
  it "initializes" do
  	IntelGalileo::AnalogInPin.any_instance.stubs(:set_mux_gpio)

    IntelGalileo::AnalogInPin.new('A0').must_be_instance_of IntelGalileo::AnalogInPin
  end
  
  describe "when reading" do
    it "reads value from /sys/bus/iio/devices/iio\:device0/in_voltage0_raw file" do	
	  FakeFS do
        FileUtils.mkdir_p("/sys/bus/iio/devices/iio\:device0/")
        File.open("/sys/bus/iio/devices/iio\:device0/in_voltage0_raw", "w") do |f|
          f.print("1033")
        end

  	    IntelGalileo::AnalogInPin.any_instance.stubs(:set_mux_gpio)

        IntelGalileo::AnalogInPin.new('A0').read.must_equal "1033"
	  end
    end
  end

  describe "when set_mux_gpio" do
    it "sets necessary parameters of gpio" do
      gpio_mock = mock('object')
  	  gpio_mock.expects(:ensureDrive).with('strong')
  	  gpio_mock.expects(:ensureDirection).with('out')
  	  gpio_mock.expects(:write).with(0)

  	  IntelGalileo::AnalogInPin.any_instance.stubs(:get_mux_gpio).returns(gpio_mock)

  	  IntelGalileo::AnalogInPin.new('A0')
    end
  end
end
