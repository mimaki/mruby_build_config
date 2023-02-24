# mgemtest.rb

- 再テストを容易に
  - 再テスト前に log/mruby-xxxx ディレクトリを削除する  
     (ディレクトリが残っていると正しく実行されない？)
  - mrbgem名で指定可能とする(実行は1mgemのみ)

- タイムアウトさせたい
  - ビルドの途中でハングするケース
  - mrbgemが存在しない場合に cygwin で user/pass 入力となるケース

---

# mgemhtml.rb

- <table>だけでなく、<html>全体を出力する

- CSSは指定しないがフォントくらいは指定しておくべき

```css
font-family	: "ヒラギノ角ゴ Pro W3","Hiragino Kaku Gothic Pro","メイリオ",Meiryo,"ＭＳ Ｐゴシック","MS PGothic",sans-serif;
```

---

# その他

- テストを自動化したい
  - mrbgem側でCI/CDさせる？
  - Lunux上で何かできないか？

- マイコン上でのテストを動かしたい
  - RN4020
    - Raspberry Pi Pico
  - ESP32
    - M5Stack
    - M5Stamp Pico
    - M5Stick
  - Cortex M0+
    - micro:bit v2
  - Cortex M4
    - Plato ???
