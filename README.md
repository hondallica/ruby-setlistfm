# Setlistfm [![Build Status](https://travis-ci.org/hondallica/ruby-setlistfm.svg?branch=master)](https://travis-ci.org/hondallica/ruby-setlistfm)

setlist.fm API client library.
API document https://api.setlist.fm/docs/1.0/index.html

## Installation

    $ gem install setlistfm

## Usage

```ruby
require 'setlistfm'

setlistfm = Setlistfm.new('your_api_key')
```

### Setting API key
If environment variable SETLISTFM_API_KEY is set in .bash_profile etc, no argument is necessary.

    export SETLISTFM_API_KEY=your_api_key

```ruby
setlistfm = Setlistfm.new
```

### change API key

```ruby
setlistfm.api_key = 'new_api_key'
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
