require File.dirname(File.absolute_path(__FILE__)) + "/../../lib/intel_galileo"

resistor = IntelGalileo::AnalogInPin.new('A0')

puts resistor.read
