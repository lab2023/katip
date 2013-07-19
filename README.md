Katip
=========

This is a Change Logging gem for a git initialized project.

Planned to design a rake which dumps the change log as a list grouped by version tags. Log rows will contain links to commits, commit note and contributer name.

## Installation

To install Katip just use:

gem install katip

When using bundler put it in your Gemfile:

```ruby
source 'https://rubygems.org'

gem 'katip'
```

## Usage

In your git initialized project directory simply run

```sh
  % rake katip:create
  Create CHANGELOG.md
```

and that's it. You have a CHANGELOG.md file generated based on your git commits and created release tags.

#### Links to resources

* Disqussion http://stackoverflow.com/questions/7387612/git-changelog-how-to-get-all-changes-up-to-a-specific-tag
* Example bash https://github.com/kandanapp/kandan/blob/master/gen-changelog.sh
* Example output https://github.com/kandanapp/kandan/blob/master/CHANGELOG.md
* https://github.com/pcreux/pimpmychangelog this repo add support github issue and authors

