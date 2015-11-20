Implementations of [Happy Numbers](http://silkandspinach.net/2014/11/08/the-happy-numbers-kata/)

# Haskell 

Simple recursive version that stores the previous steps in the sequence in an array, and checks for duplicates to detect cycles.

Can get up to 250,000,000 numbers in ~5s, with no memoisation:

```
$ time ./happy_numbers 350000000
"Cycle at 89"

real	0m5.752s
user	0m5.506s
sys	0m0.171s
```

I tricked Haskell into evaluating the map by asking for the last element. Seems pretty linear:

```
$ time ./happy_numbers 1
user	0m0.001s

$ time ./happy_numbers 10
user	0m0.002s

$ time ./happy_numbers 100
user	0m0.002s

$ time ./happy_numbers 1000
user	0m0.001s

$ time ./happy_numbers 10000
user	0m0.002s

$ time ./happy_numbers 100000
user	0m0.003s

$ time ./happy_numbers 1000000
user	0m0.020s

$ time ./happy_numbers 10000000
user	0m0.171s

$ time ./happy_numbers 100000000
user	0m1.550s

$ time ./happy_numbers 1000000000
user	0m14.969s
```

# Ruby

Er, right. Less code, less performance ;) Detect cycles with a `Hash` of value to `_` (ie. whatever). Performance was basically the same using `Set`.

Can get up to ~100,000 in ~5s with no memoisation, with simple memoisation in a hash can get around 250,000.

With memoisation, Falls over badly I assume for GC reasons at 1,000,000 elements, or perhaps it's just demonstrating that the runtime complexity is exponential!

```
$ time ruby happy_numbers.rb 1
user	0m0.012s

$ time ruby happy_numbers.rb 10
user	0m0.011s

$ time ruby happy_numbers.rb 100
user	0m0.014s

$ time ruby happy_numbers.rb 1000
user	0m0.017s

$ time ruby happy_numbers.rb 10000
user	0m0.091s

$ time ruby happy_numbers.rb 100000
user	0m1.243s

$ time ruby happy_numbers.rb 1000000
user	0m47.519s
```

## Update

Golfed the Ruby version a bit, prompted by a comment on the original blog post

> I’d be really interested if anyone can avoid conditionals.