# JustXiangqi

A Xiangqi engine written in ruby. It provides a representation of a xiangqi game complete with rules enforcement and serialisation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'just_xiangqi'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install just_xiangqi

## Usage

To start, a new game state can be instantiated with the default state:

```ruby
  game_state = JustXiangqi::GameState.default
```

Moves can be made by passing in the player number and the from and to ids. It will return true if the move is valid, otherwise it will return false.

```ruby
  game_state.move(1, 'XX', 'YY')
```

The last change with all its details are found in the `last_change` attribute.

```ruby
  game_state.last_change
```

If something unexpected happens, errors may be found in the errors attribute.

```ruby
  game_state.errors
```

Also, the game can be serialized into a hash

```ruby
  game_state.as_json
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrlhumphreys/just_xiangqi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mrlhumphreys/just_xiangqi/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JustXiangqi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mrlhumphreys/just_xiangqi/blob/master/CODE_OF_CONDUCT.md).
