module IntelGalileo
  class DigitalPin < Pin
    def initialize(pin)
      @gpio = IntelGalileo::Gpio.new(IntelGalileo.digital_pin2gpio(pin))
      @direction = nil
    end
    
     def read
      @gpio.read()
    end
    
    def write(value)
      @gpio.write(value)
    end
  end
end
