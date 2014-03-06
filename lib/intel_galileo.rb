require File.dirname(__FILE__) + "/intel_galileo/version"
require File.dirname(__FILE__) + "/intel_galileo/pin"

module IntelGalileo
  PINS  = [  0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13]
  GPIO  = ["50","51","32","18","28","17","24","27","26","19","16","25","38","39"]
  
  def self.pin2gpio(pin)
    GPIO[PINS.index(pin)]
  end
end
