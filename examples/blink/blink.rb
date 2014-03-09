require "../../lib/intel_galileo"

led    = IntelGalileo::DigitalPin.new(7)

while true do
  led.write(1)
  sleep(1)
  led.write(0)
  sleep(1)
end
