# モジュール・名前付き関数など

`do ... end` は `do:` の糖衣構文

```elixir
# 同じ意味になる
def triple(n), do: n * 3
def triple(n) do
    n * 3
end
```

## プライベート関数

`defp` で関数宣言するとモジュール内でしか呼び出せないプライベート関数となる

## パイプ演算子

パイプ演算子を使うと次の式の第一パラメーターとして渡す

```elixir
list
|> custom_sort(:asc)
# listの内容はcustom_sortの第一パラメーターとして渡され、:ascは第2パラメーターとなる
```
