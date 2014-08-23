# Katip

[![Gem Version](https://badge.fury.io/rb/katip.png)](http://badge.fury.io/rb/katip)
[![Code Climate](https://codeclimate.com/github/kebab-project/katip.png)](https://codeclimate.com/github/kebab-project/katip)
[![Dependency Status](https://gemnasium.com/kebab-project/katip.png)](https://gemnasium.com/kebab-project/katip)

This is a Change Logging gem for a git initialized project.

Katip is a gem which dumps the change log as a list grouped by version tags.
It also has an executable ruby file **katip**, which can be used in any git project.
Log rows will contain links to commits, commit note and contributor name.

## Installation

To install Katip just use:

```sh
gem install katip
```

When using bundler put it in your Gemfile:

```ruby
source 'https://rubygems.org'

gem 'katip'
```

## Usage

### Using the executable

In your git initialized project directory simply run

```sh
  % katip
  Create CHANGELOG.md
```

If you want to name your log file other than CHANGELOG.md

```sh
  % katip MyCustomFile.md
  Create MyCustomFile.md
```

Also you can easily specify tag ranges:

```sh
  % katip --from=0.2.0 --to=0.9.1
  # Or
  % katip --from=0.2.0
  # Or
  % katip --to=0.9.1
```

### Using as a rake
Add gem in your Gemfile:

```ruby
source 'https://rubygems.org'

gem 'katip'
```

```sh
  % rake katip:create
  Create CHANGELOG.md
```

If you want to name your log file other than CHANGELOG.md

```sh
  % rake katip:create file=MyCustomFile.md
  Create MyCustomFile.md
```

and that's it. You have your change log file on project root, generated based on your git commits and created release tags.

### Sample output

[CHANGELOG.md](https://github.com/kebab-project/katip/blob/develop/CHANGELOG.md)


## An unforgettable scene from Yeşilçam

[![yaz_kizim](https://i1.ytimg.com/vi/v9L96Hh9jJc/mqdefault.jpg)](http://www.youtube.com/watch?v=v9L96Hh9jJc)

- **Wife:** Open the door, hey  hurry up, Open the door! If you don’t , I will break the door down
- **Şakir (performer Şener Şen):** take a note, 200 pocket cement, 20 truckland pebble, 15 doors
- **Wife:** Şakir!
- **Şakir:** Hey, welcome, 30 trunkland building sand
- **Wife:** the lowest of the low! rogue! Beneath comtempt guy
- **Şakir:** What’s up? Why are you shouting?
- **Wife:** what a shame, don’t answer back.  Women chaser! How could you do this to me?
- **Şakir:** Ooovv. Please don’t start to blame me again
- **Wife:** Son, Spit in your dad’s face
- **Wife:** what a poor bitch! The women who steal my husband  have not been born yet.

## Links to resources

* Disqussion http://stackoverflow.com/questions/7387612/git-changelog-how-to-get-all-changes-up-to-a-specific-tag
* Example bash https://github.com/kandanapp/kandan/blob/master/gen-changelog.sh
* Example output https://github.com/kandanapp/kandan/blob/master/CHANGELOG.md
* https://github.com/pcreux/pimpmychangelog this repo add support github issue and authors

## Bugs and  Feedback

If you discover any bugs or want to drop a line, feel free to create an issue on GitHub.

http://github.com/kebab-project/katip/issues

## Contributing

Katip uses [TomDoc](http://tomdoc.org/), [rDoc](http://rubydoc.info/gems/cybele) and [SemVer](http://semver.org/), and takes it seriously.

Once you've made your great commits:

1. Fork Template
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create a Pull Request from your branch
5. That's it!

## Credits

![lab2023](http://lab2023.com/assets/images/named-logo.png)

- Katip is maintained and funded by [lab2023 - information technologies](http://lab2023.com/)
- Thank you to all the [contributors!](https://github.com/kebab-project/katip/graphs/contributors)
- The names and logos for lab2023 are trademarks of lab2023, inc.

## License

Copyright 2014 lab2023 - information technologies
