defmodule B2Web.Components.Game.Alphabet do
  use B2Web, :live_component

  def mount(socket) do
    letters = ?a..?z |> Enum.map(&<<&1::utf8>>)
    {:ok, assign(socket, :letters, letters)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-wrap gap-2 justify-center text-2xl">
      <div
        :for={letter <- @letters}
        phx-click="make_move"
        phx-value-key={letter}
        class={
          cond do
            Enum.member?(@tally.letters, letter) -> "text-green-400"
            Enum.member?(@tally.used, letter) -> "text-red-300"
            true -> "text-blue-300"
          end
        }
      >
        {letter}
      </div>
    </div>
    """
  end
end
