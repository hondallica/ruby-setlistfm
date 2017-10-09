# Setlistfm [![Build Status](https://travis-ci.org/hondallica/ruby-setlistfm.svg?branch=master)](https://travis-ci.org/hondallica/ruby-setlistfm)

setlist.fm API client library.

## Installation

    $ gem install setlistfm

## Usage

```ruby
require 'setlistfm'
```

### Setting API key
You must set the API key.

Please refer to the [official API documentation](https://api.setlist.fm/docs/1.0/index.html) on how to get API key.

```ruby
setlistfm = Setlistfm.new('your_api_key')
```

If environment variable SETLISTFM_API_KEY is set in .bash_profile etc, no argument is necessary.

    export SETLISTFM_API_KEY=your_api_key

```ruby
setlistfm = Setlistfm.new
```

### change API key

```ruby
setlistfm.api_key = 'new_api_key'
```

## API URL
### get API URL
```ruby
setlistfm.url # https://api.setlist.fm
```

### change API URL
```ruby
setlistfm.url = 'http://example.com'
```

## API version
### get API version
```ruby
setlistfm.api_version # 1.0
```

### change API version
Usually you do not need to change. Use it if the API version is up.

```ruby
setlistfm.api_version = '1.1'
```

### API Resources
It supports resources of setlist.fm API version 1.0.
Please refer to the [official API documentation](https://api.setlist.fm/docs/1.0/index.html) for available parameters etc.

```ruby
setlistfm.artist('27e2997f-f7a1-4353-bcc4-57b9274fa9a4')
setlistfm.artist_setlists('27e2997f-f7a1-4353-bcc4-57b9274fa9a4', {p: 2})
setlistfm.city(5357527)
setlistfm.search_artists({artistName: 'BABYMETAL'})
setlistfm.search_cities({country: 'US'})
setlistfm.search_countries
setlistfm.search_setlists({artistMbid: '27e2997f-f7a1-4353-bcc4-57b9274fa9a4'})
setlistfm.search_venues({name: 'US'})
setlistfm.setlist_version('6bd6ca6e')
setlistfm.setlist('6bd6ca6e')
setlistfm.user('hondallica')
setlistfm.user_attended('hondallica')
setlistfm.user_edited('hondallica')
setlistfm.venue('6bd6ca6e')
setlistfm.venue_setlists('6bd6ca6e')
```



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
