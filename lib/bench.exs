small_list = Enum.to_list(1..10_000)
big_list = Enum.to_list(1..10_000_000)

Benchee.run(%{
  "small_list_first" => fn -> small_list ++ big_list end,
  "big_list_first" => fn -> big_list ++ small_list end
})
