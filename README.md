# HakoBus Notifier

`hakobus` is a simple tool that notify Hakodate Bus arrival and departure information.

## Description

***DEMO:***

![](https://raw.githubusercontent.com/b4b4r07/screenshots/master/hakobus-notifier/demo.png)

## Installation

To download hakobus-notifier:

	$ git clone https://github.com/b4b4r07/hakobus-notifier
	$ cd hakobus-notifier

And then execute:

	$ bundle install

### Dependencies

- [thor](https://github.com/erikhuda/thor)
- [terminal-notifier](https://github.com/julienXX/terminal-notifier)
- [nokogiri](https://github.com/sparklemotion/nokogiri)
- [anemone](https://github.com/chriskite/anemone)

## Usage

To run notification:

	$ bundle exec hakobus-notifier
	
## Todo

- [ ] Binarize
- [ ] Support automatic notification (crond?)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the [MIT](http://b4b4r07.mit-license.org) License © [b4b4r07](http://b4b4r07.com)
