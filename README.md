# BenchListCat

Benchmark for list concatenation

## Usage

    mix run lib/bench.exs

## Results from my execution on my computer

    Elixir 1.4.4
    Erlang 20.0-rc2
    Benchmark suite executing with the following configuration:
    warmup: 2.00 s
    time: 5.00 s
    parallel: 1
    inputs: none specified
    Estimated total run time: 14.00 s


    Benchmarking big_list_first...
    Benchmarking small_list_first...

    Name                       ips        average  deviation         median
    small_list_first        6.49 K       0.154 ms   ±371.63%      0.0560 ms
    big_list_first       0.00313 K      319.87 ms    ±37.78%      326.10 ms

    Comparison:
    small_list_first        6.49 K
    big_list_first       0.00313 K - 2077.49x slower

## bench code

    small_list = Enum.to_list(1..10_000)
    big_list = Enum.to_list(1..10_000_000)

    Benchee.run(%{
      "small_list_first" => fn -> small_list ++ big_list end,
      "big_list_first" => fn -> big_list ++ small_list end
    })

## This code is adding a list containing 10 Million elements, which is not typical.
