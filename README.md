# Webpage Update Checker
- Gem for checking whether the target webpage is updated.
    - For not only webpage but also image, css and js (resources)

[![Gem Version](https://badge.fury.io/rb/webpage_update_checker.svg)](https://badge.fury.io/rb/webpage_update_checker)
[![CircleCI](https://circleci.com/gh/corselia/webpage-update-checker.svg?style=svg)](https://circleci.com/gh/corselia/webpage-update-checker)

# Usage
```
gem 'webpage_update_checker'
```

```bash
$ bundle install
```

```ruby
require 'webpage_update_checker'

checker = WebpageUpdateChecker::Client.new
target_page_md5 = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')

checker.current_diff_value(target_page_md5) #=> fb2eeb524e6b5637ef7fa4bed48f1d67
checker.updated?(target_page_md5, previous_diff_value: 'fb2eeb524e6b5637ef7fa4bed48f1d67') #=> false (not updated)
checker.updated?(target_page_md5, previous_diff_value: '12345678901234567890123456789012') #=> true (updated)
```

# Methods
You can use these `Methods`.

- LastModified
- Md5
- Sha1
- Sha256
- Sha384
- Sha512

# methods
You can use these methods in each `Methods`.

- `#updated?(checked_object, previous_diff_value:)`
    - `#=> true or false`
- `#current_diff_value(checked_object)`
    - `#=> object such as Time or String (MD5, SHA512...)`

# TODO
- [Coveralls](https://coveralls.io/)
- [Code Climate](https://codeclimate.com/)

# LICENSE
- [MIT LICENSE](/LICENSE)
