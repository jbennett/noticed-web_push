# Noticed::WebPush

This is preliminary work. Pulling contributions from a Noticed PR into a separate gem.


## Usage
How to use my plugin.

## (PLANNED) Installation
Add this line to your application's Gemfile:

```ruby
gem "noticed-web_push"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install noticed-web_push
```

Follow install instructions for example files and generating keys
`rails g noticed:web_push:install`

Mount the engine
```ruby
Rails.application.routes.draw do
  mount Noticed::WebPush::Engine => "/web_push" # this can be anything you want, make sure you update the path in your JS

  # ...
end
```

Run migrations
`rails db:migrate`

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
