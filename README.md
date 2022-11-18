# Hyperwallet Ruby Client
=======
A Ruby wrapper for the Hyperwallet API

A Ruby wrapper for the Hyperwalle API

To get a general overview of API: https://docs.hyperwallet.com/content/hyperwallet-payout-documentation

### Installation
Add this line to your application's Gemfile:
````ruby
  # in your Gemfile
  gem 'hyperwallet-api', '~> 1.0'

  # then...
  bundle install
````

### Usage
````ruby
  client = Hyperwallet::Client.new(
    url: ...,
    username: ...,
    password: ...,
  )

  response = client.list_users

  puts response
````

### History

View the [changelog](https://github.com/taylorbrooks/hyperwallet/blob/master/CHANGELOG.md)
This gem follows [Semantic Versioning](http://semver.org/)

### Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/taylorbrooks/hyperwallet/issues)
- Fix bugs and [submit pull requests](https://github.com/taylorbrooks/hyperwallet/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

### Copyright
Copyright (c) 2022 Taylor Brooks. See LICENSE for details.
