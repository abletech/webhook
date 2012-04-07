# Webhook

Client library for making webhook calls.

## Installation

Add this line to your application's Gemfile:

    gem 'webhook', :git => "git@github.com:AbleTech/webhook.git"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webhook

## Usage

    require 'webhook'

    code, message, body = Webhook.post('http://requestb.in/yadzsfya', :name => 'Abletech', :age => '6')
    if code == '200'
      puts "Success: #{body}"
    else
      puts "Error (#{code}): {message}\n#{body}"
    end

## Testing

    rake spec

[![Build Status](https://secure.travis-ci.org/AbleTech/webhook.png)](http://travis-ci.org/AbleTech/webhook)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request