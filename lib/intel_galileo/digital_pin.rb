module IntelGalileo
  class DigitalPin

    PIN2GPIO_MAP = {
      0  => 50,
      1  => 51,
      2  => 32,
      3  => 18,
      4  => 28,
      5  => 17,
      6  => 24,
      7  => 27,
      8  => 26,
      9  => 19,
      10 => 16,
      11 => 25,
      12 => 38,
      13 => 39
    }

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
      IntelGalileo::Gpio.new(PIN2GPIO_MAP[pin])
    end
  end
end
