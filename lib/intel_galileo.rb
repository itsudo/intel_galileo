require File.dirname(__FILE__) + "/intel_galileo/version"
require File.dirname(__FILE__) + "/intel_galileo/gpio"
require File.dirname(__FILE__) + "/intel_galileo/pin"
require File.dirname(__FILE__) + "/intel_galileo/analog_in_pin"
require File.dirname(__FILE__) + "/intel_galileo/digital_pin"
require File.dirname(__FILE__) + "/intel_galileo/pwm"

module IntelGalileo
  DIGITAL_PINS  = [  0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13]
  DIGITAL_GPIOS = ["50","51","32","18","28","17","24","27","26","19","16","25","38","39"]
  
  ANALOG_IN_PINS      = ["A0","A1","A2","A3","A4","A5"]
  ANALOG_IN_MUX_GPIOS = ["37","36","23","22","21","20"]
  
  PWM_GPIO_PINS = { 3 => 3, 5 => 5, 6 => 6, 9 => 1, 10 => 7, 11 => 4 }

  def self.digital_pin2gpio(pin)
    DIGITAL_GPIOS[DIGITAL_PINS.index(pin)]
  end
  
  def self.analog_in_pin2mux(pin)
    ANALOG_IN_MUX_GPIOS[ANALOG_IN_PINS.index(pin)]
  end

  def self.pin2pwm(pin)
    PWM_GPIO_PINS[pin]
  end
end
