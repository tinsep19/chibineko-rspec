# Chibineko::Rspec

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/chibineko/rspec`.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chibineko-rspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chibineko-rspec

## Usage

### Automatically

1. Sign up chibineko and create test-case.
2. You write rspec like following.


```ruby spec_helper.rb

RSpec.configure do |c|
  c.include Chibineko::RSpec::Helper
end
Chibineko.download_dir = File.expand_file_name(__FILE__, '../../download')

```


```ruby

RSpec.describe "release spec"  do
  includes_chibineko("https://chibineko.jp/t/_pzoN-sPUk7xDy42Mq-4_Q")
end

```

3. Run `rspec`


`includes_chibineko` downloads csv into `Chibineko.download_dir` with named #{id}-#{timestamp}.csv. and generate examples, example-groups, in current example-group.

### Pull Request Based Process

1. `chibineko-rspec gen -o spec/chibineko_spec.rb ID_OR_URL`

ID_OR_URL expect for format https://chibineko.jp/t/_pzoN-sPUk7xDy42Mq-4_Q or _pzoN-sPUk7xDy42Mq-4_Q

`chibineko-rspec gen` generates like following.


```ruby

RSpec.describe "_pzoN-sPUk7xDy42Mq-4_Q" do
  describe "group1" do
    describe "example1" do
      it { shold be_ok }
    end
    describe "example2" do
	  it { shold be_ok}
    end
  end
end

```

2. Run `rspec`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/tinsep19/chibineko-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
