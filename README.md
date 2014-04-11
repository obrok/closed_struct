# ClosedStruct

[![Build Status](https://travis-ci.org/obrok/closed_struct.png?branch=master)](https://travis-ci.org/obrok/closed_struct)

ClosedStructs work like OpenStruct, with the exception of being immutable and not responding to methods which haven't been listed in the input hash

## Installation

Add this line to your application's Gemfile:

    gem 'closed_struct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install closed_struct

## Usage

```ruby

ClosedStruct.new(:a => :b).a # => :b
ClosedStruct.new("a" => :b).a # => :b
ClosedStruct.new(:a => :b).c # => raises NoMethodError
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/closed_struct/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
