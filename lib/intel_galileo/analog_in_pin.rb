module IntelGalileo
  class AnalogInPin

    PIN2MUX_GPIO_MAP = {
      A0: 37,
      A1: 36,
      A2: 23,
      A3: 22,
      A4: 21,
      A5: 20
    }

    def initialize(pin)
      @pin = pin
      set_mux_gpio(pin)
    end
    
     def read
      f = File.open("/sys/bus/iio/devices/iio\:device0/in_voltage#{@pin.to_i}_raw", 'r')
      value = f.read
      f.close
      puts "Reading"
      return value
    end

    private
    
    def get_mux_gpio(pin)
      IntelGalileo::Gpio.new(PIN2MUX_GPIO_MAP[pin.to_sym])
    end

    def set_mux_gpio(pin)
      mux_gpio = get_mux_gpio(pin)
      mux_gpio.ensureDrive('strong')
      mux_gpio.ensureDirection('out')
      mux_gpio.write(0)
    end
  end
end
