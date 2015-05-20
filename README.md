# Chibineko::RSpec

[![Build Status](https://travis-ci.org/tinsep19/chibineko-rspec.svg?branch=master)](https://travis-ci.org/tinsep19/chibineko-rspec)
[![Code Climate](https://codeclimate.com/github/tinsep19/chibineko-rspec/badges/gpa.svg)](https://codeclimate.com/github/tinsep19/chibineko-rspec)
[![Coverage Status](https://coveralls.io/repos/tinsep19/chibineko-rspec/badge.svg)](https://coveralls.io/r/tinsep19/chibineko-rspec)



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chibineko-rspec'
```

And then execute:

    $ bundle install


Or install it yourself as:

    $ gem install chibineko-rspec

## Usage

### Set up

add following in spec_helper.rb

```

require "chibineko/rspec"
RSpec.configure do |c|
  c.extend Chibineko::RSpec::Helper
end

```

### include_chibineko.

1. Sign up chibineko and create test-case.
2. You write rspec like following and run `rspec`

```

RSpec.describe "release spec"  do
  includes_chibineko("https://chibineko.jp/t/_pzoN-sPUk7xDy42Mq-4_Q")
end

```


`includes_chibineko` will download csv and generate examples in current example-group.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/tinsep19/chibineko-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
