# IntelGalileo

Gem for interacting with Intel Galileo board

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

See `/examples`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
