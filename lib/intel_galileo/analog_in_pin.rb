module IntelGalileo
  class AnalogInPin < Pin
    def initialize(pin)
      @pin = pin
      @mux_gpio = IntelGalileo::Gpio.new(IntelGalileo.analog_in_pin2mux(pin))
      @mux_gpio.ensureDrive('strong')
      @mux_gpio.ensureDirection('out')
      @mux_gpio.write(0)
      @direction = nil
    end
    
     def read
      f = File.open("/sys/bus/iio/devices/iio\:device0/in_voltage#{@pin.to_i}_raw", 'r')
      value = f.read
      f.close
      puts "Reading"
      return value
    end
  end
end
