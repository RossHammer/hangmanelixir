defmodule B2Web.Components.Game.WordSoFar do
  use B2Web, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  @states %{
    already_used: "You've already used that letter",
    bad_guess: "That's not in the word",
    good_guess: "Good guess!",
    initializing: "Type or click on your first guess",
    lost: "Sorry, you lost...",
    won: "You won!"
  }

  defp state_name(state) do
    @states[state] || "Unknown state"
  end

  def render(assigns) do
    ~H"""
    <div>
      {@tally.game_state |> state_name}
      <span class="flex gap-3 text-4xl">
        <div
          :for={ch <- @tally.letters}
          class={
            if ch == "_",
              do: "text-gray-500",
              else: "text-green-400"
          }
        >
          {ch}
        </div>
      </span>
    </div>
    """
  end
end
