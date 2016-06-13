ENV Hash Configuration
======================
ENV Hash Configuration is a trivial gem that makes it easy to transmogrify ENV into a configuration object suitable for
application consumption.

Why use environment variables for configuration? [The Twelve-Factor App](http://12factor.net/config) explains the
advantages.

Installation
------------
Add this line to your application's Gemfile:

```ruby
gem 'env-hash-config'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install env-hash-config

Usage
-----
    require 'env_hash_config'

    config = EnvHashConfig.create

To specify default options:

    EnvHashConfig.create default_options: { default: value }

To coerce integer option values:

    EnvHashConfig.create integer_options: [:integer_one, :integer_two]


To preprocess options:

    EnvHashConfig.create do |h|
      h[:sum] = h[:integer_one] + h[:integer_two]
      h.delete :integer_one
      h.delete :integer_two
      h
    end

Development
-----------
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Contributing
------------
Bug reports and pull requests are welcome on GitHub at https://github.com/dinosaurjr10/env-hash-config.

License
-------
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
