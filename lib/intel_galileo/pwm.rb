module IntelGalileo
  class Pwm

    PIN2GPIO_MAP = {
      3 => 3,
      5 => 5,
      6 => 6,
      9 => 1,
      10 => 7,
      11 => 4
    }

  	def initialize(pin)
  	  @pwm = get_pwm(pin)
      self.enable()
    end
    
    def enable
      export unless exported?
    end
    
    def disable
      unexport unless ! exported?
    end

    # period => 1ms = 1000000
    def on(percent_time_on, period = 1000000)
      write_period(period)
      write_duty_cycle(period / 100 * percent_time_on)
    end

    def off
      write_duty_cycle(0)
    end

    private

    def write_duty_cycle(duty_cycle)
      f = File.open("/sys/class/pwm/pwmchip0/pwm#{@pwm}/duty_cycle", 'w')
      f.write(duty_cycle)
      f.close
    end

    def write_period(period)
      f = File.open("/sys/class/pwm/pwmchip0/pwm#{@pwm}/period", 'w')
      f.write(period)
      f.close
    end

    def get_pwm(pin)
      PIN2GPIO_MAP[pin]
    end
    
    def exported?
      File.exists?("/sys/class/pwm/pwmchip0/pwm#{@pwm}/enable")
    end
    
    def export
      f = File.open('/sys/class/pwm/pwmchip0/export', 'w')
      f.write(@pwm)
      f.close

      f = File.open("/sys/class/pwm/pwmchip0/pwm#{@pwm}/enable", 'w')
      f.write(1)
      f.close
    end
    
    def unexport
      f = File.open('/sys/class/pwm/pwmchip0/unexport', 'w')
      f.write(@pwm)
      f.close
    end
  end
end