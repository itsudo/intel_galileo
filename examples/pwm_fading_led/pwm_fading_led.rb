require File.dirname(File.absolute_path(__FILE__)) + "/../../lib/intel_galileo"

led = IntelGalileo::Pwm.new(3)

0.upto(100).each do |percent_time_on|
  led.on(percent_time_on)
  sleep(0.005)
end

100.downto(0).each do |percent_time_on|
  led.on(percent_time_on)
  sleep(0.005)
end