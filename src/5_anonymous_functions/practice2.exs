fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

# IO.puts(fizzbuzz.(0, 0, 1))
# IO.puts(fizzbuzz.(0, 1, 1))
# IO.puts(fizzbuzz.(1, 0, 1))
# IO.puts(fizzbuzz.(1, 1, 5))

nfizz = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

for n <- [10, 11, 12, 13, 14, 15, 16], do: IO.puts(nfizz.(n))
