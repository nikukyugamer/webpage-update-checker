# メソッド二つ
- 前回の値（日時 or MD5）を与えると更新されたかされないかの boolean が返ってくる
    - 引数は日時 or MD5
    - 日時の型は？
- 日時 or MD5 の値を返す
    - 引数は URI

# ここから下は直感で書いたので今やアンチパターン
Checker.set_uri('https://www.yahoo.co.jp/')
Checker.do('md5', String) #=> true or false (boolean)
Checker.do('sha1', String) #=> true or false (boolean)
Checker.do('header', DiffTimeTypeDatetime) #=> true or false (boolean)

Checker.header #=> 2018-01-01 12:00:00 +0900
Checker.md5 $=> 1234567890abcdef12345677890abcdef
Checker.sha1 $=> 1234567890abcdef12345677890abcdef

md5 と header 以外に調べる方法があればメソッドを追加して拡張すればいいだけ

どういうテストを書くか（最重要）
