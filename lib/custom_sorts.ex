defmodule CustomSorts do
  def merge_sort([]), do: []
  def merge_sort([_] = list), do: list

  def merge_sort(list) do
    half_list_index = div(length(list), 2)
    {fleft, fright} = Enum.split(list, half_list_index)
    {left, right} = {merge_sort(fleft), merge_sort(fright)}
    merge(left, right)
  end

  defp merge(left, []), do: left
  defp merge([], right), do: right
  defp merge([h1 | t1], [h2 | _] = right) when h1 <= h2, do: [h1 | merge(t1, right)]
  defp merge(left, [h2 | t2]), do: [h2 | merge(left, t2)]
end
