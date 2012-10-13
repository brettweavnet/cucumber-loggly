[![Build Status](https://secure.travis-ci.org/brettweavnet/cucumber-loggly.png)](http://travis-ci.org/brettweavnet/cucumber-loggly)

Run cucumber specs to ensure events are checked.

## Installation

```
gem install cucumber-loggly
```

## Getting Started

By default, cucumber-loggly will look for the default account.

```
cat > ~/.cucumber-loggly.yml << EOF
default:
  username: your_username
  password: your_password
EOF
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
