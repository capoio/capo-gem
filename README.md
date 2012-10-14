# Capo

![Capo.io](http://capo.io/assets/logo.png)

Command line utility to fetch and manage recipes with [Capo.io](http://capo.io).

## Installation

Add this line to your application's Gemfile:

    gem 'capo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capo

## Usage

Run `capo begin` to set up capistrano in your project. It will create a `Capfile` and `config/deploy.rb` in the folder where you run the command.

Run `capo list` to get a list of aailable recipes. Install recipes with `capo install a_recipe`.

You can get a list of installed recipes with `capo added`.

## About

The [Capo.io](http://capo.io) website and this gem were build in 48 hours for the [2012 Rails Rumble](http://railsrumble.com/).

Both were built by
* [Jeroen Jacobs](https://github.com/jeroenj)
* [Joren De Groof](https://github.com/joren)
* [Steven De Coeyer](https://github.com/zhann)
* [Hannes Fostie](https://github.com/hannesfostie)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
