# モジュール・名前付き関数など

`do ... end` は `do:` の糖衣構文

```elixir
# 同じ意味になる
def triple(n), do: n * 3
def triple(n) do
    n * 3
end
```
