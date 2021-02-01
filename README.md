# mrubyリリーステスト

# 環境構築

## セットアップするもの
### mruby開発環境
- Cコンパイラ
- CRuby

#### mruby 2.1.2以降、mrubyのビルドにGNU Bisonは不要になりました。

## ソース取得

```bash
$ cd <WORKDIR>  # e.g. ~/mrubytest
$ git clone https://github.com/mruby-Forum/mruby.git
$ cd mruby
$ git checkout <revision/tag for test>  # e.g., 2.1.2-rc2
$ cd ..
$ git clone https://bitbucket.org/scskq/mruby_build_config.git
$ cd mruby_build_config
```

# mrbgemテスト

1. テスト対象mrbgemの指定  
テスト環境毎の XXXXX_mgem_build_config.rb を編集し、テスト対象のmrbgemsのみを有効化して保存する。

2. テスト実行  
mruby_build_configディレクトリ内で以下を実行する。

|Test|Command|Note|
|:--|:--|:--|
|Visual C++ mrbgemテスト|test|makeがインストールされている場合は make msvc でもOK|
|MinGW mrbgemテスト|make mingw|
|Cygwin mrbgemテスト|make cygwin|
|WSL(Win10 bash) mrbgemテスト|make winbash|
|macOS mrbgemテスト|make mac|
|Linux mrbgemテスト|make linux|


# 標準ライブラリテスト

1. mgemlist更新  
```sh
$ ruby mgemcsv.rb
```
2. 前回のテスト結果の削除  
テスト結果を削除する場合には`log`ディレクトリ配下を削除する。

3. テスト実行  
```sh
$ ruby mgemtest.rb
```

# 標準ライブラリテスト (old ver.)

1. core_test_build_config.rbを編集  
テスト環境に応じたコンパイルオプションであるか確認し、必要に応じて編集する。

2. テスト実行

```
$ make core
```

# 評価結果(HTML)の作成

評価結果記入済みの `mruby-x.x.x-mrbgems` (Googleスプレッドシート) をCSV形式で保存して、以下を実行する。

```bash
$ ruby mgemhtml.rb <csvファイル名>
```

あとは、出力される mgemlist.html をメンテする。
