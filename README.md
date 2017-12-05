# mrubyリリーステスト

# 環境構築

## セットアップするもの
### mruby開発環境
- Cコンパイラ
- GNU Bison
- CRuby


## ソース取得

```bash
$ cd <WORKDIR>  # e.g. ~/mrubytest
$ git clone https://github.com/Kumikomi-Ruby/mruby.git
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

1. core_test_build_config.rbを編集  
テスト環境に応じたコンパイルオプションであるか確認し、必要に応じて編集する。

2. テスト実行

```
$ make core
```
