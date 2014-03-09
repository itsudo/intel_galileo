require "../../lib/intel_galileo"

resistor = IntelGalileo::AnalogInPin.new('A0')

puts resistor.read
