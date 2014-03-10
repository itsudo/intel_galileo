module IntelGalileo
  class DigitalPin < Pin
    attr_reader :gpio
    def initialize(pin)
      @gpio = get_gpio(pin)
      @direction = nil
    end
    
     def read
      @gpio.read()
    end
    
    def write(value)
      @gpio.write(value)
    end
    
    private

    def get_gpio(pin)
      IntelGalileo::Gpio.new(IntelGalileo.digital_pin2gpio(pin))
    end
  end
end
