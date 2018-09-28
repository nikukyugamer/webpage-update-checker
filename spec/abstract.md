return は true or false
方法は header or md5 or ...?
過去のデータを貯めるとかはしない

Checker.set_uri('https://www.yahoo.co.jp/')
Checker.do('md5', String) #=> true or false (boolean)
Checker.do('sha1', String) #=> true or false (boolean)
Checker.do('header', DiffTimeTypeDatetime) #=> true or false (boolean)

Checker.header #=> 2018-01-01 12:00:00 +0900
Checker.md5 $=> 1234567890abcdef12345677890abcdef
Checker.sha1 $=> 1234567890abcdef12345677890abcdef

md5 と header 以外に調べる方法があればメソッドを追加して拡張すればいいだけ

どういうテストを書くか（最重要）
