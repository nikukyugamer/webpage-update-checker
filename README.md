# Webpage Update Checker
- Gem for checking whether the target webpage is updated.
    - For not only webpage but also image, css and js (resources)

# Usage
```
gem 'webpage_update_checker'
```

```bash
$ bundle install
```

```ruby
require 'webpage_update_checker'

checker = WebpageUpdateChecker::Judge.new
yahoo_md5 = WebpageUpdateChecker::Ways::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')

checker.current_diff_value(yahoo_md5) #=> fb2eeb524e6b5637ef7fa4bed48f1d67
checker.updated?(yahoo_md5, previous_diff_value: 'fb2eeb524e6b5637ef7fa4bed48f1d67') #=> false (not updated)
checker.updated?(yahoo_md5, previous_diff_value: '12345678901234567890123456789012') #=> true (updated)
```

# TODO
- CI
    - CircleCI
- カバレッジ
- バッジ

# LICENSE
[MIT LICENSE](/LICENSE)
