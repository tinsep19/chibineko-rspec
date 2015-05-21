[![Build Status](https://travis-ci.org/tinsep19/chibineko-rspec.svg?branch=master)](https://travis-ci.org/tinsep19/chibineko-rspec)
[![Code Climate](https://codeclimate.com/github/tinsep19/chibineko-rspec/badges/gpa.svg)](https://codeclimate.com/github/tinsep19/chibineko-rspec)
[![Coverage Status](https://coveralls.io/repos/tinsep19/chibineko-rspec/badge.svg)](https://coveralls.io/r/tinsep19/chibineko-rspec)

# Chibineko::RSpec

chibineko-rspecは[chibineko](http://chibineko.jp)とRSpecを統合します。

ソフトウェアの開発ですべてのテストを自動化することは容易ではなく、少なからず人による確認があります。
chibinekoはそのような部分に対して簡易、且つ有用な機能を提供するサービスです。

chibinekoの開発者による開発の背景、サービスの説明
http://qiita.com/tabbyz/items/6513e84f319843c316d5


chibineko-rspecはRSpecによる自動化されたテストとchibinekoによる人手による確認とをRSpec上に統合し、人手がかかる部分もCIのサイクルに組み込むことを目的にしています。

## インストール

Gemfileにchibineko-rspecを追加し、 `$ bundle install` を実行します。

```ruby

gem 'chibineko-rspec'

```


もしくはgemでインストールします。

    $ gem install chibineko-rspec

## 使い方

Chibineko::RSpec::Helperモジュールをextendして使います。

```ruby
require 'chibineko/rspec'
RSpec.describe "release spec"  do
  extend Chibineko::RSpec::Helper
  include_chibineko("https://chibineko.jp/t/PATH_TO_YOUR_TESTCASE")
end
```

spec_helper.rb内で設定する場合には下記のようにします。

```ruby
require "chibineko/rspec"
RSpec.configure do |c|
  c.extend Chibineko::RSpec::Helper
end
```

## include_chibineko

include_chibineko(url)を使用することにより、
chibinekoのテストケースをRSpec内に展開します。

```ruby
require 'chibineko/rspec'
RSpec.describe "release spec"  do
  extend Chibineko::RSpec::Helper
  include_chibineko("https://chibineko.jp/t/FBguDcDQCiOI8MigD936BA")
end
```

例えば、上記を実行した結果は下記のようになります。

```
chibineko/rspec
  ログイン機能
    ログイン時のプログレスインジケーターの回転が綺麗なこと (FAILED - 1)
  文字入力
    キーボードが表示されたときにテキストフィールドが隠れてしまわないこと
  機種変更
    機種変した際にデータが引き継がれること (FAILED - 2)
    変更前の端末
      変更後の端末で再登録したのでこの端末では操作できないことを伝える (FAILED - 3)
    変更後の端末
      データ移行のあいだ他のアプリの紹介をすること (PENDING: Temporarily skipped with xit)

(中略)

Finished in 0.01376 seconds (files took 3.73 seconds to load)
5 examples, 3 failures, 1 pending

```

[元のテストケース](https://chibineko.jp/t/FBguDcDQCiOI8MigD936BA)と比較してみてください


## 動作概要

chibinekoのCSVのダウンロード機能を使用し、CSVの内容から動的にExampleGroup, Exampleを追加していきます。
その際、ヘッダ部分はExampleGroupとしてグループ化され、項目がExampleへと変換されます。
chibinekoでのテスト結果はそれぞれ、次のように変換されます。
- OK、NG、未実施
  - `it 項目 do ; expect(testcase).to be_ok; end` be_okはテスト結果がOKの場合のみ成功します。
- 保留中 
  - `it 項目 do ; pending ; end`
- 対象外
  - `xit 項目 do ; expect(testcase).to be_ok; end`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/tinsep19/chibineko-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
