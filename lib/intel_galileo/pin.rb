module IntelGalileo
  class Pin
    def initialize(pin)
      @gpio = IntelGalileo.pin2gpio(pin)
      @direction = nil
      self.enable()
    end
    
    def enable
      export unless exported?
    end
    
    def read
      ensureDirection('in')
      f = File.open("/sys/class/gpio/gpio#{@gpio}/value", 'r')
      value = f.read
      f.close
      puts "Reading"
      return value
    end
    
    def write(value)
      ensureDirection('out')
      f = File.open("/sys/class/gpio/gpio#{@gpio}/value", 'w')
      f.write(value)
      f.close
      puts "Writing #{value}"
    end
    
    def ensureDirection(direction)
      if @direction != direction
        setDirection(direction)
      end
    end
    
    def disable
      unexport unless ! exported?
    end
    
    private
    
    def setDirection(direction)
      @direction = direction
      f = File.open("/sys/class/gpio/gpio#{@gpio}/direction", 'w')
      f.write(direction)
      f.close
      puts "Setting direction to #{direction}"
    end
    
    def exported?
      File.exists?("/sys/class/gpio/gpio#{@gpio}/value")
    end
    
    def export
      f = File.open('/sys/class/gpio/export', 'w')
      f.write(@gpio)
      f.close
    end
    
    def unexport
      f = File.open('/sys/class/gpio/unexport', 'w')
      f.write(@gpio)
      f.close
    end
  end
end
