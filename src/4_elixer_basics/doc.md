# Elixer の基礎

型

- 値型
  - 整数
    - 10 　進数は\_を含めることができる
    - `1_000_000` で 100 万
    - 整数には決まった最大値はない。その数の大きさにあった内部表現が使われる
  - 浮動小数点数
  - アトム
    - 何かの名前を表現する定数
    - コロンから始まる単一の語(Ruby のシンボルみたいな)
    - アトムは名前がそのまま自身の値になる
  - 正規表現
    - `-r{regexp}` のように書ける
    - 区切り文字はスラッシュでも良いが、エスケープの手間がかかる
    - Perl の正規表現(PCRE)に準拠している

```elixer
# atom
:bun
# regex
Regex.run ~r{[aeiou]}, "caterpillar"
> ["a"]
Regex.scan ~r{[aeiou]}, "caterpillar"
```

- コレクション型
  - タプル
    - コンマ区切りの要素を波括弧で囲む
    - { 1, 2 }
- リスト
  - キーワードリストというのも作れる
- map
  - 辞書型的な
  - キーワードリストとの違い
    - map は同じキーの要素を許容しない
    - キーワードリストは同じキーも複数存在できる

```elixer
# タプルはパターンマッチでも利用可能
{status, count, action} = {:ok, 42, "next"}
> {:ok, 42, "next"}
# 関数の返値として最初の要素がokというアトムを返すのは結構良く使われる
```

リストには便利な演算子が用意されている

```elixer
# 連結
[1,2,3] ++ [4,5]
# 差分
[1,2,3] -- [1,2]
# 含まれるか
1 in [1,2,3,4]
# キーと値のペアの単純なリストの省略記法
# キーワードリストという
a = [name: "bun", age: 18]
a[:name]
# キーワードリストは同じキーの要素も許容される
a = [name: "bun", name: "duplicated"]
> "bun"
# マップ
map = %{ "name" =>  "bun913"}
# マップの型は同じでなくても良い
map = %{:name => "bun", 1 => "b"}
# キーがアトムならキーワードリストと同じ省略記法が使える
map = %{name: "bun", age: 18}
# またアトムなら.記法が使える
map.name
> "bun"
# mapは同じキーを許容しない
map = %{name: "bun", name: "hoge"}
> found quoted keyword "name" but the quotes are not required.
```

ちなみに命名はアンダースコアか、文字で始める必要がある。

慣習として、単語の区切りはスネークケース、インデントは２文字（スペースのみ）

比較演算子

```elixer
a === b #型も含めた厳格な比較 1 === 1.0 はfalse
a !== b # 1 !== 1.0 はtrue
a == b " 1 == 1.0 は true
a > b
a < b
a >= b
# ブール演算子
# 以下は左の引数に true または falseが来ることを期待
a or b
a and b
not a
"a" or true
> ** (BadBooleanError) expected a boolean on left-side of "or", got: "a"
# ゆるい演算
a || b
a && b
!a
```

## 変数のスコープ

レキシカルスコープ。関数のボディが基本単位。

### with 式

- ローカル変数のスコープを定義
  - 計算中に一時的な変数が日宇町になってその変数が外に漏れてほしくない時

```elixer
content = "これが出力される"
lp =
  with {:ok, file} = File.open("/etc/passwd"),
    content = IO.read(file, :all),
    # ↑この変数は外側のスコープに影響を与えない
    :ok = File.close(file),
    # なんか抽出処理とか
  end
IO.puts(lp)
IO.puts(content)
> "これが出力される"
```

with 式のパターンマッチにおいて、パターンマッチのどれかが失敗すると MatchError となる。

= の代わりに <- 演算子を使えば見つけられなかった時に Error の代わりに nil を返す
