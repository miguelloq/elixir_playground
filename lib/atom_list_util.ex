defmodule AtomlistUtil do
  @behaviour Runnable
  def run do
    [:a, :b] |> AtomlistUtil.atomListToString3() |> IO.puts()
  end

  def atomListToString2(list) do
    stringListToString = &for string <- &1, into: "", do: string

    list
    |> Enum.map(&Atom.to_string/1)
    |> stringListToString.()
  end

  def atomListToString3(list) do
    list
    |> Enum.map(&Atom.to_string/1)
    |> Enum.reduce("", fn val, acc -> acc <> val end)
  end

  def atomListToString(list) do
    stringListToString = &stringListToString(&1, "")

    list
    |> Enum.map(&Atom.to_string/1)
    |> stringListToString.()
  end

  defp stringListToString([], stringResult) do
    stringResult
  end

  defp stringListToString([head | tail], stringResult) do
    stringListToString(tail, stringResult <> head)
  end
end
