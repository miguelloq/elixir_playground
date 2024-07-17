defmodule PeppiPlay do
  @moduledoc """
    Module made to work with some things with the channel Peppidesu
  """

  defmodule Recursion do
    @moduledoc """
    Things based on the video of Peppidesu about Recursion
    https://www.youtube.com/watch?v=7awJDYMXtXE
    """

    @doc """
    Does a list contain a given element?

    Primeiramente codigo em Haskell
    elemExists :: Eq a => a -> [a] -> Bool
    elemExists _ [] = False
    elemExists n (x:_)
    | x == n    = True
    elemExists n (_:xs) = elemExists n xs

    elemExists2 :: Eq a => a -> [a] -> Bool
    elemExists2 _ [] = False
    elemExists2 n (x:xs)
    | x == n    = True
    | otherwise = elemExists n xs

    main :: IO ()
    main = do
    print (elemExists 3 [1, 2, 3, 4])
    print (elemExists 5 [1, 2, 3, 4])
    """
    def elem_exist([], _), do: false
    def elem_exist([head | _], elem) when head == elem, do: true
    def elem_exist([_ | tail], elem), do: elem_exist(tail, elem)

    @doc """
    Is a list sorted or not
    """
    def sorted([]), do: true
    def sorted([head | [secondHead | _]]) when head > secondHead, do: false
    def sorted([_|tail]), do: sorted(tail)
  end
end
