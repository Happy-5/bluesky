# Bluesky

Your yaml configs are ignored from git?
Tired of mismatching keys and finding out missing keys too late?
Use bluesky to cook your config!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bluesky'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bluesky

## Usage

```ruby
require "pathname"
require "blueksy"
config = 'config/application.yml'
manifest = Pathname.new(__FILE__).relative_path_from(Rails.root)

required_keys = %w[
  SENDGRID_USER_NAME
  SENDGRID_PASSWORD
  SENDGRID_INVITATION_TEMPLATE
  PUSH_SERVICE_HOST
  REDIS_NAMESPACE
  ENVIRONMENT_NAME
]

bluesky = Bluesky.new(required_keys, config: config, manifest: manifest)
bluesky.cook(Figaro.application.configuration)

```

```bash
rails s

...

##########

Missing key from config/application.yml:
  HELLO

(Checked from config/initializers/figaro.rb)

##########

Extra key detected in config/application.yml:
  JWT_SECRET_KEY

Please add to config/initializers/figaro.rb!

Exiting
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bluesky. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

