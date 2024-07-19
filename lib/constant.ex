defmodule ConstantA  do
  @api_key 12345

  def get_api_key ,do: @api_key
  def get_api_key(:nocons) ,do: 12345
end

defmodule ConstantB do
  defmacro __using__(_) do
    quote do
      @api_key 12345
    end
  end
end

defmodule ModuleForConstantA do
  @api_key ConstantA.get_api_key

  def func() do
    @api_key = 12345
  end
end

defmodule ModuleForConstantB do
  use ConstantB

  def func() do
    @api_key = 12345
  end
end
