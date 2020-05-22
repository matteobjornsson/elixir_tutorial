defmodule M do
  def main1 do
    name = IO.gets("what is your name? ") |> String.trim()
    # string interpolation #{}
    IO.puts("Hello #{name}")
  end

  def main do
    string_demo()
  end

  def data_stuff1 do
    my_float = 3.14159
    IO.puts("Float #{is_float(my_float)}")
  end

  def data_stuff do
    IO.puts("Atom #{is_atom(:Pittsburgh)}")
    one_to_10 = 1..10
    IO.puts(:Pittsburgh)
  end

  # Doing stuff with strings
  def string_demo do
    my_str = "My Sentence"
    IO.puts("Length : #{String.length(my_str)}")
    # <> used to concatenate strings
    longer_str = my_str <> " " <> "is longer"
    # three equals signs checks for data type as well as vaue equality
    IO.puts("Equal : #{"Egg" === "egg"}")

    # use the String module for various string functions
    IO.puts("My ? #{String.contains?(my_str, "My")}")

    IO.puts("First : #{String.first(my_str)}")

    IO.puts("Index 4 : #{String.at(my_str, 4)}")

    IO.puts("Substring : #{String.slice(my_str, 3, 8)}")
    my_range = 1..10
    IO.puts("Range : ")
    IO.inspect(Enum.to_list(my_range))

    # Split into a list
    IO.inspect(String.split(longer_str, " "))

    IO.puts(String.reverse(longer_str))
    IO.puts(String.upcase(longer_str))
    IO.puts(String.downcase(longer_str))
    IO.puts(String.capitalize(longer_str))

    (4 * 10) |> IO.puts()
  end

  def do_math do
    IO.puts("5 + 4 = #{5 + 4}")
    IO.puts("5 - 4 = #{5 - 4}")
    IO.puts("5 * 4 = #{5 * 4}")
    IO.puts("5 / 4 = #{5 / 4}")
    # integer division:
    IO.puts("5 div 4 = #{div(5, 4)}")
    # "remainder" equivalent to "modulus"
    IO.puts("5 rem 4 = #{rem(5, 4)}")
  end

  def compare_stuff do
      IO.puts "4 == 4.0 : #{4 == 4.0}"
      IO.puts "4 === 4.0 : #{4 === 4.0}"
      IO.puts "4 != 4.0 : #{4 != 4.0}"
      IO.puts "4 !== 4.0 : #{4 !== 4.0}"

      IO.puts "5 > 4 : #{5 > 4}"

      age = 16

      IO.puts "Vote & Drive : #{(age >= 16) and (age>= 18)}"
      IO.puts "Vote or Drive : #{(age >= 16) or (age>= 18)}"

      # not operator, booleans are lowercase
      IO.puts not true
  end

  def do_logic do
    age = 16

    if age >= 18 do
        IO.puts "Can Vote"
    else
        IO.puts "Can't Vote"
    end

    unless age === 18 do
        IO.puts "you're not 18"
    else
        IO.puts "You are 18"
    end

    cond do
        # executes the first condition that evaluates to true
        age >= 18 -> IO.puts "you can vote"
        age >= 16 -> IO.puts "You can drive"
        age >= 14 -> IO.puts "You can wait"
        # default action:
        true -> IO.puts "default"
    end

    # case operator similar to "switch" operator in other languages
    case 2 do
        1 -> IO.puts "Entered 1"
        2 -> IO.puts "Entered 2"
    end

    # ternary operator if a then do x, else do y
    IO.puts "Ternary : #{if age > 18, do: "can vote", else: "can't vote"}"
  end

  def tuple_demo do
    # ----- TUPLES -----
    # Tuples normally have 2 to 4 values
    # They can hold any value
    # They aren't for enumerating, or
    # cycling through like lists
    # They ar for pattern matching

    #assign a variable to hold the new tuple
    my_stats = {175, 6.25, :Derek}

    IO.puts "Tuple #{is_tuple(my_stats)}"
    # tuples are immutable, so you need to make a new variable to hold a modified tuple
    my_stats2 = Tuple.append(my_stats, 42)

    IO.puts "Age #{elem(my_stats2, 3)}"
    IO.puts "Size : #{tuple_size(my_stats2)}"
    # delete an element
    my_stats3 = Tuple.delete_at(my_stats2, 0)
    # insert value into tuple at index 0
    my_stats4 = Tuple.insert_at(my_stats3, 0, 1974)
    IO.inspect my_stats4
    many_zeroes = Tuple.duplicate(0,5)
    IO.inspect many_zeroes

    {weight, height, name} = {175, 6.25, "Derek"}
    IO.puts "Weight : #{weight}"
  end

  def list_demo do
      list1 = [1,2,3]
      list2 = [4,5,6]
      # add lists together
      list3 = list1 ++ list2
      IO.inspect list3
      list4 = list3 -- [1,4]
      IO.inspect list4
      IO.puts "Is 6 in list4?: #{6 in list4}"

      # Separate the head and tail of list
      [head | tail] = list3
      IO.puts "Head: #{head}"
      IO.write "Tail: "
      IO.inspect tail

      # note that sometimes 'inspect' will have unexpected output
      IO.inspect [98, 97]
      # here you can provide options for the output
      IO.inspect [98, 97], charlists: :as_lists

      #enumerate through each item in tail, print it
      Enum.each tail, fn item ->
        IO.puts item
      end

      words = ["Random", "words", "in a", "list"]
      Enum.each words, fn word ->
        IO.puts word
      end

      display_list(words)

      # some functions for lists
      list5 = List.delete_at(words, 1)
      IO.puts List.first(words)
      IO.puts List.last(words)

      # list of key-value tuples
      my_stats = [name: "Derek", height: 6.25]

  end

  # example of recursive function
  def display_list([word|words]) do
      IO.puts word
      display_list(words)
  end
  # recursion end case
  def display_list([]), do: nil


  def map_demo do
      capitals = %{"Alabama" => "Montgomery",
        "Alaska" => "Juneau", "Arizona" => "Phoenix"}

      IO.puts "Capital of Alaska is #{capitals["Alaska"]}"

      capitals2 = %{alabama: "Montgomery", alaska: "Juneau", arizona: "Phoenix"}

      IO.puts "Capital of Arizona is #{capitals2.arizona}"

      # you can add key value pairs to maps using the Dict module, but as always you need to great a new variable to store it
      capitals3 = Dict.put_new(capitals, "Arkansas", "Little Rock")
  end

  def pattern_matching do
    [length, width] = [20, 30]
    IO.puts "width : #{width}"

    # use underscores to indicate parts you don't care about/aren't assigning
    [_, [_, a]] = [20, [30, 40]]
    IO.puts "Get Num : : #{a}"

  end

  def anonymous_fn do
    get_sum = fn (x, y) -> x + y end
    IO.puts "5 + 5 = #{get_sum.(5,5)}"

    #shorthand version of the above, exactluy the same!! (except minus instead of plus)
    get_less = &(&1 - &2)
    IO.puts "7 - 6 = #{get_less.(7,6)}"


  end



end
