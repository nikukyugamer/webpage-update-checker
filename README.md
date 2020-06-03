# Webpage Update Checker
- Gem for checking whether the target webpage is updated.
    - For not only webpage but also image, css and js (resources)

[![Gem Version](https://badge.fury.io/rb/webpage_update_checker.svg)](https://badge.fury.io/rb/webpage_update_checker)
[![CircleCI](https://circleci.com/gh/nikukyugamer/webpage-update-checker.svg?style=svg)](https://circleci.com/gh/nikukyugamer/webpage-update-checker)

# Usage

## Install gem
```
$ vim Gemfile

# Add a line
# gem 'webpage_update_checker'

$ bundle install
```

or

```bash
$ gem install webpage_update_checker
```

## Write your app

### Obtain by MD5
```ruby
require 'webpage_update_checker'

checker = WebpageUpdateChecker::Client.new

target_page_md5 = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
checker.current_comparison_value(target_page_md5) #=> fb2eeb524e6b5637ef7fa4bed48f1d67
```

### Obtain Last-Modified
```ruby
require 'webpage_update_checker'

checker = WebpageUpdateChecker::Client.new

target_page_last_modified = WebpageUpdateChecker::Methods::LastModified.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
checker.current_comparison_value(target_page_last_modified) #=> 2008-03-17 16:05:01 +0000
```

### Obtain HTTP Status Code
```ruby
require 'webpage_update_checker'

checker = WebpageUpdateChecker::Client.new

target_page_http_status_code = WebpageUpdateChecker::Methods::HttpStatusCode.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
checker.current_comparison_value(target_page_http_status_code) #=> 200
```

### Compare by MD5
```ruby
require 'webpage_update_checker'

checker = WebpageUpdateChecker::Client.new

target_page_md5 = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')

checker.current_comparison_value(target_page_md5) #=> fb2eeb524e6b5637ef7fa4bed48f1d67
checker.updated?(target_page_md5, previous_comparison_value: 'fb2eeb524e6b5637ef7fa4bed48f1d67') #=> false (not updated)
checker.updated?(target_page_md5, previous_comparison_value: '12345678901234567890123456789012') #=> true (updated)
```

### Compare by Last-Modified with Lazy Time
- `Lazy Time` comparision means to compare by not accurate datetime but ABOUT datetime
- For example, when latest `Last-Modified` is `2008-03-18 01:05:01 +0000` and `lazy_seconds` is set as '60 * 5', if now getting `Last-Modified` is `2008-03-18 01:07:01 +0000` it does NOT regard as 'Updated'
    - if now getting `Last-Modified` is `2008-03-18 01:08:02 +0000` it DOES regard as 'Updated'

```ruby
require 'webpage_update_checker'

checker = WebpageUpdateChecker::Client.new

current_time_object = WebpageUpdateChecker::Methods::LastModified.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
previous_comparision_value = '2008-03-18 01:00:01 +0900'
lazy_seconds = 60 * 5

checker.lazy_time_updated?(current_time_object, previous_comparison_value: previous_comparision_value, lazy_seconds: lazy_seconds) #=> false
```

# Methods
You can use these `Methods`.

- LastModified
- Md5
- Sha1
- Sha256
- Sha384
- Sha512
- HttpStatusCode

# methods
You can use these methods in each `Methods`.

- `#updated?(checked_object, previous_comparison_value:)`
    - `#=> true or false`
- `#lazy_time_updated?(checked_object, previous_comparison_value:, lazy_seconds:)`
    - `#=> true or false`
- `#current_comparison_value(checked_object)`
    - `#=> object such as Time (LastModified), String (MD5, SHA512...) or Integer (HTTP status code)`

# Note
On v1.3.0, the method name that `current_diff_value` was changed to `current_comparison_value` and the keyword argument name that `previous_diff_value` was changed to `previous_comparison_value`.

So please use `current_comparison_value` method and `previous_comparison_value` keyword argument becuase `current_diff_value` and `previous_diff_value` are deprecated now.

# TODO
- [Coveralls](https://coveralls.io/)
- [Code Climate](https://codeclimate.com/)

# LICENSE
- [MIT LICENSE](/LICENSE)
