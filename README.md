# IntelGalileo

[![Build Status](https://travis-ci.org/itsudo/intel_galileo.png)](https://travis-ci.org/itsudo/intel_galileo)

Gem for interacting with Intel Galileo board. For now this ruby library supports Digital In/Out Pins (0 - 13) and Analog In Pins (A0-A5) only.

## Ruby installation on Galileo

Some images have devtools installed on board by default - in that case compile [ruby from source](https://www.ruby-lang.org/en/downloads/).

If you don't have gcc on board, follow [custom image installation](http://www.itsudo.com/galileo/2014/03/03/setting-up-development-environment-for-galileo.html) and [customization](http://www.itsudo.com/galileo/yocto/ruby/2014/03/05/customizing-what-goes-onto-yocto-image.html) posts.

## Installation

If you have ruby installed, add this line to your application's Gemfile:

    gem 'intel_galileo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install intel_galileo

## Usage

Digital In:

  led    = IntelGalileo::DigitalPin.new(7)
  led.write(1) # Write 0 or 1
  
Digital Out:

  button = IntelGalileo::DigitalPin.new(5)
  puts button.read # returns 0 or 1
  
Analog In:
  
  potentiometer = IntelGalileo::AnalogInPin.new('A0')
  puts potentiometer.read # returns value between 0 and 4095

For more examples please see `/examples` folder

## TODO

  * tests
  * Support for PWM

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
